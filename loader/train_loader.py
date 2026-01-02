
import pandas as pd
import numpy as np
import time
import json,ast
from statistics import mean
import torch
from utils import setting
import copy
import os
import time
import csv
from algs import REGISTRY as algs_REGISTRY
from numpy import random
from types import SimpleNamespace

import os
import sys
import gym
from gym.envs.registration import register

REFRACTOR_ROOT = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "..")
)

SACD_ROOT = os.path.join(
    REFRACTOR_ROOT,
    "A-Traffic-Engineering-Method-Using-RouteNet-Based-Actor-Critic-Learning-in-SDN-Routing-main",
    "SAC_PL_KP"
)

GYM_GRAPH_ROOT = os.path.join(SACD_ROOT, "gym-graph")

# 1. add SACD root
if SACD_ROOT not in sys.path:
    sys.path.append(SACD_ROOT)

# 2. add gym-graph root (THIS WAS MISSING)
if GYM_GRAPH_ROOT not in sys.path:
    sys.path.append(GYM_GRAPH_ROOT)

from SACD import SACD
import gym_graph

# 3. register env
try:
    gym.spec("GraphEnv-v16")
except gym.error.UnregisteredEnv:
    register(
        id="GraphEnv-v16",
        entry_point="gym_graph.envs.environment16:GraphEnv",
    )


random.seed(17)
np.random.seed(17)
paths_metrics_minmax_dict = {}
link_index = {}

def seed_torch(seed):
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False

def training(config):
    agents = algs_REGISTRY[config["algs_name"]](SimpleNamespace(**config))
    gen_link_index(config)
    mask, link_indices = get_mask(config)
    
    init_minmax_dic(config)
    all_path_list = state_to_action(config)

    size = config["num_node"] + 1
    
    step = 0
    epsilon_ini = config["epsilon_ini"]
    epsilon_final = config["epsilon_final"]
    epsilon = config["epsilon"]
    agent_info_memory = []
    reward_memory = []
    mlu_list = []

    reward_list = []
    reward_list_bwd = []
    reward_list_delay = []
    reward_list_loss = []
    loss_logs = {}
    
    if config.get("rnn", False):
        agents.hidden_states = agents.init_hidden(agents.actor, 1)
    
    waiting_time = 30
    print("waiting ",waiting_time," second, then start training")
    time.sleep(waiting_time)
    
    while True:
        time_in = time.time()
        step += 1
        state, mlu, global_state = get_state(config, mask, link_indices)  
        
        all_reward,all_reward_indicator, loss_value_path, delay_value_path = path_metrics_to_reward(config)
        drl_paths = {}
        agent_info = {}
        start_time = time.time()
        
        if config.get("use_global_state", False):
            input_state = global_state
        else:
            input_state = state
        #print(input_state)
        info = build_info(agents, input_state, epsilon, config, drl_paths)
        action, output_info = agents.get_action([input_state], epsilon, **info)

        (reward_all, reward_bwd, reward_delay, reward_loss, agent_reward_list) = loop_pairs(
            config, size, action, step,
            all_reward, all_reward_indicator,
            all_path_list, drl_paths,
            agent_info_memory, reward_memory
        )
        
        print("get action:", time.time()-start_time)
        
        agent_info = {**info, **output_info}
        agent_info["input_state"] = input_state
        agent_info["action"] = action
                   
        agent_info_memory.append(agent_info)
        reward_memory = agent_reward_list
        out_dir = f"./results/{config['algs_name']}"
        os.makedirs(out_dir, exist_ok=True)
        
        with open(os.path.join(out_dir, "drl_paths.json"),'w') as json_file:
            json.dump(drl_paths, json_file, indent=2)
            
        if step >= 3:
            agents.append_sample(agent_info_memory, input_state, agent_reward_list)
                
            agent_info_memory.pop(0)
            
        if len(agents.memory) > agents.batch_size:
            start_time = time.time()
            loss_dict = agents.update()
            print("update:", time.time()-start_time)
            
            if step % config["softupdate_freq"] == 0:
                agents.update_target()
            
            for name in loss_logs:
                if name not in loss_dict:
                    loss_dict[name] = None

            for name in loss_dict:
                if name not in loss_logs:
                    loss_logs[name] = [None] * step
            
            for name, value in loss_dict.items():
                loss_logs[name].append(float(value) if value is not None else None)
            
            flush_logs(out_dir, {f"{name}.txt": values for name, values in loss_logs.items()})
            
        if step == config["total_timestep"]:
            model_path = f'./results/{config["algs_name"]}/model'
            agents.save_model(model_path)
            return

        output_all_path = os.path.join(out_dir, "output_all.txt")
        save_stepwise_log(output_all_path, agent_reward_list, step)
        
        reward_list.append(float(reward_all))
        mlu_list.append(float(mlu))
        reward_list_bwd.append(int(reward_bwd))
        reward_list_delay.append(int(reward_delay))
        reward_list_loss.append(int(reward_loss))
        
        flush_logs(out_dir, {
            "output.txt":          reward_list,
            "training_mlu.txt":    mlu_list,
            "output_bwd.txt":      reward_list_bwd,
            "output_delay.txt":    reward_list_delay,
            "output_loss.txt":     reward_list_loss,
        })
        
        print("------------------------------------------ step %d ------------------------------------------" % step)
        print("------------------------------------------  epsilon  %f ------------------------------------------   " % epsilon)
        time_end = time.time()
        if epsilon > 0.1:
            epsilon -= (epsilon_ini - 0.1)/config["epsilon_first_phase"]
        elif epsilon > epsilon_final:
            epsilon -= (0.1 - epsilon_final)/config["epsilon_second_phase"]
        if time_end - time_in < 10 :
            time.sleep(10 - (time_end - time_in))
        
