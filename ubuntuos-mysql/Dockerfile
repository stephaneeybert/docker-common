FROM stephaneeybert/ubuntuos:20.10


RUN apt-get update \
  && apt-get install -y libncurses-dev libboost-all-dev

COPY mysql-8.0.25.tar.gz /usr/local/
WORKDIR /usr/local
RUN gzip -d mysql-8.0.25.tar.gz \
  && tar -xvf mysql-8.0.25.tar \
  && mv mysql-8.0.25 mysql-source

RUN mkdir mysql
WORKDIR /usr/local/mysql/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \ 
  && mkdir install/tmp \
  && chmod a+w -R /usr/local/mysql/install/tmp

WORKDIR /usr/local/mysql/
RUN cmake -- -j4 \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITHOUT_TOKUDB=1 \
  -DMYSQL_DATADIR=/usr/local/mysql/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=system \
  -DMYSQL_UNIX_ADDR=/usr/local/mysql/install/tmp/mysql.sock \
  /usr/local/mysql-source/ \
  && make \
  && make install \
  && make clean

