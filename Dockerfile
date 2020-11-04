FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

# apt sources fix
COPY sources.list.aarch64 /tmp/build/
RUN if [ $(uname -m) = 'aarch64' ]; then \
        mv /tmp/build/sources.list.aarch64 /etc/apt/sources.list; \
    fi

# build git with openssl, based on the Ubuntu git maintainers PPA
COPY build-git-openssl.sh /tmp/build/
RUN /tmp/build/build-git-openssl.sh
