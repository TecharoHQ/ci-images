ARG ALPINE_VERSION=3.22

FROM alpine:${ALPINE_VERSION} AS binaryen

RUN apk -U add alpine-sdk git cmake \
  && git clone https://github.com/WebAssembly/binaryen /src/binaryen \
  && cd /src/binaryen \
  && git checkout  version_108 \
  && git submodule update --init

WORKDIR /src/binaryen

RUN cmake . \
  && make -j4

FROM alpine:${ALPINE_VERSION} AS run
RUN apk add -U go nodejs git build-base git npm bash zstd brotli gzip rust cargo rust-wasm
COPY --from=binaryen /usr/local/bin /usr/local/bin
COPY --from=binaryen /usr/local/lib /usr/local/lib
LABEL org.opencontainers.image.source="https://github.com/TecharoHQ/ci-images"