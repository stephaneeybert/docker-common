#!/bin/bash -x

certbot certonly --webroot \
  --webroot-path /usr/bin/learnintouch/www/thalasoft.com -d thalasoft.com -d www.thalasoft.com \
  --register-unsafely-without-email \
  --agree-tos \
  --staging

