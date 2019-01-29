Starting the common services
```  
docker stack deploy --compose-file docker-compose-dev.yml common
docker stack rm common
```

Starting the common services in production
```  
cd mariadb
docker stack deploy --compose-file docker-compose.yml common
docker stack rm common
```

