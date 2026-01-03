import os
home = os.path.expanduser("~")
cwd = os.path.getcwd()
config = {
    "conda_sh": home+"/miniconda3/etc/profile.d/conda.sh",
    "conda_env": "sdn1",
    "controller_dir": cwd+"/refactor/utils",
    "controller_entry": "simple_monitor.py"
}
# config = {
#     "conda_sh": "/home/dcnlab/miniconda3/etc/profile.d/conda.sh",
#     "conda_env": "sdn1",
#     "controller_dir": "/home/dcnlab/refactor/utils",
#     "controller_entry": "simple_monitor.py"
# }
