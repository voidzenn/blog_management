#!/bin/bash
# Ensure the data directory has the correct permissions
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

# Start Elasticsearch
exec /usr/local/bin/docker-entrypoint.sh elasticsearch
