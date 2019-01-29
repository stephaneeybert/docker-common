#!/bin/bash -x

docker build -t stephaneeybert/redis --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/redis localhost:5000/redis
docker push localhost:5000/redis
docker tag stephaneeybert/redis thalasoft.com:5000/redis
docker push thalasoft.com:5000/redis
fi
