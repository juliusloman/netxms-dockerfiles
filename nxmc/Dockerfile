# Dockerfile for building NetXMS Console

FROM debian:jessie
MAINTAINER Julius Loman <lomo@kyberia.net>

ENV VERSION=2.0.8

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get -y install curl apt-transport-https openjdk-7-jre && \
    curl -L http://www.netxms.org/download/nxmc/nxmc-${VERSION}-linux-gtk-x64.tar.gz -o - |tar xzv -C /

ENTRYPOINT [ "/nxmc/nxmc" ]
    
