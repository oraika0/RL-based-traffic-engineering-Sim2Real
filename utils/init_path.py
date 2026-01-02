import os
import json

def init_paths(env_config, algs_config):
    # Step 1: 讀取 k_paths.json
    k_paths_file = env_config["k_paths_file"]
    with open(k_paths_file, "r") as f:
        k_paths = json.load(f)

    # Step 2: 組裝新的 drl_paths 結構，只取每對 src-dst 的第一條 path（包一層 list）
    drl_paths = {}
    for str_src, dsts in k_paths.items():
        drl_paths[str_src] = {}
        for str_dst, paths in dsts.items():
            if paths:  # 有路徑才處理
                drl_paths[str_src][str_dst] = [paths[0]]  # 包成 list（只有一條）

    # Step 3: 儲存為 drl_paths.json 到指定資料夾
    algs_name = algs_config["algs_name"]
    output_dir = os.path.join("results", algs_name)
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, "drl_paths.json")

    with open(output_path, "w") as f:
        json.dump(drl_paths, f, indent=2)
