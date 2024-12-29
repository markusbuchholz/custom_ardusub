# Markus Buchholz
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    vim \
    nano \
    sudo \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gcc-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    libnewlib-arm-none-eabi \
    gdb-multiarch

RUN apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    python3-venv

RUN ln -s /usr/bin/python3.8 /usr/bin/python

RUN pip3 install --upgrade pip && \
    pip3 install \
    numpy \
    scipy \
    pandas \
    matplotlib \
    empy==3.3.4 \
    pexpect\
    future

RUN useradd -ms /bin/bash devuser && \
    echo "devuser:ardusub" | chpasswd && \
    usermod -aG sudo devuser

USER devuser
WORKDIR /home/devuser

CMD ["/bin/bash"]




