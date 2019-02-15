FROM stephaneeybert/httpd:2.4.25


# Installing jpeg

WORKDIR /usr/local/
COPY jpegsrc.v9b.tar.gz /usr/local/
RUN gzip -d jpegsrc.v9b.tar.gz \
  && tar -xvf jpegsrc.v9b.tar \
  && ln -s jpeg-9b jpeg
WORKDIR /usr/local/jpeg/
RUN ./configure --enable-shared \
  && make \
  && make install \
  && make clean


# Installing libpng

WORKDIR /usr/local/
COPY libpng-1.6.29.tar.gz /usr/local/
RUN gzip -d libpng-1.6.29.tar.gz \
  && tar -xvf libpng-1.6.29.tar \
  && ln -s libpng-1.6.29 libpng
WORKDIR /usr/local/libpng/
RUN ./configure \
  --with-zlib-prefix=/usr \
  && make \
  && make install \
  && make clean


# Installing freetype

RUN apt-get install -y libbz2-dev

WORKDIR /usr/local/
COPY freetype-2.7.1.tar.gz /usr/local/
RUN gzip -d freetype-2.7.1.tar.gz \
  && tar -xvf freetype-2.7.1.tar \
  && ln -s freetype-2.7.1 freetype
WORKDIR /usr/local/freetype/
RUN ./configure \
  --with-bzip2 \
  && make \
  && make install \
  && make clean


# Installing gd

RUN apt-get install -y \
  libxpm-dev

WORKDIR /usr/local/
COPY libgd-2.2.5.tar.gz /usr/local/
RUN gzip -d libgd-2.2.5.tar.gz \
  && tar -xvf libgd-2.2.5.tar \
  && ln -s libgd-2.2.5 libgd
WORKDIR /usr/local/libgd/
RUN ./configure \
  --with-jpeg=/usr/local \
  --with-png=/usr/local \
  --with-freetype=/usr/local \
  --with-zlib=/usr/local \
  --with-xpm=/usr/local \
  && make \
  && make install \
  && make clean


# Installing php

WORKDIR /usr/local/include
RUN ln -s /usr/include/x86_64-linux-gnu/curl curl

RUN apt-get update \
  && apt-get install -y \
  libxml2-dev libxslt-dev \
  libicu-dev \
  pkg-config \
  libcurl4-gnutls-dev \
  re2c libzip-dev

WORKDIR /usr/local/
COPY php-7.3.2.tar.gz /usr/local/
RUN gzip -d php-7.3.2.tar.gz \
  && tar -xvf php-7.3.2.tar \
  && ln -s php-7.3.2 php

WORKDIR /usr/local/php/
RUN ./configure \
  --prefix=/usr/local/php/install \
  --with-apxs2=/usr/local/apache/bin/apxs \
  --with-config-file-path=/usr/local/php-7.3.2/ \
  --enable-libgcc \
  --with-mysqli=mysqlnd \
  --with-pdo-mysql=mysqlnd \
  --with-zlib-dir=/usr \
  --with-jpeg-dir=/usr \
  --with-png-dir=/usr \
  --with-gd=/usr/local \
  --with-freetype-dir=/usr \
  --enable-ftp \
  --enable-xml \
  --enable-zip \
  --with-bz2 \
  --enable-wddx \
  --without-pear \
  --enable-mbstring \
  --with-openssl \
  --with-curl \
  --enable-intl \
  && make \
  && make install \
  && make clean

RUN mkdir /usr/local/php/tmp \
  && chmod 777 /usr/local/php/tmp


# Install phpredis

COPY phpredis-4.2.0.tar.gz /usr/local
WORKDIR /usr/local
RUN gzip -d phpredis-4.2.0.tar.gz \
  && tar -xvf phpredis-4.2.0.tar \
  && ln -s phpredis-4.2.0 phpredis
WORKDIR /usr/local/phpredis
RUN chmod a+x /usr/local/php/scripts/phpize \
  && sleep 1 \
  && /usr/local/php/scripts/phpize \
  && chmod a+x /usr/local/php/scripts/php-config \
  && ./configure --prefix=/usr/local/redis/install --with-php-config=/usr/local/php/scripts/php-config \
  && make \
  && make install \
  && make clean \
  && ls /usr/local/php/install/lib/php/extensions/no-debug-zts-20180731/redis.so
# php 5 && ls /usr/local/php/install/lib/php/extensions/no-debug-zts-20131226/redis.so
# php 7 && ls /usr/local/php/install/lib/php/extensions/no-debug-zts-20180731/redis.so

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/php:7.3.2 .
# Rename the image: docker tag stephaneeybert/php:7.3.2 thalasoft.com:5000/php:7.3.2
# Push the image: docker push thalasoft.com:5000/php:7.3.2
# Run the container: docker run -d -p 81:80 --name php stephaneeybert/php:7.3.2
# Check that the port is open: nmap -p 81 localhost
# Open a shell in the container: docker exec -it php bash

