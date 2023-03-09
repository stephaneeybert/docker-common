FROM stephaneeybert/httpd:2.4.55


WORKDIR /usr/local/include
RUN ln -s /usr/include/x86_64-linux-gnu/curl curl

RUN apt-get update \
  && apt-get install -y \
  libxml2-dev libxslt-dev \
  libicu-dev \
  pkg-config \
  libcurl4-gnutls-dev \
  re2c libzip-dev \
  libsqlite3-dev \
  libonig-dev \
  libjpeg-dev \
  libpng-dev \
  libfreetype-dev

WORKDIR /usr/local/
COPY php-8.1.15.tar.gz /usr/local/
RUN gzip -d php-8.1.15.tar.gz \
  && tar -xvf php-8.1.15.tar \
  && ln -s php-8.1.15 php

WORKDIR /usr/local/php/
RUN ./configure \
  --prefix=/usr/local/php/install \
  --with-apxs2=/usr/local/apache/bin/apxs \
  --with-config-file-path=/usr/local/php-8.1.15/ \
  --enable-libgcc \
  --with-mysqli=mysqlnd \
  --with-pdo-mysql=mysqlnd \
  --with-zlib-dir=/usr \
  --with-jpeg=/usr \
  --enable-gd \
  --with-freetype \
  --enable-ftp \
  --enable-xml \
  --with-zip \
  --with-bz2 \
  --without-pear \
  --enable-mbstring \
  --with-openssl \
  --with-curl \
  --enable-intl \
  --enable-bcmath \
  && make \
  && make install \
  && make clean

RUN mkdir /usr/local/php/tmp \
  && chmod 777 /usr/local/php/tmp


# Install phpredis

COPY phpredis-5.3.7.tar.gz /usr/local
WORKDIR /usr/local
RUN gzip -d phpredis-5.3.7.tar.gz \
  && tar -xvf phpredis-5.3.7.tar \
  && ln -s phpredis-5.3.7 phpredis
WORKDIR /usr/local/phpredis
RUN chmod a+x /usr/local/php/scripts/phpize \
  && sleep 1 \
  && /usr/local/php/scripts/phpize \
  && chmod a+x /usr/local/php/scripts/php-config \
  && ./configure --prefix=/usr/local/redis/install --with-php-config=/usr/local/php/scripts/php-config \
  && make \
  && make install \
  && make clean \
  && ls /usr/local/php/install/lib/php/extensions/no-debug-zts-20210902/redis.so
# php 8 && ls /usr/local/php/install/lib/php/extensions/no-debug-zts-20210902/redis.so

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/php:8.1.15 .
# Run the container: docker run -d -p 81:80 --name php stephaneeybert/php:8.1.15
# Check that the port is open: nmap -p 81 localhost
# Open a shell in the container: docker exec -it php bash

