# 原始單位跟轉換出來的單位都是 kbps
import os
import xml.etree.ElementTree as ET

# ====== 使用者可調參數 ======
INPUT_DIR = os.path.join(
    os.getcwd(),
    "dataset",
    "geant_traffic",
    "traffic_generator",
    "traffic-matrices"
)

OUTPUT_PREFIX = "Geant"        # Geant.0.demands
MAX_TM = None                  # None = 全部
FILTER_SRC_EQ_DST = True       # 過濾 src == dst
scale = 5                      # 把問題變難 5 倍
downscale = 0.01               # TM / topo 縮小 100 倍

# 👉 新增的控制參數
START_TM = "IntraTM-2005-01-03-00-00.xml"  # 從 1/3 整點開始
ONLY_HOUR_00 = True                        # 只抓整點
# ==========================


def parse_tm_file(xml_path):
    tree = ET.parse(xml_path)
    root = tree.getroot()

    intra_tm = root.find("IntraTM")
    if intra_tm is None:
        raise RuntimeError(f"No <IntraTM> in {xml_path}")

    tm_dict = {}
    max_node_id = -1

    for src_elem in intra_tm.findall("src"):
        src = int(src_elem.attrib["id"]) - 1
        max_node_id = max(max_node_id, src)

        for dst_elem in src_elem.findall("dst"):
            dst = int(dst_elem.attrib["id"]) - 1
            max_node_id = max(max_node_id, dst)

            bw = float(dst_elem.text.strip())
            if FILTER_SRC_EQ_DST and src == dst:
                continue

            tm_dict[(src, dst)] = bw * scale * downscale

    num_nodes = max_node_id + 1

    # 補齊完整 src,dst
    demands = []
    for src in range(num_nodes):
        for dst in range(num_nodes):
            if src == dst:
                continue
            bw = tm_dict.get((src, dst), 0.0)
            demands.append((src, dst, bw))

    return demands


def main():
    # 讀取所有 IntraTM xml
    files = sorted(
        f for f in os.listdir(INPUT_DIR)
        if f.startswith("IntraTM") and f.endswith(".xml")
    )

    # === 關鍵 1：從 2005-01-03-00-00 之後開始 ===
    files = [f for f in files if f >= START_TM]

    # === 關鍵 2：只取整點（分鐘 == 00）===
    if ONLY_HOUR_00:
        files = [f for f in files if f.endswith("-00.xml")]

    # 限制最多處理多少 TM
    if MAX_TM is not None:
        files = files[:MAX_TM]

    print(f"[INFO] Found {len(files)} TM files to convert")
    if files:
        print("[INFO] First TM:", files[0])
        print("[INFO] Last  TM:", files[-1])

    for idx, fname in enumerate(files):
        xml_path = os.path.join(INPUT_DIR, fname)
        demands = parse_tm_file(xml_path)

        out_name = f"{OUTPUT_PREFIX}.{idx}.demands"
        out_dir = os.path.join(os.getcwd(), "ConvertTMForEnero")
        out_path = os.path.join(out_dir, out_name)
        os.makedirs(out_dir, exist_ok=True)

        with open(out_path, "w") as f:
            f.write(f"DEMANDS {len(demands)}\n")
            f.write("label src dest bw\n")
            for i, (src, dst, bw) in enumerate(demands):
                f.write(f"demand_{i} {src} {dst} {bw:.6f}\n")

        print(f"[OK] {fname} -> {out_name} ({len(demands)} demands)")


if __name__ == "__main__":
    main()


# # 原始單位跟轉換出來的單位都是 kbps
# import os
# import re
# import xml.etree.ElementTree as ET

# # ====== 使用者可調參數 ======
# INPUT_DIR = os.path.join(os.getcwd(), "dataset", "geant_traffic", "traffic_generator", "traffic-matrices")

# OUTPUT_PREFIX = "Geant"   # Geant.0.demands
# MAX_TM = 2020             # 例如 24；None = 全部
# ONLY_SUBSET = True     # 只取 MM == 00
# FILTER_SRC_EQ_DST = True  # 過濾 src == dst
# scale = 5                 # 把問題變難 5 倍 （家德）
# downscale = 0.01          # 把 TM 跟 topo 都縮小100倍
# # ==========================


# def parse_tm_file(xml_path):
#     tree = ET.parse(xml_path)
#     root = tree.getroot()

#     intra_tm = root.find("IntraTM")
#     if intra_tm is None:
#         raise RuntimeError(f"No <IntraTM> in {xml_path}")

#     # (src, dst) -> bw
#     tm_dict = {}
#     max_node_id = -1

#     for src_elem in intra_tm.findall("src"):
#         src = int(src_elem.attrib["id"]) - 1
#         max_node_id = max(max_node_id, src)

#         for dst_elem in src_elem.findall("dst"):
#             dst = int(dst_elem.attrib["id"]) - 1
#             max_node_id = max(max_node_id, dst)

#             bw = float(dst_elem.text.strip())
#             if FILTER_SRC_EQ_DST and src == dst:
#                 continue

#             tm_dict[(src, dst)] = bw*scale*downscale

#     num_nodes = max_node_id + 1

#     # === 補齊完整 src,dst ===
#     demands = []
#     for src in range(num_nodes):
#         for dst in range(num_nodes):
#             if src == dst:
#                 continue
#             bw = tm_dict.get((src, dst), 0.0)
#             demands.append((src, dst, bw))

#     return demands



# def main():
#     # 抓所有 IntraTM xml
#     files = sorted(
#         f for f in os.listdir(INPUT_DIR)
#         if f.startswith("IntraTM") and f.endswith(".xml")
#     )

#     # 只取分鐘 == 00
#     if ONLY_SUBSET:
#         files = [
#             f for f in files
#             if re.match(r".*-2005-01-03-\d{2}-00\.xml$", f)
#         ]

#     if MAX_TM is not None:
#         files = files[:MAX_TM]

#     print(f"[INFO] Found {len(files)} TM files to convert")

#     for idx, fname in enumerate(files):
#         xml_path = os.path.join(INPUT_DIR, fname)
#         demands = parse_tm_file(xml_path)

#         out_name = f"{OUTPUT_PREFIX}.{idx}.demands"
#         out_dir = os.path.join(os.getcwd(), "ConvertTMForEnero")
#         out_path = os.path.join(out_dir, out_name)
#         os.makedirs(out_dir, exist_ok=True)
#         with open(out_path, "w") as f:
#             f.write(f"DEMANDS {len(demands)}\n")
#             f.write("label src dest bw\n")
#             for i, (src, dst, bw) in enumerate(demands):
#                 f.write(f"demand_{i} {src} {dst} {bw:.6f}\n")

#         print(f"[OK] {fname} -> {out_name} ({len(demands)} demands)")


# if __name__ == "__main__":
#     main()

