FROM  nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

RUN apt-get update \
    && apt-get -y install python \
    python-pip \
    python-dev \
    git vim \
    openssh-server

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN pip install --upgrade pip
RUN pip install setuptools
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes #prohibit-password/' /etc/ssh/sshd_config

WORKDIR /workspace
ADD . .

ENV PYTHONPATH $PYTHONPATH:/workspace

# RUN pip install -r requirements.txt

RUN chmod -R a+w /workspace

