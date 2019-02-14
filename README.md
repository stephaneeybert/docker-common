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

Deploying the application  
On the remote host do a pull command
```  
docker pull thalasoft.com:5000/logrotate
docker pull thalasoft.com:5000/redis:3.0.7
docker pull thalasoft.com:5000/mariadb:10.3.12
```

Create some log files
```
touch volumes/logs/redis_6379.log
touch volumes/logs/nodejs.log
```
