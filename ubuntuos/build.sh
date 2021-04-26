#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos:20.10 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos:20.10 localhost:5000/ubuntuos:20.10
docker push localhost:5000/ubuntuos:20.10
docker tag stephaneeybert/ubuntuos:20.10 thalasoft.com:5000/ubuntuos:20.10
#docker push thalasoft.com:5000/ubuntuos:20.10
fi
