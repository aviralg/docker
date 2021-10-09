################################################################################
## https://hub.docker.com/_/debian/
################################################################################
FROM debian:latest
MAINTAINER Aviral Goel <goel.aviral@gmail.com>

################################################################################
## Upgrade
################################################################################
RUN apt-get update
RUN apt-get -y dist-upgrade

################################################################################
## Basic packages
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install \
    sudo                                               \
    apt-utils                                          \
    debian-keyring                                     \
    curl                                               \
    wget

################################################################################
## Locale
## https://hub.docker.com/_/debian/
## https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
## http://jaredmarkell.com/docker-and-locales/
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


################################################################################
## Arguments
## (https://medium.com/faun/set-current-host-user-for-docker-container-4e521cef9ffc)
################################################################################
ARG USER=aviral
RUN echo "USER=${USER}"

ARG UID=1000
RUN echo "UID=${UID}"

ARG GID=1000
RUN echo "GID=${GID}"

ARG PASSWORD=aviral
RUN echo "PASSWORD=${PASSWORD}"

################################################################################
## User
################################################################################
RUN groupadd -o --gid ${GID} ${USER}
RUN useradd --create-home --uid=${UID} --gid=${GID} --shell /bin/fish ${USER}
RUN echo "${USER}:${PASSWORD}" | chpasswd
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${USER}
WORKDIR /home/${USER}
#RUN mkdir -p /home/aviral/library
ENV R_LIBS_USER ${R_LIBS_USER}
ENV R_KEEP_PKG_SOURCE 1
ENV R_ENABLE_JIT 0
ENV R_COMPILE_PKGS 0
ENV R_DISABLE_BYTECODE 1
ENV OMP_NUM_THREADS 1
