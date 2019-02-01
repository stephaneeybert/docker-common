#!/bin/bash -x

docker build -t stephaneeybert/alpineos:3.8 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/alpineos:3.8 localhost:5000/alpineos:3.8
docker push localhost:5000/alpineos:3.8
docker tag stephaneeybert/alpineos:3.8 thalasoft.com:5000/alpineos:3.8
docker push thalasoft.com:5000/alpineos:3.8
fi
