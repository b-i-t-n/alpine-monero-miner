FROM  alpine:latest
RUN   adduser -S -D -H -h /cpuminer-xzc
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        automake \
        autoconf \
        openssl-dev \
        curl-dev \
        jansson-dev \
        git \
        build-base && \
     git clone https://github.com/zcoinofficial/cpuminer-xzc && \
      cd cpuminer-xzc && \
        ./autogen.sh && \
        ./configure CFLAGS="-march=native" --with-crypto --with-curl && \
        make && \
      apk del \
        automake \
        autoconf \
        build-base \
        git
        
USER miner

ENTRYPOINT	["./cpuminer-xzc"]

CMD ["--help"]
