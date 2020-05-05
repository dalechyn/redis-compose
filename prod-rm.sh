#!/bin/bash

for ind in {1..6}; do docker rm -f redis-$ind; done
docker network rm red-cluster
