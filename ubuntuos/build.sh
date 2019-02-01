#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos localhost:5000/ubuntuos
docker push localhost:5000/ubuntuos
docker tag stephaneeybert/ubuntuos thalasoft.com:5000/ubuntuos
docker push thalasoft.com:5000/ubuntuos
fi
