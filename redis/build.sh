#!/bin/bash -x

docker build -t stephaneeybert/redis:3.0.7 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/redis:3.0.7 localhost:5000/redis:3.0.7
docker push localhost:5000/redis:3.0.7
docker tag stephaneeybert/redis:3.0.7 thalasoft.com:5000/redis:3.0.7
docker push thalasoft.com:5000/redis:3.0.7
fi
