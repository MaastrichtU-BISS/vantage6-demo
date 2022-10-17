vantage_broker_url = "http://localhost"
vantage_broker_username = "fysio"
vantage_broker_password = "fysio-password"

vantage_broker_encryption = None
vantage_broker_port = 5000
vantage_broker_api_path = "/api"


#### Authentication
from vantage6.client import Client
client = Client(vantage_broker_url, vantage_broker_port, vantage_broker_api_path)
client.authenticate(vantage_broker_username, vantage_broker_password)
client.setup_encryption(vantage_broker_encryption)

#### Get collaborations
import json
collaboration_list = client.collaboration.list()
collaboration_index = 0
organization_ids_ = [ ]

for organization in collaboration_list[collaboration_index]['organizations']:
    organization_ids_.append(organization['id'])
print(json.dumps(client.node.list(), indent=2))

#### Create and post task
input_ = {
    "master": "true",
    "method":"master", 
    "args": [ ],
    "kwargs": {}
}

task = client.post_task(
    name="RetrieveVariables",
    image="ghcr.io/maastrichtu-biss/v6-colnames-py",
    collaboration_id=collaboration_list[collaboration_index]['id'],#Get the first collaboration associated with user
    input_= input_,
    organization_ids=[organization_ids_]
)

print(json.dumps(task, indent=2))

#### Wait and fetch results