def testing(config):
    # test single TM
    if config["algs_name"] == "sacd_nx":
        return testing_sacd_nx(config)
    else:
        return testing_ma(config)

def testing_sacd_nx(config):
    # 目前裡面串進來的dataset 沒用config 裡面的而是直接寫死 
    print("=== SACD-NX SIM2REAL EVAL ===")
    print(config)
    dataset_root_folder = os.path.join(os.getcwd(), "A-Traffic-Engineering-Method-Using-RouteNet-Based-Actor-Critic-Learning-in-SDN-Routing-main","Enero_datasets", "dataset_sing_top", "data", "results_my_3_tops_unif_05-1")
    dataset_folder_name = "NEW_Geant"
    dataset_folder_name = os.path.join(dataset_root_folder, dataset_folder_name)
    
    # ---------- 0. metrics CSV (mininet)----------
    metrics_csv = f"./results/{config['algs_name']}/{config['tm_id']}_eval_metrics.csv"
    if not os.path.exists(metrics_csv):
        with open(metrics_csv, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["avg_delay", "avg_packet_loss", "avg_throughput", "max_link_utilization"])
    # ---------- 0. metrics CSV (networkX)----------
    metrics_NX_csv = f"./results/{config['algs_name']}/{config['tm_id']}_eval_metrics_NX.csv"
    if not os.path.exists(metrics_NX_csv):
        with open(metrics_NX_csv, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["avg_delay", "avg_packet_loss", "avg_throughput", "max_link_utilization"])

    
    # ---------- 1. 建 SACD 用的 graph env ----------
    env_eval = gym.make("GraphEnv-v16")
    env_eval.seed(9)
    env_eval.use_K_path = True

    topo_name = "Geant"
    K = config["action_dim"]
    percentage_demands = config["percentage_demands"]

    env_eval.generate_environment(
        dataset_folder_name + "/EVALUATE",
        topo_name,
        EPISODE_LENGTH=0,
        K=K,
        X=percentage_demands
    )

    # ---------- 2. load 已訓練好的 SACD model ----------
    hyper_parameter = {
        'feature_size': 20,
        't': 4,
        'readout_units': 20,
        'episode': 20,
        'a_lr': 0.0003,
        'c_lr': 0.0015,
        'gamma': 0.99,
        'alpha': 0.2,
        'batch_size': 55,
        'buffer_size': 10000,
        'update_freq': 100,
        'update_times': 10,
        'max_a_dim': 20,
        'avg_a_dim': 20
    }
    SACD_Agent = SACD(hyper_parameter)
    SACD_Agent.K_path = K
    SACD_Agent.target_entropy = 0.5 * (-np.log(1 / K))
    model_dir = os.path.join("A-Traffic-Engineering-Method-Using-RouteNet-Based-Actor-Critic-Learning-in-SDN-Routing-main", "SAC_PL_KP", "models", "Enero_3top_15_B_SAC2025-12-31_01-31-35trained_with_Geant")
    # model_id = 'final'
    SACD_Agent.actor.load_state_dict(torch.load(model_dir + f"/actor_8.pt"))
    SACD_Agent.actor.eval()

    print("load model success....")

    waiting_time = 30
    print("waiting ", waiting_time, " second, then start testing")
    time.sleep(waiting_time)
    
    # ---------- 3. reset TM ----------
    tm_id = int(config["tm_id"])
    demand, source, destination = env_eval.reset(tm_id=tm_id)

    # ---------- 4. 跑「完整 episode」，收集 routing ----------
    print("Running SACD episode to collect routing plan ...")
    routing_plan = {}  # (src, dst) -> chosen path index
    while True:
        with torch.no_grad():
            action_dist, _ = SACD_Agent.predict(env_eval, source, destination, demand)
            action = torch.argmax(action_dist).item()

        # 記錄這個 flow 的決策
        routing_plan[(source, destination)] = action

        # SACD env step（只在 graph env 裡）
        reward, done, error_eval_links, demand, source, destination, maxLinkUti, minLinkUti, utiStd = env_eval.step(
            action, demand, source, destination)
        if done:
            break
        
    # ---------- 5. 轉成 Mininet 要的 drl_paths ----------
    drl_paths = convert_sacd_plan_to_drl_paths(routing_plan, env_eval)


    # # ---------- 6. 比照 MA：step loop ----------
    step = 0
    test_step = config.get("test_step", 30)
    
    drl_paths_path = f"./results/{config['algs_name']}/drl_paths.json"
    print("SACD routing plan dumped.")

    while True:
        time_in = time.time()

        with open(drl_paths_path, "w") as f:
            json.dump(drl_paths, f, indent=2)

        print("Dumped DRL paths")

        # 等 controller 套 routing（跟 MA 行為一致）
        time.sleep(config.get("routing_apply_wait", 5))

        avg_delay, avg_packet_loss, avg_throughput, max_link_utilization = \
            compute_network_metrics(config)

        avg_delay_NX, avg_packet_loss_NX, avg_throughput_NX, max_link_utilization_NX = \
            compute_network_metrics_nx(env_eval, drl_paths, config)
        
        with open(metrics_csv, 'a', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([
                avg_delay, avg_packet_loss, avg_throughput, max_link_utilization
            ])
        
        with open(metrics_NX_csv, 'a', newline='') as csvfileNX:
            writerNX = csv.writer(csvfileNX)
            writerNX.writerow([
                avg_delay_NX, avg_packet_loss_NX, avg_throughput_NX, max_link_utilization_NX
            ])

        print(
            "Eval metrics: delay {:.3f}, loss {:.3f}, throughput {:.3f}, max util {:.3f}%"
            .format(avg_delay, avg_packet_loss, avg_throughput, max_link_utilization)
        )
        print(
            "Eval metrics NX: delay {:.3f}, loss {:.3f}, throughput {:.3f}, max util {:.3f}%"
            .format(avg_delay_NX, avg_packet_loss_NX, avg_throughput_NX, max_link_utilization_NX)
        )

        step += 1
        if step == test_step:
            return

        time_end = time.time()
        if time_end - time_in < setting.MONITOR_PERIOD:
            time.sleep(setting.MONITOR_PERIOD - (time_end - time_in))

# 原本的 testing 都是MA類型 現在被拆成 SA MA
def testing_ma(config):
    # 原本的testing
    size = config["num_node"] + 1

    agents = algs_REGISTRY[config["algs_name"]](SimpleNamespace(**config))
    print("load model...")
    try:
        model_path = f'./results/{config["algs_name"]}/model'
        agents.load_model(model_path)
    except Exception as e:
        print("No model, have to train model first")
        return
                
    print("load model success....")
    all_path_list = state_to_action(config) 
    waiting_time = 30
    print("waiting ",waiting_time," second, then start testing")
    time.sleep(waiting_time)

    mask, link_indices = get_mask(config)
    
    metrics_csv = f"./results/{config['algs_name']}/{config['tm_id']}_eval_metrics.csv"
    if not os.path.exists(metrics_csv):
        with open(metrics_csv, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["avg_delay", "avg_packet_loss", "avg_throughput", "max_link_utilization"])
    
    step = 0
    if config.get("rnn", False):
        agents.hidden_states = agents.init_hidden(agents.actor, 1)
    
    while True:
        time_in = time.time()
        state, _, global_state = get_state(config, mask, link_indices)
        drl_paths = {}
        agent_index = 0
        
        if config.get("use_global_state", False):
            input_state = global_state
        else:
            input_state = state
            
        info = build_info(agents, input_state, 0.0, config, drl_paths={})
        action, _ = agents.get_action([input_state], 0.0, **info)
        
        for i in range(1, size):
            drl_paths.setdefault(str(i), {})
            for j in range(1, size):
                if i != j:
                    if config['algs_name'] == 'dijkstra':
                        drl_paths[str(i)][str(j)] = action[i][j]
                    else:
                        chosen_path = action[agent_index]
                        drl_paths[str(i)][str(j)] = [all_path_list[i][j][chosen_path]]
                    agent_index += 1
        
        drl_paths_path = f"./results/{config['algs_name']}/drl_paths.json"
        
        with open(drl_paths_path, 'w') as json_file:
            json.dump(drl_paths, json_file, indent=2)
        print("Dumped DRL paths")
        
        avg_delay, avg_packet_loss, avg_throughput, max_link_utilization = compute_network_metrics(config)
        
        with open(metrics_csv, 'a', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([avg_delay, avg_packet_loss, avg_throughput, max_link_utilization])
        print("Eval metrics: delay {:.3f}, loss {:.3f}, throughput {:.3f}, max util {:.3f}%".format(
            avg_delay, avg_packet_loss, avg_throughput, max_link_utilization))
        
        step += 1
        if step == config.get("test_step", 30):
            return
        
        time_end = time.time()
        if time_end - time_in < setting.MONITOR_PERIOD:
            time.sleep(setting.MONITOR_PERIOD - (time_end - time_in))

def testing_anime(config):
    
    size = config["num_node"] + 1

    agents = algs_REGISTRY[config["algs_name"]](SimpleNamespace(**config))
    print("load model...")
    try:
        model_path = f'./results/{config["algs_name"]}/model'
        agents.load_model(model_path)
    except Exception as e:
        print("No model, have to train model first")
        return
                
    print("load model success....")
    all_path_list = state_to_action(config) 
    print("Start eval")

    mask, link_indices = get_mask(config)
    
    metrics_csv = f"./results/{config['algs_name']}/anime_eval_metrics.csv"
    if not os.path.exists(metrics_csv):
        with open(metrics_csv, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["avg_delay", "avg_packet_loss", "avg_throughput", "max_link_utilization"])
    
    step = 0
    if config["rnn"]:
        agents.hidden_states = agents.init_hidden(agents.actor, 1)
    
    waiting_time = 30
    print("waiting ",waiting_time," second, then start testing")
    time.sleep(waiting_time)
    
    while True:
        time_in = time.time()
        state, _, global_state = get_state(config, mask, link_indices)
        drl_paths = {}
        agent_index = 0

        if config.get("use_global_state", False):
            input_state = global_state
        else:
            input_state = state

        info = build_info(agents, input_state, 0.0, config, drl_paths={})
        action, _ = agents.get_action([input_state], 0.0, **info)
        
        for i in range(1, size):
            drl_paths.setdefault(str(i), {})
            for j in range(1, size):
                if i != j:
                    if config['algs_name'] == 'dijkstra':
                        drl_paths[str(i)][str(j)] = action[i][j]
                    else:
                        chosen_path = action[agent_index]
                        drl_paths[str(i)][str(j)] = [all_path_list[i][j][chosen_path]]
                    agent_index += 1
        
        drl_paths_path = f"./results/{config['algs_name']}/drl_paths.json"
        
        with open(drl_paths_path, 'w') as json_file:
            json.dump(drl_paths, json_file, indent=2)
        print("Dumped DRL paths")
        
        file = f"./results/{config['algs_name']}/net_info.csv"
        net_metrics = pd.read_csv(file)

        net_metrics['step'] = step

        path = f"./results/{config['algs_name']}/net_metrics.csv"

        if step == 0 or not os.path.exists(path):
            net_metrics.to_csv(path, index=False)
        else:
            net_metrics.to_csv(path, mode='a', header=False, index=False)
        
        path = f"./results/{config['algs_name']}/drl_paths_list.txt"
        save_stepwise_log(path, drl_paths, step)
        
        avg_delay, avg_packet_loss, avg_throughput, max_link_utilization = compute_network_metrics(config)
        
        with open(metrics_csv, 'a', newline='') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow([avg_delay, avg_packet_loss, avg_throughput, max_link_utilization])
        print("Eval metrics: delay {:.3f}, loss {:.3f}, throughput {:.3f}, max util {:.3f}%".format(
            avg_delay, avg_packet_loss, avg_throughput, max_link_utilization))
        
        step += 1
        if step == 100:
            return
        
        time_end = time.time()
        if time_end - time_in < setting.MONITOR_PERIOD:
            time.sleep(setting.MONITOR_PERIOD - (time_end - time_in))

def convert_sacd_plan_to_drl_paths(routing_plan, env):
    num_node = env.numNodes
    drl_paths = {}

    for i in range(1, num_node + 1):
        drl_paths[str(i)] = {}
        for j in range(1, num_node + 1):
            if i == j:
                continue

            key = (i-1, j-1)

            # SACD 有決策的 pair
            if key in routing_plan:
                action = routing_plan[key]
                path = env.allPaths[f"{i-1}:{j-1}"][action]

            # SACD 沒碰到的 pair → shortest paths
            else:
                path = env.shortest_paths[i-1][j-1]

            drl_paths[str(i)][str(j)] = [path]

    return drl_paths


def flush_logs(out_dir, data_dict):
    os.makedirs(out_dir, exist_ok=True)
    for fname, data in data_dict.items():
        with open(os.path.join(out_dir, fname), "w") as f:
            for line in data:
                f.write(f"{line}\n")

def save_stepwise_log(path, data, step):
    mode = 'w' if step == 1 else 'a'
    with open(path, mode) as f:
        f.write(str(data) + '\n')

def build_info(agents, state, epsilon, config, drl_paths):
    info = {}

    if config.get("encode_path", False):
        path_vector  = gen_path_vector(config, drl_paths)
        att_vector   = agents.dqn_model.cal_attention_v(path_vector)[0].detach()
        info["path_vector"] = path_vector
        info["att_vector"] = att_vector

    if config.get("mean_action", False):
        mean_field = agents.prepare_step(state, epsilon)
        info["mean_field"] = [mean_field]

    return info

def loop_pairs(config, size, action, step,
               all_reward, all_reward_indicator,
               all_path_list, drl_paths,
               agent_info_memory, reward_memory):
    """
    return：
       reward_sum, bwd_sum, delay_sum, loss_sum,
       agent_reward_list, agent_delta_list
    """
    r_sum = r_bwd = r_delay = r_loss = 0
    agent_rewards = []
    idx = 0
    
    if step >= 3:
        action_memory = agent_info_memory[0].get("action")

    for i in range(1, size):
        drl_paths.setdefault(str(i), {})
        for j in range(1, size):
            if i == j: continue
            if step >= 3:
                r = all_reward[str(i)][str(j)][action_memory[idx]]
                if config["use_delta_reward"] and step >= 4:
                    agent_rewards.append((r-reward_memory[idx]))
                else:
                    agent_rewards.append(r/100.0)
                r_sum   += r
                r_bwd   += all_reward_indicator[str(i)][str(j)][action_memory[idx]][0]
                r_delay += all_reward_indicator[str(i)][str(j)][action_memory[idx]][1]
                r_loss  += all_reward_indicator[str(i)][str(j)][action_memory[idx]][2]

            
            if config['algs_name'] == 'dijkstra':
                drl_paths[str(i)][str(j)] = action[i][j]
            else:
                chosen = action[idx]
                drl_paths[str(i)][str(j)] = [all_path_list[i][j][chosen]]
            idx += 1
            
    return (r_sum, r_bwd, r_delay, r_loss,
            agent_rewards)

def init_minmax_dic(config):
    #paths_metrics_minmax_dict.setdefault(i, {})
    metrics = ['bwd_paths','delay_paths','loss_paths']
    size = config["num_node"] + 1
    for i in range(1, size):
        paths_metrics_minmax_dict.setdefault(str(i), {})
        for j in range(1, size):
            paths_metrics_minmax_dict[str(i)].setdefault(str(j), {})
            for m in metrics:
                paths_metrics_minmax_dict[str(i)][str(j)].setdefault(m,{})
                paths_metrics_minmax_dict[str(i)][str(j)][m]['min']=100000000
                paths_metrics_minmax_dict[str(i)][str(j)][m]['max']= -1

def path_metrics_to_reward(config):
        
    # read path metrices file
    file = f"./results/{config['algs_name']}/paths_metrics.json"
    rewards_dic = {}
    rewards_indicator = {}
    loss_value = {}
    delay_value = {}
    metrics = ['bwd_paths','delay_paths','loss_paths']
    try:
        with open(file,'r') as json_file:
            paths_metrics_dict = json.load(json_file)
            paths_metrics_dict = ast.literal_eval(json.dumps(paths_metrics_dict))
    except:
        time.sleep(0.35) # wait until file is ok
        with open(file,'r') as json_file:
            paths_metrics_dict = json.load(json_file)
            paths_metrics_dict = ast.literal_eval(json.dumps(paths_metrics_dict))


    for i in paths_metrics_dict:
        rewards_dic.setdefault(i,{})
        rewards_indicator.setdefault(i,{})
        loss_value.setdefault(i,{})
        delay_value.setdefault(i,{})
        for j in paths_metrics_dict[i]:
            rewards_dic.setdefault(j,{})
            rewards_indicator.setdefault(j,{})
            loss_value.setdefault(j,{})
            delay_value.setdefault(i,{})
            loss_value[i][j] = paths_metrics_dict[str(i)][str(j)]['loss_paths'][0]
            delay_value[i][j] = paths_metrics_dict[str(i)][str(j)]['delay_paths'][0]
            for m in metrics:
                if m == metrics[0]:
                    bwd_cost = []
                    for val in paths_metrics_dict[str(i)][str(j)][m][0]:
                        bwd_cost.append(round(val, 15))
                    paths_metrics_dict[str(i)][str(j)][m][0] = bwd_cost
                    paths_metrics_minmax_dict[i][j][m]['max'] = max(paths_metrics_minmax_dict[i][j][m]['max'],max(paths_metrics_dict[str(i)][str(j)][m][0]))
                    paths_metrics_minmax_dict[i][j][m]['min'] = min(paths_metrics_minmax_dict[i][j][m]['min'],min(paths_metrics_dict[str(i)][str(j)][m][0]))
                    met_norm = [normalize(met_val, 0,100, paths_metrics_minmax_dict[i][j][m]['min'], max(paths_metrics_dict[str(i)][str(j)][m][0])) for met_val in paths_metrics_dict[str(i)][str(j)][m][0]]
                elif m == metrics[1]:
                    cost = [] 
                    for val in paths_metrics_dict[str(i)][str(j)][m][0]:
                        if val >1.5 : 
                            temp = 1/val
                            cost.append(round(temp, 15))
                        else:
                            cost.append(round(1/1.5, 15))
                        #cost.append(round(-val - 1e-6, 15))
                    paths_metrics_dict[str(i)][str(j)][m][0] = cost
                    paths_metrics_minmax_dict[i][j][m]['max'] = max(paths_metrics_minmax_dict[i][j][m]['max'],max(cost))
                    paths_metrics_minmax_dict[i][j][m]['min'] = min(paths_metrics_minmax_dict[i][j][m]['min'],min(cost))
                    met_norm = [normalize(met_val, 0, 100, paths_metrics_minmax_dict[i][j][m]['min'], paths_metrics_minmax_dict[i][j][m]['max']) for met_val in paths_metrics_dict[str(i)][str(j)][m][0]]
                elif m == metrics[2]:    
                    cost = [] 
                    for val in paths_metrics_dict[str(i)][str(j)][m][0]:
                        if val > 0.001: #ensure minimum delay available
                            temp = 1/val
                            cost.append(round(temp, 15))
                        else:
                            cost.append(1/0.001)
                        #cost.append(round(-val - 1e-6, 15))
                    paths_metrics_dict[str(i)][str(j)][m][0] = cost
                    paths_metrics_minmax_dict[i][j][m]['max'] = max(paths_metrics_minmax_dict[i][j][m]['max'],max(cost))
                    paths_metrics_minmax_dict[i][j][m]['min'] = min(paths_metrics_minmax_dict[i][j][m]['min'],min(cost))
                    met_norm = [normalize(met_val, 0, 100, paths_metrics_minmax_dict[i][j][m]['min'], paths_metrics_minmax_dict[i][j][m]['max']) for met_val in paths_metrics_dict[str(i)][str(j)][m][0]]
                paths_metrics_dict[str(i)][str(j)][m].append(met_norm)
    
    for i in paths_metrics_dict:
        for j in paths_metrics_dict[i]:
            rewards_actions = []   
            rewards_actions_indicator = []           
            for act in range(20):
                rewards_actions.append(reward(i,j,paths_metrics_dict,act,metrics))
                rewards_actions_indicator.append(rewards_indicator_fun(i,j,paths_metrics_dict,act,metrics))
                rewards_dic[i][j] = rewards_actions
                rewards_indicator[i][j] = rewards_actions_indicator
    return rewards_dic, rewards_indicator, loss_value,delay_value


def normalize(value, minD, maxD, min_val, max_val):
    if max_val == min_val:
        value_n = (maxD + minD) / 2 
    else:
        value_n = (maxD - minD) * (value - min_val) / (max_val - min_val) + minD
    return round(value_n,15)
                    
def get_mask(config):
    net_info_path = f"./results/{config['algs_name']}/net_info.csv"
    net_info = pd.read_csv(net_info_path)
    link_indices = {}  # (node1, node2) -> index
    link_index_counter = 0
    num_nodes = config["num_node"]
    
    for _, row in net_info.iterrows():
        node1, node2 = int(row['node1']), int(row['node2'])
        if (node1, node2) not in link_indices and (node2, node1) not in link_indices:
            link_indices[(node1, node2)] = link_index_counter
            link_indices[(node2, node1)] = link_index_counter
            link_index_counter += 1

    num_links = int(len(link_indices)/2)

    with open(config["k_paths_file"], 'r') as f:
        k_paths = json.load(f)

    num_agents = num_nodes * (num_nodes - 1)
    mask = np.zeros((num_agents, num_links * 3))

    agent_id = 0
    for src in range(1, num_nodes + 1):
        for dst in range(1, num_nodes + 1):
            if src == dst:
                continue

            if str(src) in k_paths and str(dst) in k_paths[str(src)]:
                paths = k_paths[str(src)][str(dst)]
                for path in paths:
                    for i in range(len(path) - 1):
                        link = (path[i], path[i + 1])
                        if link in link_indices:
                            index = link_indices[link]
                            mask[agent_id, index * 3:(index + 1) * 3] = 1
            agent_id += 1
    mask_3d = mask.reshape(num_agents, num_links, 3)
    return mask_3d, link_indices

def load_bwd_table(bw_file_path, link_indices, bidirectional=True):
    num_links = int(len(link_indices) / (2 if bidirectional else 1))
    bwd = np.zeros(num_links)
    link_bwd_map = {}

    with open(bw_file_path, 'r') as f:
        for line in f:
            if not line.strip():
                continue
            parts = line.strip().split(',')
            src, dst, _, bw = int(parts[0]), int(parts[1]), int(parts[2]), float(parts[3])
            link_bwd_map[(src, dst)] = bw
            if bidirectional:
                link_bwd_map[(dst, src)] = bw

    for (src, dst), idx in link_indices.items():
        bwd[idx] = link_bwd_map.get((src, dst), 100000.0)  # default safety value

    return bwd

def get_state(config, masks, link_indices): # get the current network state
    num_links = int(len(link_indices) / 2)
    global_state_2d = np.zeros((num_links, 3), dtype=float)

    bwd = load_bwd_table(config["bw_file"], link_indices, bidirectional=True)
    bwd = bwd * 2000.0

    net_info_file = f"./results/{config['algs_name']}/net_info.csv"
    mlu = 0.0

    try:
        net_info = pd.read_csv(net_info_file)
    except:
        time.sleep(0.35)
        net_info = pd.read_csv(net_info_file)
        
    for i, (_, row) in enumerate(net_info.iterrows()):
        node1, node2 = int(row['node1']), int(row['node2'])
        if (node1, node2) in link_indices:
            index = link_indices[(node1, node2)]

            cur_bwd = row['bwd']
            cur_delay = row['delay'] + 1e-6
            cur_pkloss = row['pkloss']

            mlu = max(mlu, (bwd[index] - cur_bwd) / bwd[index])

            global_state_2d[index, 0] = cur_bwd / bwd[index]  # normalized throughput
            global_state_2d[index, 1] = cur_delay / config.get("delay_norm_div", 200.0)  # configurable
            global_state_2d[index, 2] = cur_pkloss

    global_state_2d_expanded = np.expand_dims(global_state_2d, axis=0)  # (1, num_links, 3)
    local_state = masks * global_state_2d_expanded
    global_state_2d = global_state_2d.flatten()
    return local_state, mlu, global_state_2d

def reward(src, dst, paths_metrics_dict, act, metrics):
    beta1=1
    beta2=1
    beta3=1
    reward = beta1*paths_metrics_dict[str(src)][str(dst)][metrics[0]][1][act] + beta2*paths_metrics_dict[str(src)][str(dst)][metrics[1]][1][act] + beta3*paths_metrics_dict[str(src)][str(dst)][metrics[2]][1][act]
    return round(reward,15)

def rewards_indicator_fun(src, dst, paths_metrics_dict, act, metrics):

    return (paths_metrics_dict[str(src)][str(dst)][metrics[0]][1][act],paths_metrics_dict[str(src)][str(dst)][metrics[1]][1][act],paths_metrics_dict[str(src)][str(dst)][metrics[2]][1][act])


def state_to_action(config): # 20 paths according src,dst
    file = config["k_paths_file"]
    size = config["num_node"] + 1
    paths = []
    with open(file,'r') as json_file:
        paths = json.load(json_file)
    column, row = size, size
    paths_20 = [[0]*row for _ in range(column)]
    for i in range(1, size):
        for j in range(1, size):
            if i != j:
                paths_20[i][j] = paths[str(i)][str(j)]
    return paths_20
    
def compute_network_metrics(config):

    try:
        path = f"./results/{config['algs_name']}/net_info.csv"
        net_info = pd.read_csv(path)
    except Exception as e:
        print("Error reading net_info.csv:", e)
        return 0, 0, 0, 0

    capacity_dict = {}
    try:
        
        with open(config["bw_file"], 'r') as file:
            for line in file:
                data = line.strip().split(',')
                if len(data) < 4:
                    continue
                src, dst, _, bw = int(data[0]), int(data[1]), data[2], float(data[3])
                link = (src, dst)
                reverse_link = (dst, src)
                capacity_dict[link] = bw
                capacity_dict[reverse_link] = bw
    except Exception as e:
        print("Error reading bw_r.txt:", e)
        # 如果讀取失敗，則使用預設容量，例如 200
        capacity_dict = {}

    delays = []
    packet_losses = []
    throughputs = []
    utilizations = []
    for _, row in net_info.iterrows():
        try:
            node1 = int(row['node1'])
            node2 = int(row['node2'])
        except Exception as e:
            continue

        delay = row['delay']
        pkloss = row['pkloss']
        free_bw = row['bwd'] / 1000.0

        cap = capacity_dict.get((node1, node2), 200)
        
        throughput = (2 * cap) - free_bw
        utilization = (2 * cap - free_bw) / (2 * cap)
        
        delays.append(delay)
        packet_losses.append(pkloss)
        throughputs.append(throughput)
        utilizations.append(utilization)
    
    if len(delays) == 0:
        return 0, 0, 0, 0

    avg_delay = np.mean(delays)
    avg_packet_loss = np.mean(packet_losses)
    avg_link_throughput = np.mean(throughputs)
    max_link_utilization = max(utilizations) * 100.0

    return avg_delay, avg_packet_loss, avg_link_throughput, max_link_utilization

def compute_network_metrics_nx(env_eval, drl_paths, config):
    """
    NetworkX-based metric computation aligned with Mininet definition.
    drl_paths: full routing table (including shortest-path fallback)
    """

    # ---------- 1. 讀取 link capacity（單向 cap） ----------
    capacity_dict = {}
    try:
        with open(config["bw_file"], 'r') as file:
            for line in file:
                data = line.strip().split(',')
                if len(data) < 4:
                    continue
                src, dst, _, bw = int(data[0])-1, int(data[1])-1, float(data[3])
                capacity_dict[frozenset((src, dst))] = bw
    except Exception:
        pass

    DEFAULT_CAP = 200.0

    # ---------- 2. 初始化「實體 link」load ----------
    # key: frozenset({u,v}) → used bandwidth (雙向加總)
    link_load = {}

    for u, v in env_eval.graph.edges():
        key = frozenset((u, v))
        link_load[key] = 0.0

    # ---------- 3. 將所有 flow 的 demand 加到 path ----------
    for src in drl_paths:
        for dst in drl_paths[src]:
            if src == dst:
                continue

            path = drl_paths[src][dst][0]
            demand_bw = env_eval.TM[int(src)-1][int(dst)-1]

            for i in range(len(path) - 1):
                u, v = path[i], path[i+1]
                key = frozenset((u, v))
                link_load[key] += demand_bw

    # ---------- 4. 對齊 Mininet 的 throughput / utilization ----------
    throughputs = []
    utilizations = []

    for key, used_bw in link_load.items():
        cap = capacity_dict.get(key, DEFAULT_CAP)

        total_cap = 2 * cap  # 雙向總容量
        throughput = used_bw
        utilization = used_bw / total_cap

        throughputs.append(throughput)
        utilizations.append(utilization)

    if not throughputs:
        return 0.0, 0.0, 0.0, 0.0

    avg_throughput = np.mean(throughputs)
    max_link_utilization = max(utilizations) * 100.0

    # delay / loss：NX 不算，對齊 schema
    avg_delay = 0.0
    avg_packet_loss = 0.0

    return avg_delay, avg_packet_loss, avg_throughput, max_link_utilization

    
def gen_path_vector(config, drl_paths):
    size = config["num_node"] + 1
    path_vector = np.zeros((((size-1)*(size-2)), config["num_link"]))
    agent_idx = 0
    if not drl_paths:
        return path_vector
    for i in range(1, size):
        for j in range(1, size):
            if i != j:
                for k in range(1,len(drl_paths[str(i)][str(j)][0])):
                    link=(drl_paths[str(i)][str(j)][0][k-1],drl_paths[str(i)][str(j)][0][k])
                    reversed_link=(drl_paths[str(i)][str(j)][0][k],drl_paths[str(i)][str(j)][0][k-1])
                    if link in link_index:
                        index = link_index[link]
                    else:
                        index = link_index[reversed_link]
                    path_vector[agent_idx][index] =  100
                agent_idx=agent_idx+1
    return path_vector

def gen_link_index(config):
    with open(config["bw_file"], 'r') as file:
        for line in file:
            data = line.strip().split(',')
            src, dst, _, _ = int(data[0]), int(data[1]), data[2], float(data[3])
            add_link(src,dst)

def add_link(node1, node2):
    link = (node1, node2)
    reversed_link = (node2, node1)

    if link in link_index:
        index = link_index[link]
    elif reversed_link in link_index:
        index = link_index[reversed_link]
    else:
        index = len(link_index) 
        link_index[link] = index
