vantage_broker_url = "http://localhost"
vantage_broker_username = "ortho-user"
vantage_broker_password = "ortho-password"

vantage_broker_encryption = None
vantage_broker_port = 5000
vantage_broker_api_path = "/api"


#### Authentication
from vantage6.client import Client
client = Client(vantage_broker_url, vantage_broker_port, vantage_broker_api_path, log_level='critical')
client.authenticate(vantage_broker_username, vantage_broker_password)
client.setup_encryption(vantage_broker_encryption)

#### Get collaborations
import json
collaboration_list = client.collaboration.list()
collaboration_index = 0
organization_ids_ = [ ]

for organization in collaboration_list[collaboration_index]['organizations']:
    organization_ids_.append(organization['id'])
# print(json.dumps(client.node.list(), indent=2))

#### Create and post task
input_ = {
    "master": "true",
    "method":"master", 
    "args": [ ],
    "kwargs": {}
}

task = client.post_task(
    name="RetrieveVariables",
    image="ghcr.io/maastrichtu-biss/v6-colnames-py:latest",
    collaboration_id=collaboration_list[collaboration_index]['id'],#Get the first collaboration associated with user
    input_= input_,
    organization_ids=[organization_ids_[0]]
)

import time
import json
resultObjRef = task.get("results")[0]
resultObj = client.result.get(resultObjRef['id'])
attempts = 1
while((resultObj["finished_at"] == None) and attempts < 10):
    print("waiting...")
    time.sleep(5)
    resultObj = client.result.get(resultObjRef['id'])
    attempts += 1
colnamesLists = resultObj['result']
print(colnamesLists)

#### Wait and fetch results