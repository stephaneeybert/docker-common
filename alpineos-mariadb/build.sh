#!/bin/bash -x

docker build -t stephaneeybert/alpineos-mariadb:10.3.7 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/alpineos-mariadb:10.3.7 localhost:5000/alpineos-mariadb:10.3.7
docker push localhost:5000/alpineos-mariadb:10.3.7
docker tag stephaneeybert/alpineos-mariadb:10.3.7 thalasoft.com:5000/alpineos-mariadb:10.3.7
docker push thalasoft.com:5000/alpineos-mariadb:10.3.7
fi
