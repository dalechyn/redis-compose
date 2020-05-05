#!/bin/bash

# Create red_cluster network
docker network create red-cluster-dev

# Create 6 redis containers
for ind in {1..6}
do
	docker run -d -v $PWD/conf/dev.conf:/usr/local/etc/redis/redis.conf --name redis-dev-$ind -p 127.0.0.1:$(($ind + 6379)):6379 --net red-cluster-dev redis redis-server /usr/local/etc/redis/redis.conf
done

# Create redis cluster with these containers
nodes="$(for ind in {1..6}; do
  echo -n "$(docker inspect -f \
  '{{(index .NetworkSettings.Networks "red-cluster-dev").IPAddress}}' \
  "redis-dev-$ind")"':6379 '; \
done)"

docker run -i --rm --net red-cluster-dev goodsmileduck/redis-cli redis-cli --cluster create $nodes --cluster-replicas 1
