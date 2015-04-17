# Oracle Java for Ubuntu 14.04
#
# GitHub - http://github.com/dalekurt/docker-base
# Docker Hub - http://hub.docker.com/u/dalekurt/storm
# Twitter - http://www.twitter.com/dalekurt

FROM stackbrew/ubuntu:14.04

MAINTAINER Dale-Kurt Murray "dalekurt.murray@gmail.com"

# Basic environment setup
RUN apt-get update; apt-get install -y unzip wget supervisor docker.io openssh-server

# accept-java-license
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update && \
  apt-get install -yq python-software-properties && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get remove -yq python-software-properties && \
  apt-get autoremove -yq && \
  apt-get clean -yq && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
  apt-get install -yq oracle-java7-installer oracle-java7-set-default && \
  apt-get autoremove -yq && \
  apt-get clean -yq && \
  rm -rf /var/lib/apt/lists/*

# Set default password
RUN echo 'root:superstrongpasswd' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
