FROM stephaneeybert/ubuntuos:18.04


# Installing the mysql client

RUN apt-get install -y libncurses-dev

COPY mariadb-10.3.12.tar.gz /usr/local/
WORKDIR /usr/local/
RUN gzip -d mariadb-10.3.12.tar.gz \
  && tar -xvf mariadb-10.3.12.tar \
  && ln -s mariadb-10.3.12 mariadb-source

RUN mkdir mariadb
WORKDIR /usr/local/mariadb/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \ 
  && mkdir install/tmp

WORKDIR /usr/local/mariadb/
RUN cmake -- -j4 \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mariadb/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITHOUT_TOKUDB=1 \
  -DMYSQL_DATADIR=/usr/local/mariadb/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/local/mariadb/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/local/mariadb/install/tmp/mariadb.sock \
  /usr/local/mariadb-source/ \
  && make \
  && make install \
  && make clean

