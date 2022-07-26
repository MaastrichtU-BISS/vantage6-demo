#! /bin/sh

# ALSO ADD THIS FOLDER TO THE DOCKER LIST OF SHARED RESOURCES ON MACOS!!!
sudo mkdir -p /Library/Application\ Support/vantage6
sudo chown -R $(whoami) /Library/Application\ Support/vantage6

python -m venv ./venv
source ./venv/bin/activate

pip install -r requirements.txt

# Technically this is not needed, but makes life more easy ;-)
#docker pull harbor2.vantage6.ai/infrastructure/server:petronas
docker pull harbor2.vantage6.ai/infrastructure/server:3.2.0
#docker pull harbor2.vantage6.ai/infrastructure/node:petronas
docker pull harbor2.vantage6.ai/infrastructure/node:3.2.0

# Start server
server_config=$(pwd)/beweeghuis.yaml
vserver start -c $server_config

# Import server entities
server_entities=$(pwd)/entities.yaml
vserver import -c $server_config $server_entities

# Fysio node start
fysio_config=$(pwd)/fysio.yaml
vnode start -c $fysio_config

# Ortho node start
ortho_config=$(pwd)/ortho.yaml
vnode start -c $ortho_config