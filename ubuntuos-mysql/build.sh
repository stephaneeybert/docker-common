#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos-mysql:8.0.19 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos-mysql:8.0.19 localhost:5000/ubuntuos-mysql:8.0.19
docker push localhost:5000/ubuntuos-mysql:8.0.19
docker tag stephaneeybert/ubuntuos-mysql:8.0.19 thalasoft.com:5000/ubuntuos-mysql:8.0.19
#docker push thalasoft.com:5000/ubuntuos-mysql:8.0.19
fi
