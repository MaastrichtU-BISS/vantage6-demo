from vantage6.client import Client
import json

# Load your configuration settings from a file or environment
config = {
    'server_url': 'http://localhost',
    'server_port': 5000,
    'server_api': '/api',
    'username': 'ortho-user',
    'password': 'ortho-password',
    'organization_key': None
}

client = Client(config['server_url'], config['server_port'], config['server_api'])
client.authenticate(username=config['username'], password=config['password'])
client.setup_encryption(config['organization_key'])

input_ = {
    'method': 'master',
    'kwargs': {
        'time_column_name': 'Survival.time',
        'censor_column_name': 'deadstatus.event',
        'organization_ids': [2, 3, 4], # Example organization IDs
        'bin_size': None  # Or a specific bin size
    }
}

task = client.task.create(
    collaboration=1,  # Use your specific collaboration ID
    organizations=[2, 3, 4],  # List your organization IDs
    name='Kaplan-Meier Task',  # Give your task a specific name
    image='ghcr.io/mdw-nl/v6-km-studyathon:v0.0.16',  # Specify the desired algorithm Docker image version
    description='Survival analysis using Kaplan-Meier',  # Describe the task
    databases=[{'label': 'default'}],  # Use your database label
    input_=input_
)

task_id = task.get('id')
result = client.result.from_task(task_id)["data"][0]["result"]
result = result.replace("\\", "").strip("\"")
result = json.loads(result)

# plot KM curve
import matplotlib.pyplot as plt
plt.step(result["Survival.time"].values(), result["survival_cdf"].values(), linestyle='solid')
plt.xlabel('Days')
plt.ylabel('Percentage')
plt.title('Kaplan Meier curve survival FL')
plt.savefig('km-plot.png')
plt.show()