#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos:18.04 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos:18.04 localhost:5000/ubuntuos:18.04
docker push localhost:5000/ubuntuos:18.04
docker tag stephaneeybert/ubuntuos:18.04 thalasoft.com:5000/ubuntuos:18.04
docker push thalasoft.com:5000/ubuntuos:18.04
fi
