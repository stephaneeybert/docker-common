FROM stephaneeybert/ubuntuos:22.10


RUN apt-get install -y libreadline-dev

COPY postgresql-12.1.tar.gz /usr/local/
WORKDIR /usr/local/
RUN gzip -d postgresql-12.1.tar.gz \
  && tar -xvf postgresql-12.1.tar \
  && ln -s postgresql-12.1 postgresql

WORKDIR /usr/local/postgresql
RUN ./configure \
  --prefix=/usr/local/postgresql/install \
  --without-zlib \
  && make \
  && make install \
  && make clean

