FROM  alpine:latest
#RUN   adduser -S -D -H -h /cpuminer-xzc
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        automake \
        autoconf \
        curl-dev \
        libssl1.0 \
        libcurl \
        jansson-dev \
        git \
        zlib-dev \
        build-base && \
     git clone https://github.com/zcoinofficial/cpuminer-xzc && \
      cd cpuminer-xzc && \
        ./autogen.sh && \
        ./configure CFLAGS="-O3 -march=native" --with-crypto --with-curl && \
        make && \
      apk del \
        automake \
        autoconf \
        build-base \
        git
        
#USER miner

ENTRYPOINT	["./cpuminer-xzc"]

CMD ["--help"]
