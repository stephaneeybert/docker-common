FROM stephaneeybert/ubuntuos:20.10

RUN apt-get update \
  && apt-get install -y logrotate \
  && apt-get install -y rsyslog

WORKDIR /etc/logrotate.d/

COPY httpd.logrotate.conf \
  redis.logrotate.conf \
  mariadb.logrotate.conf \
  cron.logrotate.conf \
  nodejs.logrotate.conf \
  user-rest.logrotate.conf \
  php_error_log.logrotate.conf \
  musicng.logrotate.conf \
  letsencrypt.logrotate.conf \
  /etc/logrotate.d/

# Files that are writables by group or other are not rotated
RUN chmod 644 /etc/logrotate.d/*.conf

RUN mkdir /usr/local/logrotate/
COPY rotate.sh /usr/local/logrotate/
RUN chmod 744 /usr/local/logrotate \
  && chmod 744 /usr/local/logrotate/rotate.sh

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/logrotate .
# Rename the image: docker tag stephaneeybert/logrotate thalasoft.com:5000/logrotate
# Push the image: docker push thalasoft.com:5000/logrotate
# Run the container: docker run -d --name logrotate stephaneeybert/logrotate
# Open a shell in the container: docker exec -it logrotate bash
# Run a log rotation: /etc/cron.daily/logrotate
# Viewing the results of the last log rotate: cat /var/lib/logrotate/status
