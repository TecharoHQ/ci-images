FROM debian:latest

RUN apt-get update \
  && apt-get -y install ca-certificates
COPY palemoon.list /etc/apt/sources.list.d/palemoon.list
COPY veit@kannegieser.net.gpg /usr/share/keyrings/veit@kannegieser.net.gpg
RUN apt-get update \
  && apt-get install -y palemoon veit-kannegieser-archive-keyring
LABEL org.opencontainers.image.source="https://github.com/TecharoHQ/ci-images"