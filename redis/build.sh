#!/bin/bash -x

docker build -t stephaneeybert/redis:7.0.8 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/redis:7.0.8 localhost:5000/redis:7.0.8
docker push localhost:5000/redis:7.0.8
docker tag stephaneeybert/redis:7.0.8 europasprak.com:5000/redis:7.0.8
docker push europasprak.com:5000/redis:7.0.8
fi
