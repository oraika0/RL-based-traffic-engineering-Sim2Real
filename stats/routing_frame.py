import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
import json
import pandas as pd
import networkx as nx
import config
# ===========================
# 參數設定
# ===========================
step_idx = config["step_idx"]
algo = config["algo"]
bw_r_file = f'../dataset/{config["topo"]}_traffic/bw_r.txt'
pos_file = f'../dataset/{config["topo"]}_traffic/traffic_generator/pos.json'
metric_file = f'../results/{algo}/net_metrics.csv'
path_file = f'../results/{algo}/drl_paths_list.txt'
max_capacity = 200000
interval_ms = config["interval_ms"]  # 動畫間隔（毫秒）
source_target = config["source_target"]  # 要追蹤的source-destination pair
color = ['red', 'blue', 'purple', 'orange', 'black']

# ===========================
# 函數：畫偏移虛線
# ===========================
def draw_offset_edge(ax, pos, u, v, offset=0.05, **line_kwargs):
    x1, y1 = pos[u]
    x2, y2 = pos[v]
    dx, dy = x2 - x1, y2 - y1
    length = (dx**2 + dy**2)**0.5
    if length == 0:
        return
    offset_x, offset_y = -dy / length * offset, dx / length * offset
    ax.plot([x1 + offset_x, x2 + offset_x], [y1 + offset_y, y2 + offset_y], **line_kwargs)

# ===========================
# 載入資料
# ===========================
def make_frame():
    G = nx.Graph()
    with open(bw_r_file, 'r') as f:
        for line in f:
            parts = line.strip().split(',')
            if len(parts) != 4:
                continue
            node1, node2, delay, bw = map(int, parts)
            G.add_edge(node1, node2, weight=1)

    metric_df = pd.read_csv(metric_file)
    with open(pos_file, 'r') as f:
        pos = json.load(f)
        pos = {int(k): tuple(v) for k, v in pos.items()}

    with open(path_file, 'r') as f:
        path_data = [json.loads(line.strip()) for line in f]

    # ===========================
    # 畫圖
    # ===========================
    fig, ax = plt.subplots(figsize=(12, 10))

    # 畫節點與標籤
    nx.draw_networkx_nodes(G, pos, node_size=500, node_color='lightblue', ax=ax)
    nx.draw_networkx_labels(G, pos, labels={n: str(int(n)) for n in G.nodes()}, ax=ax)

    # 邊顏色（根據剩餘頻寬）
    step_df = metric_df[metric_df['step'] == step_idx]
    edge_colors = []
    for u, v in G.edges():
        match = step_df[((step_df['node1'] == u) & (step_df['node2'] == v)) |
                        ((step_df['node1'] == v) & (step_df['node2'] == u))]
        if not match.empty:
            free_bw = match.iloc[0]['bwd']
            edge_colors.append(free_bw / max_capacity)
        else:
            edge_colors.append(1.0)

    # 畫邊
    edges = nx.draw_networkx_edges(
        G, pos,
        edge_color=edge_colors,
        edge_cmap=plt.cm.viridis,
        edge_vmin=0, edge_vmax=1,
        width=2,
        ax=ax
    )

    # 畫虛線路徑
    data = path_data[step_idx]
    for j, (src, dst) in enumerate(source_target):
        try:
            route = data[str(src)][str(dst)][0]
            for i in range(len(route) - 1):
                draw_offset_edge(
                    ax, pos, route[i], route[i+1],
                    offset=0.03,
                    color=color[j], linestyle='dashed', linewidth=2.0, alpha=0.8
                )
        except KeyError:
            continue

    # 畫圖例
    for idx, (src, dst) in enumerate(source_target):
        y_pos = 0.95 - idx * 0.04
        fig.lines.append(Line2D(
            [0.03, 0.08], [y_pos, y_pos],
            transform=fig.transFigure,
            color=color[idx],
            linestyle='dashed',
            linewidth=2
        ))
        fig.text(0.09, y_pos + 0.0085, f"({src}, {dst})", color='black', fontsize=16, ha='left', va='top')

    # 顏色條與標題
    sm = plt.cm.ScalarMappable(cmap=plt.cm.viridis, norm=plt.Normalize(vmin=0, vmax=1))
    sm._A = []
    cb = plt.colorbar(sm, ax=ax)  # 正確建立 colorbar
    cb.set_label('(Remaining Bandwidth / Max Capacity)', fontsize=16)
    cb.ax.tick_params(labelsize=16)
    plt.figtext(0.5, -0.03, f"(b) Routing strategy of {algo} in TM-141", ha='center', fontsize=20)
    ax.axis('off')
    plt.tight_layout()

    plt.savefig("./results/"+algo+"/frame_"+str(step_idx)+".svg", format='svg', bbox_inches='tight')
#plt.show()

if __name__ == '__main__':
    make_frame()