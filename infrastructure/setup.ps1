python -m venv .\venv
.\venv\Scripts\activate

pip install -r requirements.txt

# Technically this is not needed, but makes life more easy ;-)
#docker pull harbor2.vantage6.ai/infrastructure/server:petronas
docker pull harbor2.vantage6.ai/infrastructure/server:3.2.0
#docker pull harbor2.vantage6.ai/infrastructure/node:petronas
docker pull harbor2.vantage6.ai/infrastructure/node:3.2.0

# Start server
$server_config = $(Convert-Path -path $(Resolve-Path beweeghuis.yaml))
vserver start -c $server_config

# Import server entities
$server_entities = $(Convert-Path -path $(Resolve-Path entities.yaml))
vserver import -c $server_config $server_entities

# Fysio node start
$fysio_config = $(Convert-Path -path $(Resolve-Path fysio.yaml))
vnode start -c $fysio_config

# Ortho node start
$ortho_config = $(Convert-Path -path $(Resolve-Path ortho.yaml))
vnode start -c $ortho_config