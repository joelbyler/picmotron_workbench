FROM ubuntu
MAINTAINER joelbyler@gmail.com
LABEL version="0.1" description="Nerves Workbench Container for building rpi3 systems"

RUN apt-get update
RUN apt-get -y install wget

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get update
RUN apt-get -y install esl-erlang elixir ssh-askpass squashfs-tools xz-utils
RUN apt-get -y install git g++ libssl-dev libncurses5-dev libncursesw5-dev bc m4 make unzip cmake wget cpio python bzip2

RUN wget https://github.com/fhunleth/fwup/releases/download/v0.12.0/fwup_0.12.0_amd64.deb
RUN dpkg -i fwup_0.12.0_amd64.deb

RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN mix local.hex --force
RUN mix local.rebar

RUN mix archive.install --force https://github.com/nerves-project/archives/raw/master/nerves_bootstrap.ez

ENV NERVES_SYSTEM=/opt/nerves_system
ENV NERVES_TARGET=rpi3

# COPY ./system/nerves_system_br /opt/nerves_buildroot
# COPY ./system/nerves_system_rpi3_ap /opt/nerves_system

# RUN cd /opt/nerves_system && /opt/nerves_buildroot/create-build.sh nerves_defconfig /opt/build
# RUN cd /opt/build && make && make system
# COPY /opt/build/nerves_system_rpi3.tar.gz /out
