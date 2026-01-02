import pickle
import xml.etree.ElementTree as ET
from pathlib import Path
import numpy as np
import re
import json

"""reshaped TM order to match our node order
    "tm_list_train": ['13','15','17','19','20','22','23','00','01','02','04','07','08','09','11'],
    "tm_list_test": ['03', '10', '12', '14', '21'],
"""
    
def parse_ids(intra):
    ids = set()
    for src in intra.findall("./src"):
        ids.add(int(src.attrib["id"]))
        for dst in src.findall("./dst"):
            ids.add(int(dst.attrib["id"]))
    return sorted(ids)

def build_tm(xml_path: Path, id_list=None, scale=1.0, zero_diag=True):
    root = ET.parse(xml_path).getroot()
    intra = root.find("./IntraTM") or root.findall(".//IntraTM")[0]

    # 建立全域 id_list（第一次 XML）
    if id_list is None:
        id_list = parse_ids(intra)

    id2idx = {nid: i for i, nid in enumerate(id_list)}
    n = len(id_list)
    tm = np.zeros((n, n), dtype=np.float32)

    for src in intra.findall("./src"):
        i = id2idx[int(src.attrib["id"])]
        for dst in src.findall("./dst"):
            j = id2idx[int(dst.attrib["id"])]
            tm[i, j] = float(dst.text) * scale /100.0

    if zero_diag:
        np.fill_diagonal(tm, 0.0)

    return tm, id_list

def convert_day_on_the_hour(
    input_dir: str,
    output_dir: str,
    date_str: str = "2005-01-03",
    # hours = range(20),
    hours = [13,15,17,19,20,22,23,0,1,2,4,7,8,9,11,3, 10, 12,14, 21],
    topo_name: str = "GEANT",
    scale: float = 5.0,
):
    """
    Convert only IntraTM-{date_str}-{HH}-00.xml for HH in `hours`.
    Writes ids.json (from HH=00 if present) and PKLs named with date+hour.
    """
    input_dir = Path(input_dir)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Build the ordered list of target XML files
    xml_files = [input_dir / f"IntraTM-{date_str}-{h:02d}-00.xml" for h in hours]
    xml_files = [p for p in xml_files if p.exists()]
    if not xml_files:
        raise FileNotFoundError(f"No XMLs found for date {date_str} in {input_dir}")

    # First file establishes ids.json
    tm0, id_list = build_tm(xml_files[0], id_list=None, scale=scale)
  
    # Save hour 0 (or first available hour) with a date-aware filename
    out0 = output_dir / f"{topo_name}.json_real_0_1.0_traffic-matrix.pkl"
    pickle.dump(tm0, open(out0, "wb"))

    # Process the rest
    for idx, xml in enumerate(xml_files[1:], start=1):
        tm, _ = build_tm(xml, id_list=id_list, scale=scale)
        out = output_dir / f"{topo_name}.json_real_{idx}_1.0_traffic-matrix.pkl"
        pickle.dump(tm, open(out, "wb"))
        print(f"[OK] {xml.name} → {out.name}")
        print(f"total demand : {sum(sum(tm))}")

    print("done!")
    print(f" Date: {date_str}")
    print(f" Hours processed: {[int(x.stem.split('-')[-2]) for x in xml_files]}")
    print(f" Output directory: {output_dir}")
    print(f" Total TM count: {len(xml_files)}")



if __name__ == "__main__":
    # 你要用的參數
    convert_day_on_the_hour(
        input_dir="dataset/geant_traffic/traffic_generator/traffic-matrices", 
        output_dir="algs/teal/traffic-matrices/real", 
        topo_name="GEANT",
        scale=5.0        
    )
