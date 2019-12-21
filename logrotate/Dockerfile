FROM stephaneeybert/ubuntuos:18.04

RUN apt-get update \
  && apt-get install -y logrotate \
  && apt-get install -y rsyslog

WORKDIR /etc/logrotate.d/

COPY httpd.logrotate.conf \
  redis.logrotate.conf \
  mariadb.logrotate.conf \
  nodejs.logrotate.conf \
  user-rest.logrotate.conf \
  php_error_log.logrotate.conf \
  musicng.logrotate.conf \
  letsencrypt.logrotate.conf \
  /etc/logrotate.d/

RUN mkdir /usr/local/logrotate/
COPY rotate.sh /usr/local/logrotate/
RUN chmod 744 /usr/local/logrotate/rotate.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/logrotate/rotate.sh"]

# Build the container: docker build -t stephaneeybert/logrotate .
# Rename the image: docker tag stephaneeybert/logrotate thalasoft.com:5000/logrotate
# Push the image: docker push thalasoft.com:5000/logrotate
# Run the container: docker run -d --name logrotate stephaneeybert/logrotate
# Open a shell in the container: docker exec -it logrotate bash
# Viewing the results of the last log rotate: cat /var/lib/logrotate/status
