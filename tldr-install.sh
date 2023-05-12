#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if which tldr; then
  echo "tldr found. Skipping install."
  exit 0
fi

if which npm; then
  echo "npm found. Skipping install."
else
  sudo apt install -y npm
fi

sudo npm install -g tldr

# update cache
tldr --update

echo "tldr pages installed successfully."
