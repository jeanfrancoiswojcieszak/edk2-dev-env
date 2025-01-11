FROM ubuntu:18.04
MAINTAINER jeanwoj@pm.com

ENV DEBIAN_FRONTEND=noninteractive


#preparation du systeme
RUN	apt-get update -y
RUN apt-get install -y nasm uuid-dev build-essential git python bash iasl vim

#preparation du framework edk2
RUN mkdir /app/
WORKDIR /app/
RUN git clone https://github.com/tianocore/edk2.git -b UDK2018
WORKDIR /app/edk2
RUN git submodule update --init
RUN make -C BaseTools
RUN cp /usr/share/OVMF/OVMF_CODE.fd /bios/bios.bin
RUN cp /usr/share/OVMF/OVMF_VARS_4M.fd /bios/vars.bin
SHELL ["/bin/bash","-c"]


