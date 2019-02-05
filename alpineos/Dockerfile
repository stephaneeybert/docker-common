FROM alpine:3.8

RUN apk add --no-cache --virtual build-essential build-base autoconf gcc cmake linux-headers libexecinfo-dev gnutls-dev bison
RUN apk add --no-cache gnupg curl libcurl curl-dev bash bzip2 vim wget git zip unzip

RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN echo "Europe/Paris" >  /etc/timezone
RUN apk del tzdata
ENV TZ Europe/Paris
ENV LANG sv_SE.UTF-8
ENV LANGUAGE sv_SE.UTF-8
ENV LC_ALL sv_SE.UTF-8

ENTRYPOINT ["tail", "-f", "/dev/null"]
