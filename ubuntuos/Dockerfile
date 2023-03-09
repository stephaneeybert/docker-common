FROM ubuntu:22.10

RUN apt-get update \
  && apt-get install -y build-essential autoconf gcc cmake pkg-config apt-file libbz2-dev \
  && apt-get install -y gnutls-dev bison libbison-dev \
  && apt-get install -y libz-dev libzip-dev openssl libssl-dev gnupg \
  && apt-get install -y iputils-ping telnet curl wget bash vim zip unzip git sudo \
  && apt-get autoremove -y && apt-get clean

RUN apt-get install -y locales \
  && update-locale \
  && dpkg-reconfigure locales \
  && locale-gen en_US.UTF-8 \
  && locale-gen en_GB.UTF-8 \
  && locale-gen fr_FR.UTF-8 \
  && locale-gen sv_SE.UTF-8 \
  && locale-gen nn_NO.UTF-8 \
  && localedef -i en_GB -f UTF-8 en_GB.UTF-8 \
  && localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 \
  && localedef -i sv_SE -f UTF-8 sv_SE.UTF-8 \
  && localedef -i nn_NO -f UTF-8 nn_NO.UTF-8

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
