# Version 1.1

FROM abh1nav/baseimage:latest

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

# Install dependencies, build redis, copy binaries to /user/local/bin and clean up
# all in a single step to keep the image size low
RUN \
    apt-get update; \
    apt-get install -y -qq gcc make; \
    mkdir -p /opt/redis; \
    wget -O - http://download.redis.io/releases/redis-2.8.19.tar.gz | tar xzf - --strip-components=1 -C "/opt/redis"; \
    cd /opt/redis; \
    make; \
    cp src/redis-server /usr/local/bin; \
    cd /root; \
    rm -Rf /opt/redis; \
    apt-get remove --purge -y -qq gcc make; \
    mkdir -p /etc/service/redis /var/lib/redis;

COPY redis.conf /etc/

COPY run /etc/service/redis/

WORKDIR /

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
