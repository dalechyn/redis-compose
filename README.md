# redis-compose
Stupidly simple, scalable redis cluster using `bitnami` images, for deployment on single host.
Nice for redis/docker starters. 

## WARNING
Don't mind using that in production - only basic security things such as master and replica passwords are covered.
You should guard your containers and network by yourself.

## Usage
```bash
docker-compose up --scale sentinel=3
```

## Known issues
1. <b>Master</b> and <b>Replica</b> passwords have to be equal, otherwise <b>Sentinel</b> marks slave as subjectively down. More [#1](https://github.com/h0tw4t3r/redis-compose/issues/1).
2. After failovering master, it fails to sync with new master. More [#2](https://github.com/h0tw4t3r/redis-compose/issues/2).
