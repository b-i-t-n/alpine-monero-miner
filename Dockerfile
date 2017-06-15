FROM  alpine:latest
RUN   apk --no-cache upgrade && \
  apk --no-cache add \
    automake \
    autoconf \
    openssl-dev \
    curl-dev \
    git \
    build-base && \
  git clone https://github.com/wolf9466/cpuminer-multi && \
  cd cpuminer-multi && \
    ./autogen.sh && \
    CFLAGS="-O3 -march=native" ./configure && \
    make && \
  apk del \
    automake \
    autoconf \
    build-base \
    git
WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd"]
