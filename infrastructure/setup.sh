#! /bin/sh

VERSION_NODE=4.4.1
VERSION_SERVER=$VERSION_NODE

python -m venv ./venv
source ./venv/bin/activate

pip install -r requirements.txt

# Technically this is not needed, but makes life more easy ;-)
docker pull harbor2.vantage6.ai/infrastructure/server:$VERSION_SERVER
docker pull harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Start server
server_config=$(pwd)/beweeghuis.yaml
v6 server start --user -c $server_config --image harbor2.vantage6.ai/infrastructure/server:$VERSION_SERVER

# Import server entities
server_entities=$(pwd)/entities.yaml
v6 server import --user -c $server_config $server_entities

# Fysio node start
fysio_config=$(pwd)/fysio.yaml
vnode start --user -c $fysio_config --image harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Ortho node start
ortho_config=$(pwd)/ortho.yaml
vnode start --user -c $ortho_config --image harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE
