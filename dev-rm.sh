#!/bin/bash

for ind in {1..6}; do docker rm -f redis-dev-$ind; done
docker network rm red-cluster-dev
