#!/bin/bash -x

docker build -t stephaneeybert/nodejs --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/nodejs localhost:5000/nodejs
docker push localhost:5000/nodejs
docker tag stephaneeybert/nodejs europasprak.com:5000/nodejs
docker push europasprak.com:5000/nodejs
fi
