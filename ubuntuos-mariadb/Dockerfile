FROM stephaneeybert/ubuntuos:22.10


RUN apt-get install -y libncurses-dev

WORKDIR /usr/local/
COPY mariadb-10.5.19.tar.gz /usr/local/
RUN gzip -d mariadb-10.5.19.tar.gz \
  && tar -xvf mariadb-10.5.19.tar \
  && ln -s mariadb-10.5.19 mariadb-source

RUN mkdir mariadb
WORKDIR /usr/local/mariadb/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \ 
  && mkdir install/tmp \
  && chmod a+w -R /usr/local/mariadb/install/tmp

WORKDIR /usr/local/mariadb/
RUN cmake \
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

