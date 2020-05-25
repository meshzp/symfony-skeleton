car-zrt-service
=======================

### xdebug
Before build, run the command below:

```export CRH=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')```

It will set CRH with the docker container IP. CRH is used as xdebug.remote_host (look at docker-compose.yml)

*phpStorm settings:*
* Port `9009`
* Server name and host name: `localhost`
* Absolute path on the server: `/app`

### docker
To start containers:
```$bash
docker build -t car-zrt-service/php:base --build-arg UID=$(id -u) --build-arg GID=$(id -g) -f docker/php/Dockerfile.base docker/php
docker-compose build
docker-compose up -d
```

To remove docker containers:
```$xslt
docker-compose down
```

To see docker containers:
```$xslt
docker-compose ps
```

### Endpoint
For dev environment add the following to your `/etc/hosts` file:
```$xslt
127.0.0.1       car-zrt-service.wkda.develop www.car-zrt-service.wkda.develop
```

Then you will be able to see the endpoint in:
```$xslt
http://car-zrt-service.wkda.develop
```
