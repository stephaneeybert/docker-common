FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository ppa:certbot/certbot \
  && apt-get update \
  && apt-get install -y certbot \
  && apt-get install -y vim

WORKDIR /usr/bin/
RUN mkdir letsencrypt-certbot

COPY request-certificate.sh /usr/bin/letsencrypt-certbot
RUN chmod 755 /usr/bin/letsencrypt-certbot/request-certificate.sh

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
#ENTRYPOINT ["/bin/bash", "./request-certificate.sh"]

# Build the container: docker build -t stephaneeybert/letsencrypt .
# Rename the image: docker tag stephaneeybert/letsencrypt thalasoft.com:5000/letsencrypt
# Push the image: docker push thalasoft.com:5000/letsencrypt
