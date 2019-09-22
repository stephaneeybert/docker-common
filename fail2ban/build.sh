#!/bin/bash -x

docker build -t stephaneeybert/fail2ban --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/fail2ban localhost:5000/fail2ban
docker push localhost:5000/fail2ban
docker tag stephaneeybert/fail2ban thalasoft.com:5000/fail2ban
docker push thalasoft.com:5000/fail2ban
fi
