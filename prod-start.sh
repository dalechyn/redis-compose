#!/bin/bash

# Create red_cluster network
docker network create red-cluster

# Create 6 redis containers
for ind in {1..6}
do
	docker run -d -v $PWD/conf/prod.conf:/usr/local/etc/redis/redis.conf --name redis-$ind --net red-cluster redis redis-server /usr/local/etc/redis/redis.conf
done

# Create redis cluster with these containers
nodes="$(for ind in {1..6}; do
  echo -n "$(docker inspect -f \
  '{{(index .NetworkSettings.Networks "red-cluster").IPAddress}}' \
  "redis-$ind")"':6379 '; \
done)"

docker run -i --rm --net red-cluster goodsmileduck/redis-cli redis-cli --cluster create $nodes --cluster-replicas 1
