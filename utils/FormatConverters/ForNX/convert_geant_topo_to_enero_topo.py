import os
# Enero input graph capacity 是 kbps, ls2ic 那邊是 mbps
# ===== 使用者可調參數 =====
INPUT_FILE = os.path.join(os.getcwd(), "dataset", "geant_traffic", "bw_r.txt")       # 你的原始 edge list
OUTPUT_FILE = os.path.join(os.getcwd(), "utils", "FormatConverters", "Geant.graph")  # 輸出的 topology 檔

WEIGHT = 8840
DELAY = 1

ONE_BASED = True   # GEANT 通常是 1-based；如果不是，改成 False
# =========================


def main():
    edges = []
    max_node_id = -1

    # --- 讀取 edge list ---
    with open(INPUT_FILE, "r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue

            parts = line.split(",")
            if len(parts) < 4:
                continue

            src = int(parts[0])
            dst = int(parts[1])
            bw = float(parts[3])
            bw *= 1000 #mbps to kbps

            if ONE_BASED:
                src -= 1
                dst -= 1

            edges.append((src, dst, bw))
            max_node_id = max(max_node_id, src, dst)

    num_nodes = max_node_id + 1
    num_edges = len(edges)

    edges.sort(key=lambda x: (x[0], x[1]))

    # --- 寫出 topology ---
    with open(OUTPUT_FILE, "w") as f:
        # ===== NODES =====
        f.write(f"NODES {num_nodes}\n")
        f.write("label x y\n")
        for i in range(num_nodes):
            f.write(f"N{i} 0.0 0.0\n")

        f.write("\n")

        # ===== EDGES =====
        f.write(f"EDGES {num_edges}\n")
        f.write("label src dest weight bw delay\n")

        for i, (src, dst, bw) in enumerate(edges):
            f.write(
                f"Link_{i} {src} {dst} {WEIGHT} {bw} {DELAY}\n"
            )

    print(f"[OK] Converted {num_edges} edges")
    print(f"[OK] Nodes: {num_nodes}")
    print(f"[OK] Output: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
