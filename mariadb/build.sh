#!/bin/bash -x

docker build -t stephaneeybert/mariadb:10.3.12 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/mariadb:10.3.12 localhost:5000/mariadb:10.3.12
docker push localhost:5000/mariadb:10.3.12
docker tag stephaneeybert/mariadb:10.3.12 thalasoft.com:5000/mariadb:10.3.12
#docker push thalasoft.com:5000/mariadb:10.3.12
fi
