# DevDB Redis

Redis 2.8.18 in a docker container - for when you need a quick Redis deployment.
You can easily inherit from this container to build, say, a NodeJS container with Redis built-in. See example [here](https://github.com/crowdriff/docker-nodejs).

## Single Node with Ephemeral Storage

```
docker pull devdb/redis:latest
docker run -d --name redis -p 6379:6379 devdb/redis:latest
```

## Single Node with Persistent Storage

```
docker pull devdb/redis:latest
docker run -d --name redis -p 6379:6379 -v /tmp/redis:/var/lib/redis devdb/redis:latest
```

where `/tmp/redis` is where you want it to dump all the data files on your host.

## Cluster

Coming soon!
