#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos-mariadb:10.5.19 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos-mariadb:10.5.19 localhost:5000/ubuntuos-mariadb:10.5.19
docker push localhost:5000/ubuntuos-mariadb:10.5.19
docker tag stephaneeybert/ubuntuos-mariadb:10.5.19 europasprak.com:5000/ubuntuos-mariadb:10.5.19
docker push europasprak.com:5000/ubuntuos-mariadb:10.5.19
fi
