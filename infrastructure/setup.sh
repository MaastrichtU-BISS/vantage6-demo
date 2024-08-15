#! /bin/sh

VERSION_NODE=4.4.1
VERSION_SERVER=$VERSION_NODE

python -m venv ./venv
# dot (.) is used instead of source in shell script
. ./venv/bin/activate

pip install -r requirements.txt

# Technically this is not needed, but makes life more easy ;-)
docker pull harbor2.vantage6.ai/infrastructure/server:$VERSION_SERVER
docker pull harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Start server
server_config=$(pwd)/demoserver.yaml
v6 server start --user -c $server_config --image harbor2.vantage6.ai/infrastructure/server:$VERSION_SERVER

# Import server entities
server_entities=$(pwd)/entities.yaml
v6 server import --user -c $server_config $server_entities --image harbor2.vantage6.ai/infrastructure/server:$VERSION_SERVER

# Alpha node start
alpha_config=$(pwd)/alpha.yaml
v6 node start --user -c $alpha_config --image harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Beta node start
beta_config=$(pwd)/beta.yaml
v6 node start --user -c $beta_config --image harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Gamma node start
gamma_config=$(pwd)/gamma.yaml
v6 node start --user -c $gamma_config --image harbor2.vantage6.ai/infrastructure/node:$VERSION_NODE

# Run Vantage6 UI
docker run --rm -d \
    --name vantage6-ui \
    -p 80:80 \
    -e "SERVER_URL=http://localhost:5000" \
    -e "API_PATH=/api" \
    harbor2.vantage6.ai/infrastructure/ui

# Attempt to open browser
echo 'attempt to open http://localhost/'
python -m webbrowser http://localhost/
