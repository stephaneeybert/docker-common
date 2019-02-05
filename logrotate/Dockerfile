FROM stephaneeybert/ubuntuos:18.04

RUN apt-get update \
  && apt-get install -y logrotate

WORKDIR /etc/logrotate.d/

COPY httpd.logrotate.conf mariadb.logrotate.conf nodejs.logrotate.conf user-rest.logrotate.conf php_error_log.logrotate.conf ngzero.logrotate.conf /etc/logrotate.d/

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/logrotate .
# Rename the image: docker tag stephaneeybert/logrotate thalasoft.com:5000/logrotate
# Push the image: docker push thalasoft.com:5000/logrotate
# Run the container: docker run -d --name logrotate stephaneeybert/logrotate
# Open a shell in the container: docker exec -it logrotate bash
