FROM stackbrew/ubuntu:14.04
MAINTAINER Dale-Kurt Murray "dalekurt.murray@gmail.com"

# Basic environment setup
RUN apt-get update; apt-get install -y unzip openjdk-7-jre-headless wget supervisor docker.io openssh-server
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

# Set default password
RUN echo 'root:superstrongpasswd' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
