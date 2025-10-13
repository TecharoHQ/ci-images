FROM debian:latest

RUN apt-get update \
  && apt-get install -y wget \
  && wget https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/amd64/librewolf_142.0-1_amd64.deb -O /tmp/librewolf.deb \
  && apt-get install -y librewolf