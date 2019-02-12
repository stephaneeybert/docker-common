FROM stephaneeybert/ubuntuos:18.04

RUN apt-get update \
  && apt-get install -y libncurses-dev


# Install redis

COPY redis-3.0.7.tar.gz /usr/local
WORKDIR /usr/local
RUN gzip -d redis-3.0.7.tar.gz \
  && tar -xvf redis-3.0.7.tar \
  && ln -s redis-3.0.7 redis

WORKDIR /usr/local/redis
RUN mkdir -p install/etc \
  && mkdir -p install/var/6379 \
  && make

COPY 6379.conf install/etc

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/usr/local/redis/src/redis-server", "/usr/local/redis/install/etc/6379.conf"]

# Build the container: docker build -t stephaneeybert/redis:3.0.7 .
# Rename the image: docker tag stephaneeybert/redis:3.0.7 thalasoft.com:5000/redis:3.0.7
# Push the image: docker push thalasoft.com:5000/redis:3.0.7
# Run the container: docker run -d -p 6380:6379 --name redis stephaneeybert/redis:3.0.7
# Open a shell in the container: docker exec -it redis bash
# View the log: tail -400f install/var/logs/redis_6379.log
# Check that the port is open: nmap -p 6380 localhost
# View the value with key prefix 'PHPREDIS_SESSION:': cd /usr/local/redis-3.0.7/src; ./redis-cli -h 127.0.0.1 KEYS "PHPREDIS_SESSION:*"
