FROM stephaneeybert/ubuntuos:22.10

RUN apt-get update \
  && apt-get install -y libncurses-dev


# Install redis

COPY redis-7.0.8.tar.gz /usr/local
WORKDIR /usr/local
RUN gzip -d redis-7.0.8.tar.gz \
  && tar -xvf redis-7.0.8.tar \
  && ln -s redis-7.0.8 redis

WORKDIR /usr/local/redis
RUN mkdir -p install/etc \
  && mkdir -p install/var/6379 \
  && chmod a+w install/var/6379 \
  && make

COPY 6379.conf install/etc

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/usr/local/redis/src/redis-server", "/usr/local/redis/install/etc/6379.conf"]

# Build the container: docker build -t stephaneeybert/redis:7.0.8 .
# Rename the image: docker tag stephaneeybert/redis:7.0.8 thalasoft.com:5000/redis:7.0.8
# Push the image: docker push thalasoft.com:5000/redis:7.0.8
# Run the container: docker run -d -p 6380:6379 --name redis stephaneeybert/redis:7.0.8
# Open a shell in the container: docker exec -it redis bash
# View the log: tail -400f install/var/logs/redis_6379.log
# Check that the port is open: nmap -p 6380 localhost
# View the value with key prefix 'PHPREDIS_SESSION:': cd /usr/local/redis-7.0.8/src; ./redis-cli -h 127.0.0.1 KEYS "PHPREDIS_SESSION:*"
