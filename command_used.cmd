docker exec -it postgres /bin/bash 

psql -U username -d database_name 

# Command to create debezium connectors in debezium container handles decimal values as strings

curl -H 'Content-Type: application/json' localhost:8083/connectors --data
'{"name":"postgres-connector",
    "config":
        {"connector.class":"io.debezium.connector.postgresql.PostgresConnector",
        "topic.prefix": "cdc",
        "database.user": "postgres",
        "database.dbname": "financial_db",
        "database.hostname": "postgres",
        "database.password": "postgres",
        "name": "kafka-cdc-postgres",
        "plugin.name": "pgoutput",
        "topic.prefix":"cdc",
        "decimal.handling.mode":"string"
        }
}'