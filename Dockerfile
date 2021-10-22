FROM ubuntu:18.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo \
                wget \
                curl \
                git \
                build-essential \
                cmake \
                x11-apps

RUN apt install -y libx11-dev \
                xorg-dev \
                libglu1-mesa \
                libglu1-mesa-dev \
                libgl1-mesa-glx \
                libgl1-mesa-dev \
                libglfw3 \
                libglfw3-dev \
                libglew-dev

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m \
    --uid ${DOCKER_UID} --groups sudo --shell /bin/bash ${DOCKER_USER} \
    && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

WORKDIR /home/${DOCKER_USER}/work

RUN chown -R ${DOCKER_USER} ./

USER ${DOCKER_USER}