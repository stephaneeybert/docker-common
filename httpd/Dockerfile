FROM stephaneeybert/ubuntuos-mariadb:10.5.19
#FROM stephaneeybert/ubuntuos-mysql:8.0.15


RUN apt-get update \
  && apt-get install -y libpcre3 libpcre3-dev \
  && apt-get install -y libexpat1-dev \
  && apt-get install -y libssl-dev

# Installing httpd

WORKDIR /usr/local/
COPY httpd-2.4.55.tar.gz /usr/local/
RUN gzip -d httpd-2.4.55.tar.gz \
  && tar -xvf httpd-2.4.55.tar \
  && ln -s httpd-2.4.55 httpd
COPY apr-1.7.2.tar.gz /usr/local/httpd/srclib/
COPY apr-util-1.6.3.tar.gz /usr/local/httpd/srclib/
WORKDIR /usr/local/httpd/srclib/
RUN gzip -d apr-1.7.2.tar.gz \
  && gzip -d apr-util-1.6.3.tar.gz \
  && tar -xvf apr-1.7.2.tar \
  && tar -xvf apr-util-1.6.3.tar \
  && ln -s apr-1.7.2 apr \
  && ln -s apr-util-1.6.3 apr-util

WORKDIR /usr/local/httpd/
RUN ./configure \
  --prefix=/usr/local/apache \
  --with-z=/usr/local/bin \
  --enable-rewrite \
  --enable-deflate \
  --enable-ssl \
  --with-expat=/usr/lib \
  --with-crypto

RUN make \
  && make install \
  && make clean

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/httpd:2.4.55 .
# Rename the image: docker tag stephaneeybert/httpd:2.4.55 thalasoft.com:5000/httpd:2.4.55
# Push the image: docker push thalasoft.com:5000/httpd:2.4.55
# Run the container: docker run -d -p 81:80 --name httpd stephaneeybert/httpd:2.4.55
# Check that the port is open: nmap -p 81 localhost
# Open a shell in the container: docker exec -it httpd bash
# View the apache error log: tail -400f /usr/local/apache/logs/error_log
# View the apache access log: tail -400f /usr/local/apache/logs/access_log
