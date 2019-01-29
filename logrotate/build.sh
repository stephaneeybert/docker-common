#!/bin/bash -x

docker build -t stephaneeybert/logrotate --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/logrotate localhost:5000/logrotate
docker push localhost:5000/logrotate
docker tag stephaneeybert/logrotate thalasoft.com:5000/logrotate
docker push thalasoft.com:5000/logrotate
fi
