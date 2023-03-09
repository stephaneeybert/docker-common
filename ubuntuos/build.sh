#!/bin/bash -x

docker build -t stephaneeybert/ubuntuos:22.10 --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/ubuntuos:22.10 localhost:5000/ubuntuos:22.10
docker push localhost:5000/ubuntuos:22.10
docker tag stephaneeybert/ubuntuos:22.10 europasprak.com:5000/ubuntuos:22.10
docker push europasprak.com:5000/ubuntuos:22.10
fi
