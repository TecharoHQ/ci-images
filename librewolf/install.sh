#!/usr/bin/env bash

! [ -d /etc/apt/keyrings ] && mkdir -p /etc/apt/keyrings && chmod 755 /etc/apt/keyrings

wget -O- https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/Release.key | gpg --dearmor -o /etc/apt/keyrings/home_bgstack15_aftermozilla.gpg

tee /etc/apt/sources.list.d/home_bgstack15_aftermozilla.sources <<EOF >/dev/null
Types: deb
URIs: https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/
Suites: /
Signed-By: /etc/apt/keyrings/home_bgstack15_aftermozilla.gpg
EOF

apt update && apt install librewolf -y
