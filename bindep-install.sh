#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Tested on Ubuntu 20.04
# TODO: support on other platforms

NAME=$(lsb_release -si)
# echo "$NAME"

VERSION=$(lsb_release -sr)
# echo "$VERSION"

function main {
    sudo apt update
    sudo apt install python3-pip -y
    sudo pip install bindep
}

if [[ "${NAME}" = "Ubuntu" ]] && [[ "${VERSION}" = "20.04" ]]; then
    main
else
    echo "WARNING: ${NAME} ${VERSION} is untested. YMMV!"
    main
fi
