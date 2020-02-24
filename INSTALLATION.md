Installation

On the remote

Open some ports on the firewall

Watch some logs in terminals
```
watch docker ps
watch docker stack ps --no-trunc common
watch docker stack ps --no-trunc learnintouch
watch docker stack ps --no-trunc www_thalasoft
watch docker stack ps --no-trunc user-rest-install
watch docker stack ps --no-trunc user-rest
docker service logs -f common_postgresql
docker service logs -f learnintouch_learnintouch
docker service logs -f www_thalasoft_thalasoft
docker service logs -f user-rest-install_user-rest-install
docker service logs -f user-rest_user-rest
docker service logs -f musicng_musicng
```

Create the project directory
```
mkdir -p ~/dev/docker/projects/common;
```

On the local

Create a ~/dev/docker/projects/common/docker-secrets.sh file and run it
```
cd ~/dev/docker/projects/common;
vi docker-secrets.sh
chmod +x docker-secrets.sh
./docker-secrets.sh
```

Build the images
```
cd ~/dev/docker/projects/common;
cd mariadb; ./build.sh; cd ..;
cd postgresql; ./build.sh; cd ..;
cd redis; ./build.sh; cd ..;
cd logrotate; ./build.sh; cd ..;
cd fail2ban; ./build.sh; cd ..;
```

Copy the some files
```
scp ~/dev/docker/projects/common/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/common
scp ~/dev/docker/projects/common/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/common
```

On the remote

Create the volume directories
```
mkdir -p ~/dev/docker/projects/common/volumes/database/data;
mkdir -p ~/dev/docker/projects/common/volumes/database/postgresql/data;
mkdir -p ~/dev/docker/projects/common/volumes/logs/;
mkdir -p ~/dev/docker/projects/common/volumes/letsencrypt/;
```

Create some log files
```
touch ~/dev/docker/projects/common/volumes/logs/redis_6379.log;
touch ~/dev/docker/projects/common/volumes/logs/nodejs.log;
touch ~/dev/docker/projects/common/volumes/logs/letsencrypt.log;
```

Pull the images
```  
docker pull thalasoft.com:5000/mariadb:10.3.12;
docker pull thalasoft.com:5000/postgresql:12.1;
docker pull thalasoft.com:5000/redis:3.0.7;
docker pull thalasoft.com:5000/logrotate;
docker pull thalasoft.com:5000/fail2ban;
```

Create the secrets
```
cd ~/dev/docker/projects/common;
./docker-secrets.sh
```

Read and follow all the INSTALLATION.md files of the project

Start the services
```  
cd ~/dev/docker/projects/common
docker stack deploy --compose-file docker-compose.yml common
```

Stopping the common services
```  
docker stack rm common
```

