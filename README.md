Starting the common services
```  
docker stack deploy --compose-file docker-compose-dev.yml common
```

Starting the common services in production
```  
docker stack deploy --compose-file docker-compose.yml common
```

Stopping the common services
```  
docker stack rm common
```

Installation

On the local

Build each service
```
cd mariadb; ./build.sh; cd ..;
cd redis; ./build.sh; cd ..;
cd logrotate; ./build.sh; cd ..;
```

Copy the compose file
```
scp dev/docker/projects/common/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/common
```

On the remote

Create the volume directories
```
mkdir volumes;
mkdir volumes/database/;
mkdir volumes/logs/;
mkdir volumes/letsencrypt/;
```

Create some log files
```
touch volumes/logs/redis_6379.log
touch volumes/logs/nodejs.log
```

Pull the images
```  
docker pull thalasoft.com:5000/mariadb:10.3.12
docker pull thalasoft.com:5000/redis:3.0.7
docker pull thalasoft.com:5000/logrotate
```

Read and follow all the README.md files of the services

