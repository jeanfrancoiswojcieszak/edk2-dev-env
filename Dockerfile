FROM ubuntu:18.04
MAINTAINER jeanwoj@pm.com

ENV DEBIAN_FRONTEND=noninteractive


#preparation du systeme
RUN	apt-get update -y
RUN apt-get install -y nasm uuid-dev build-essential git python bash iasl vim ovmf

#preparation du framework edk2
RUN mkdir /app/
WORKDIR /app/
RUN git clone https://github.com/tianocore/edk2.git -b UDK2018
WORKDIR /app/edk2
RUN git submodule update --init
RUN make -C BaseTools
COPY startup/entry.sh /root/entry.sh
ENTRYPOINT ["bash","/root/entry.sh"]


