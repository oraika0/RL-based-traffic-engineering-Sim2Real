import json
from collections import defaultdict
import pandas as pd

# 演算法與檔案路徑對應
algorithms = {
    "LS2IC": "../results/ls2ic/drl_paths_list.txt",
    "MADQN": "../results/ps_dqn/drl_paths_list.txt",
    "MADQN-PA": "../results/ps_dqn_a/drl_paths_list.txt",
    "MF-Q": "../results/meanfield/drl_paths_list.txt"
}

# 儲存每個演算法的統計結果
algo_link_usage = {}

# 統計每個演算法的 link 使用次數
for algo, path_file in algorithms.items():
    link_usage = defaultdict(int)

    with open(path_file, "r") as f:
        for line in f:
            step_data = json.loads(line.strip())
            for str_src in step_data:
                for str_dst in step_data[str_src]:
                    routes = step_data[str_src][str_dst]
                    if not routes:
                        continue
                    path = routes[0]
                    for u, v in zip(path[:-1], path[1:]):
                        edge = tuple(sorted((u, v)))
                        link_usage[edge] += 1

    algo_link_usage[algo] = link_usage

# 找出所有出現在任一演算法 Top 10 的鏈路（聯集）
top_links_set = set()
for usage_dict in algo_link_usage.values():
    top_links = sorted(usage_dict.items(), key=lambda x: -x[1])[:10]
    top_links_set.update([link for link, _ in top_links])

# 建立統一表格
all_links = sorted(top_links_set)
table_data = []

for link in all_links:
    row = {"Link": f"{link}"}
    for algo in algorithms.keys():
        usage = algo_link_usage[algo].get(link, 0)
        row[algo] = usage
    table_data.append(row)

# 輸出為 DataFrame 並存成 CSV
df = pd.DataFrame(table_data)
df.to_csv("../results/compare/link_usage_comparison.csv", index=False)

