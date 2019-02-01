FROM stephaneeybert/alpineos:3.8


# Installing the mysql client

RUN apk add --no-cache ncurses-dev

COPY mariadb-10.3.7.tar.gz /usr/bin/
WORKDIR /usr/bin/
RUN gzip -d mariadb-10.3.7.tar.gz \
  && tar -xvf mariadb-10.3.7.tar \
  && ln -s mariadb-10.3.7 mariadb

RUN mkdir -p /usr/bin/mariadb
WORKDIR /usr/bin/mariadb
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \
  && mkdir install/tmp
WORKDIR /usr/bin/mariadb/

RUN cd /usr/bin/mariadb/ \
  && cmake \
  -DCMAKE_INSTALL_PREFIX=/usr/bin/mariadb/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITHOUT_TOKUDB=1 \
  -DMYSQL_DATADIR=/usr/bin/mariadb/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/bin/mariadb/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/bin/mariadb/install/tmp/mariadb.sock \
  && make \
  && make install \
  && make clean

