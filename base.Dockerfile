FROM ubuntu:20.04

# set noninteractive installation
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Rome

RUN apt-get update
RUN apt-get install \
    aptitude -y \
    ca-certificates -y \
    curl \
    gnupg -y \ 
    sudo -y \
    vim -y \
    nmap -y \
    net-tools -y \ 
    openssh-server -y \
    iputils-ping -y \
    lsb-release