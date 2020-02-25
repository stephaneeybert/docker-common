FROM stephaneeybert/ubuntuos:18.04


RUN apt-get install -y libncurses-dev

COPY mysql-8.0.19.tar.gz /usr/local/
WORKDIR /usr/local
RUN gzip -d mysql-8.0.19.tar.gz \
  && tar -xvf mysql-8.0.19.tar \
  && mv mysql-8.0.19 mysql-source

RUN mkdir mysql
WORKDIR /usr/local/mysql/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \ 
  && mkdir install/tmp

WORKDIR /usr/local/mysql/
RUN cmake -- -j4 \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITHOUT_TOKUDB=1 \
  -DMYSQL_DATADIR=/usr/local/mysql/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/local/mysql/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/local/mysql/install/tmp/mysql.sock \
  /usr/local/mysql-source/ \
  && make \
  && make install \
  && make clean

