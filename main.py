from google.cloud import bigquery
from google.auth.credentials import AnonymousCredentials


project_id = "test"
client = bigquery.Client(
    project=project_id,
    credentials=AnonymousCredentials(),
    client_options={
        "api_endpoint": "http://bigquery:9050",
    },
)

datasets = client.list_datasets()
for dataset in datasets:
    print(dataset.dataset_id)

query = f"""
SELECT id, name FROM `{project_id}.dataset1.table_a`
"""
result = client.query(query)
for row in result:
    print(row)
