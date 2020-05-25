Dokerized Symfony Application
=======================
All the tutorials advice to use Symfony built in web server with ```symfony serve``` command. But there are several problems:
 - xdebug is not enabled
 - conflicts may occur if there are more then one PHP application is running

So I created simple skeleton application, which should good start for starting developing any Symfony 5 application from scratch.

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
