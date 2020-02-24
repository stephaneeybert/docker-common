FROM stephaneeybert/ubuntuos-mariadb:10.3.12
#FROM stephaneeybert/ubuntuos-mysql:8.0.15


RUN apt-get update \
  && apt-get install -y libpcre3 libpcre3-dev

# Installing httpd

WORKDIR /usr/local/
COPY httpd-2.4.25.tar.gz /usr/local/
RUN gzip -d httpd-2.4.25.tar.gz \
  && tar -xvf httpd-2.4.25.tar \
  && ln -s httpd-2.4.25 httpd
COPY apr-1.5.2.tar.gz /usr/local/httpd/srclib/
COPY apr-util-1.5.2.tar.gz /usr/local/httpd/srclib/
WORKDIR /usr/local/httpd/srclib/
RUN gzip -d apr-1.5.2.tar.gz \
  && gzip -d apr-util-1.5.2.tar.gz \
  && tar -xvf apr-1.5.2.tar \
  && tar -xvf apr-util-1.5.2.tar \
  && ln -s apr-1.5.2 apr \
  && ln -s apr-util-1.5.2 apr-util

WORKDIR /usr/local/httpd/
RUN ./configure \
  --prefix=/usr/local/apache \
  --with-z=/usr/local/bin \
  --enable-rewrite \
  --enable-deflate \
  --enable-ssl \
  --with-crypto

RUN make \
  && make install \
  && make clean

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/httpd:2.4.25 .
# Rename the image: docker tag stephaneeybert/httpd:2.4.25 thalasoft.com:5000/httpd:2.4.25
# Push the image: docker push thalasoft.com:5000/httpd:2.4.25
# Run the container: docker run -d -p 81:80 --name httpd stephaneeybert/httpd:2.4.25
# Check that the port is open: nmap -p 81 localhost
# Open a shell in the container: docker exec -it httpd bash
# View the apache error log: tail -400f /usr/local/apache/logs/error_log
# View the apache access log: tail -400f /usr/local/apache/logs/access_log
