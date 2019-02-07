Starting the common services
```  
docker stack deploy --compose-file docker-compose-dev.yml common
```

Starting the common services in production
```  
docker stack deploy --compose-file docker-compose.yml common
```

Stoppin the common services
```  
docker stack rm common
```

