#!/bin/bash

# Create shared network only if it doesn't exist
docker network inspect global_network >/dev/null 2>&1 || \
docker network create --driver bridge global_network
