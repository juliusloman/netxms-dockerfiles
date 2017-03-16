# Dockerfile for building NetXMS server image

FROM debian:jessie
MAINTAINER Julius Loman <lomo@kyberia.net>

ENV NETXMS_VERSION_AGENT=2.0.8-2

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get -y install curl apt-transport-https && \
    curl -sL http://packages.netxms.org/netxms.gpg | apt-key add - && \
    echo "deb http://packages.netxms.org/debian/ jessie main" > /etc/apt/sources.list.d/netxms.list && \
    apt-get update && apt-get -y install netxms-agent=$NETXMS_VERSION_AGENT && apt-get clean

COPY ./docker-entrypoint.sh /

RUN  chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
