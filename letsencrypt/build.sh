#!/bin/bash -x

docker build -t stephaneeybert/letsencrypt --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/letsencrypt localhost:5000/letsencrypt
docker push localhost:5000/letsencrypt
docker tag stephaneeybert/letsencrypt thalasoft.com:5000/letsencrypt
docker push thalasoft.com:5000/letsencrypt
fi
