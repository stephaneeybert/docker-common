#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos-mysql:8.0.32 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos-mysql:8.0.32 localhost:5000/ubuntuos-mysql:8.0.32
docker push localhost:5000/ubuntuos-mysql:8.0.32
docker tag stephaneeybert/ubuntuos-mysql:8.0.32 europasprak.com:5000/ubuntuos-mysql:8.0.32
docker push europasprak.com:5000/ubuntuos-mysql:8.0.32
fi
