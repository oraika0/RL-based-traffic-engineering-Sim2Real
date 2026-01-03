from pathlib import Path
import os, pwd

def get_user_home():
    sudo_user = os.environ.get("SUDO_USER")
    if sudo_user:
        return Path(pwd.getpwnam(sudo_user).pw_dir)
    return Path.home()

def find_repo_root(start: Path):
    for p in [start] + list(start.parents):
        if (p / "run_drl.py").exists():
            return p
    raise RuntimeError("Cannot find repo root")

BASE_DIR = find_repo_root(Path(__file__).resolve())
USER_HOME = get_user_home()

config = {
    "conda_sh": str(USER_HOME / "miniconda3" / "etc" / "profile.d" / "conda.sh"),
    "conda_env": "sdn1",
    "controller_dir": str(BASE_DIR / "utils"),
    "controller_entry": "simple_monitor.py",
}
