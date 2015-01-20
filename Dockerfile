FROM ubuntu:14.04

MAINTAINER umatomba@gmail.com

USER root

RUN apt-get update
RUN apt-get install -y wget
RUN wget -O - http://ubuntu.hyperdex.org/hyperdex.gpg.key | apt-key add -
RUN echo "deb [arch=amd64] http://ubuntu.hyperdex.org trusty main" > /etc/apt/sources.list.d/hyperdex.list
RUN apt-get update
RUN apt-get install -y hyperdex python-hyperdex-admin python-hyperdex-client

VOLUME /hyperdex/coord
VOLUME /hyperdex/daemon

EXPOSE 1982 2012
