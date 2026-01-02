import os
import json
import networkx as nx
from itertools import islice

def k_shortest_paths(graph, src, dst, k, weight='weight'):
    try:
        return list(islice(nx.shortest_simple_paths(graph, src, dst, weight=weight), k))
    except nx.NetworkXNoPath:
        return []  # 如果沒有路徑，回傳空清單

def all_k_shortest_paths(graph, k=20):
    """
    對圖中所有 src ≠ dst 的節點對，計算前 k 條最短路徑
    回傳格式為 dict[src][dst] = [path1, path2, ..., pathk]
    """
    paths = {}
    for src in graph.nodes():
        paths[str(src)] = {}
        for dst in graph.nodes():
            if src != dst:
                path_list = k_shortest_paths(graph, src, dst, k)
                if path_list:
                    paths[str(src)][str(dst)] = path_list
    return paths

def build_graph_from_bw_r(file_path):
    G = nx.Graph()

    # Step 1: 讀取並排序所有連線
    edges = []
    with open(file_path, 'r') as f:
        for line in f:
            parts = line.strip().split(',')
            if len(parts) != 4:
                continue
            node1, node2 = int(parts[0]), int(parts[1])
            bwd_cap = float(parts[3])
            edge = tuple(sorted((node1, node2)))
            edges.append((edge[0], edge[1], bwd_cap))

    # Step 2: 按照 (node1, node2) 排序
    seen = set()
    unique_edges = []
    for n1, n2, bwd in sorted(edges):
        if (n1, n2) not in seen:
            seen.add((n1, n2))
            unique_edges.append((n1, n2, bwd))
    # Step 3: 加入到圖中（不加權）
    for node1, node2, bwd_cap in unique_edges:
        if bwd_cap > 0:
            G.add_edge(node1, node2, weight=1.0 / bwd_cap)
        else:
            print(f"[Warning] Link ({node1}, {node2}) has zero bwd_cap, skipped.")

    return G

def generate_k_paths(bw_r_path, output_path, k=20):
    G = build_graph_from_bw_r(bw_r_path)
    k_paths = all_k_shortest_paths(G, k=k)
    
    sorted_k_paths = {
        str(src): {
            str(dst): k_paths[str(src)][str(dst)]
            for dst in sorted(map(int, k_paths[str(src)].keys()))
        }
        for src in sorted(map(int, k_paths.keys()))
    }
    
    with open(output_path, 'w') as f:
        json.dump(sorted_k_paths, f, indent=2)

if __name__ == "__main__":
    dataset_folder = "32node_traffic"
    bw_r_file = os.path.join(dataset_folder, "bw_r.txt")
    output_file = os.path.join(dataset_folder, "k_paths.json")
    generate_k_paths(bw_r_file, output_file, k=20)
