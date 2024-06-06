# Vantage6 Demo
Demonstration project for Vatnage6.
**Mind this is not a production setting, credentials are hard-coded for demo purposes**

## How to run the infrastructure locally?

### Windows
1. Install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
2. Install [Python (>= 3.8)](https://www.python.org/downloads/), **not via Anaconda** as this is unavailable on the command line
3. Set `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine` in powershell with **administrator privileges**
4. Go to [infrastructure](infrastructure) in command line: `cd <your download location>\infrastructure`
5. Run the setup shell-script `.\setup.ps1`

### Linux (Ubuntu)
1. Install Docker Engine: `curl -fsSL https://get.docker.com | sh`
2. Install Python: `sudo apt install python3 python-as-python3 python3-pip`
3. Go to [infrastructure](infrastructure) in command line: `cd <your download location>/infrastructure`
4. Run the setup shell-script `sh setup.sh`

### macOS
1. Install Docker [Desktop for mac](https://docs.docker.com/desktop/install/mac-install/)
2. Install [Python (>= 3.8)](https://www.python.org/downloads/), **not via Anaconda** as this is unavailable on the command line
3. Go to [infrastructure](infrastructure) in command line: `cd <your download location>/infrastructure`
4. Run the setup shell-script `sh setup.sh`
