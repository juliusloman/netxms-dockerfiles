# Dockerfile for building NetXMS server image

FROM debian:jessie
MAINTAINER Julius Loman <lomo@kyberia.net>

ENV NETXMS_VERSION_SERVER=2.0.8-2 NETXMS_VERSION_AGENT=2.0.8-2

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get -y install curl apt-transport-https && \
    curl -sL http://packages.netxms.org/netxms.gpg | apt-key add - && \
    echo "deb http://packages.netxms.org/debian/ jessie main" > /etc/apt/sources.list.d/netxms.list && \
    apt-get update && apt-get -y install netxms-server=$NETXMS_VERSION_SERVER netxms-agent=$NETXMS_VERSION_AGENT netxms-dbdrv-sqlite3=$NETXMS_VERSION_SERVER supervisor && apt-get clean

VOLUME /data

EXPOSE 4701

ENV NETXMS_UNLOCKONSTARTUP=1 NETXMS_STARTAGENT=1 NXAGENT_REGISTERSERVER=127.0.0.1

COPY ./docker-entrypoint.sh ./nxagent.sh /

RUN  chmod 755 /docker-entrypoint.sh /nxagent.sh

CMD ["/docker-entrypoint.sh"]
