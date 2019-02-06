FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y build-essential autoconf gcc cmake pkg-config apt-file libbz2-dev \
  && apt-get install -y gnutls-dev bison libbison-dev locales \
  && apt-get install -y libz-dev openssl libssl1.0-dev gnupg \
  && apt-get install -y iputils-ping telnet curl wget bash vim zip unzip git
