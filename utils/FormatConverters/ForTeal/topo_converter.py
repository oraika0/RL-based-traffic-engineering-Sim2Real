# Converting usual topologies into teal format
# bighraph

import json
from operator import itemgetter

def convert_format(lines):
    edges = []
    nodes = set()
    for line in lines:
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        parts = [p.strip() for p in line.split(",")]
        if len(parts) < 4:
            continue
        src = int(parts[0])-1
        dst = int(parts[1])-1
        cap = float(parts[3])*1000.0 #mbps to kbps
        nodes.add(src); nodes.add(dst)
        edges.append({"capacity": cap, "source": src, "target": dst})
    
    edges = sorted(edges, key=itemgetter("source", "target"))
    
    return {
        "directed": True,
        "multigraph": False,
        "graph": {},
        "nodes": [{"id": n} for n in sorted(nodes)],
        "links": edges
    }

with open("/home/dcnlab/SDN_TE_2025/dataset/geant_traffic/bw_r.txt", "r", encoding="utf-8") as f:
    lines = f.readlines()
graph = convert_format(lines)
with open("/home/dcnlab/SDN_TE_2025/algs/teal/topologies/GEANT.json", "w", encoding="utf-8") as f:
    json.dump(graph, f, ensure_ascii=False, indent=2)
