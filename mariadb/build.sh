#!/bin/bash -x

docker build -t stephaneeybert/mariadb:10.5.9 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/mariadb:10.5.9 localhost:5000/mariadb:10.5.9
docker push localhost:5000/mariadb:10.5.9
docker tag stephaneeybert/mariadb:10.5.9 thalasoft.com:5000/mariadb:10.5.9
docker tag stephaneeybert/mariadb:10.5.9 europasprak.com:5000/mariadb:10.5.9
docker push europasprak.com:5000/mariadb:10.5.9
#docker push thalasoft.com:5000/mariadb:10.5.9
fi
