FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y build-essential autoconf gcc cmake pkg-config apt-file libbz2-dev \
  && apt-get install -y gnutls-dev bison libbison-dev \
  && apt-get install -y libz-dev libzip-dev openssl libssl1.0-dev gnupg \
  && apt-get install -y iputils-ping telnet curl wget bash vim zip unzip git sudo

RUN apt-get install -y locales locales-all \
  && update-locale \
  && dpkg-reconfigure locales \
  && locale-gen en_US.UTF-8 \
  && locale-gen en_GB.UTF-8 \
  && locale-gen fr_FR.UTF-8 \
  && locale-gen sv_SE.UTF-8 \
  && locale-gen nn_NO.UTF-8

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
