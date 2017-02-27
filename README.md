## Trying this out as a "Workbench" of sorts for building Picmotron toy app

To build container:

```
docker-compose build
```

To build system:

```
docker-compose run system scripts/build_system.sh -rm
```

To build firmware

```
docker-compose run system scripts/build_firmware.sh -rm
```

To burn firmware

```
docker-compose run system scripts/build_firmware.sh -rm
```

To start terminal session in container
```
docker-compose run system /bin/bash -rm
```


To NUKE all docker images and cache

```
docker kill $(docker ps -q)
docker rm $(docker ps --filter=status=exited --filter=status=created -q)
docker rmi $(docker images -a -q)
```
OR
```
docker ps -qa | xargs docker stop | xargs docker rm
docker images -qa | xargs docker rmi -f
```


alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc && docker volume rm $(docker volume ls --filter dangling=true -q | egrep \'\\w{64}\')'
