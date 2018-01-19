FROM alpine:3.7

RUN apk add --no-cache autoconf \
    automake \
    build-base \
    curl \
    curl-dev \
    git \
    openssl-dev

RUN git clone https://github.com/macchky/cpuminer

WORKDIR cpuminer

RUN ./autogen.sh \
  && ./configure CFLAGS="-O3 -march=native -funroll-loops -fomit-frame-pointer" \
  && make \
  && make install