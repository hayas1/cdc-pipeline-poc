#!/bin/bash -e

docker network create devcontainer-network
docker-compose -f cdc-compose.yaml up --build -d

until docker-compose -f cdc-compose.yaml exec -T kafka kafka-topics.sh --list --bootstrap-server=localhost:9092; do
    sleep 1
done
topics=$(docker-compose -f cdc-compose.yaml exec -T kafka kafka-topics.sh --list --bootstrap-server=localhost:9092)
echo "$topics" | grep debezium_configs
echo "$topics" | grep debezium_offsets
echo "$topics" | grep debezium_statuses

until curl -i http://localhost:8083/connectors | grep "200 OK"; do
    sleep 1
done
curl http://localhost:8083/connectors -H 'Content-Type: application/json' -X POST -d @debezium-mysql-connector.json

topics=$(docker-compose -f cdc-compose.yaml exec -T kafka kafka-topics.sh --list --bootstrap-server=localhost:9092)
echo "$topics" | grep mysql_hostname
echo "$topics" | grep mysql_hostname.sample_schema.employee
echo "$topics" | grep schemahistory.sample_schema

docker-compose -f cdc-compose.yaml down
