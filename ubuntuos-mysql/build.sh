#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos-mysql:8.0.15 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos-mysql:8.0.15 localhost:5000/ubuntuos-mysql:8.0.15
docker push localhost:5000/ubuntuos-mysql:8.0.15
docker tag stephaneeybert/ubuntuos-mysql:8.0.15 thalasoft.com:5000/ubuntuos-mysql:8.0.15
#docker push thalasoft.com:5000/ubuntuos-mysql:8.0.15
fi
