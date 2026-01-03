REGISTRY = {}
import torch

from .ls2ic import ls2ic_agent
from .ls2icNXver import ls2icNXver_agent

from .meanfield import meanfield_agent
from .ps_dqn_a import ps_dqn_a_agent
from .ps_dqn import ps_dqn_agent
from .ospf import ospf_agent
from .dijkstra import dijkstraAgent

REGISTRY["ls2ic"] = ls2ic_agent
REGISTRY["ls2icNXver"] = ls2icNXver_agent
REGISTRY["meanfield"] = meanfield_agent
REGISTRY["ps_dqn_a"] = ps_dqn_a_agent
REGISTRY["ps_dqn"] = ps_dqn_agent
REGISTRY["ospf"] = ospf_agent
REGISTRY["dijkstra"] = dijkstraAgent

from .ls2ic import ls2ic 
from .ls2icNXver import ls2icNXver 
from .meanfield import MF_dqn
from .ps_dqn_a import MA_PS_DQN_A
from .ps_dqn import MA_PS_DQN

# === PyTorch 2.6+ safe globals 註冊 ===
torch.serialization.add_safe_globals([
    ls2ic,
    MF_dqn,
    MA_PS_DQN_A,
    MA_PS_DQN
])