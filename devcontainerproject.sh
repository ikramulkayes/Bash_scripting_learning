#!/usr/bin/env bash

set -eax

ARCHITECTURE=""
case "$(dpkg --print-architecture)" in
    amd64) ARCHITECTURE=amd64;;
    arm64) ARCHITECTURE=arm64;;
    *) echo "unsupported architecture"; exit 1 ;;
esac


websocat_version="v1.8.0"


case "$ARCHITECTURE" in
    amd64) binary_name1="websocat_amd64-linux";;
    arm64) binary_name1="websocat_arm64-linux";;
    *) echo "Unsupported architecture: $ARCHITECTURE"; exit 1 ;;
esac


curl -sSL -o /tmp/websocat "https://github.com/vi/websocat/releases/download/$websocat_version/$binary_name1"
chmod +x /tmp/websocat
sudo mv /tmp/websocat /usr/local/bin/websocat


/usr/local/bin/websocat --version
source ~/.bashrc