#!/bin/bash

docker build -t stephaneeybert/postgresql:12.1 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/postgresql:12.1 localhost:5000/postgresql:12.1
docker push localhost:5000/postgresql:12.1
docker tag stephaneeybert/postgresql:12.1 europasprak.com:5000/postgresql:12.1
docker push europasprak.com:5000/postgresql:12.1
fi
