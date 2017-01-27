#!/bin/bash
#set -ex

# Get some info about our OS
# See: https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
OS=$(lsb_release -si)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)

if [ "${OS}" == "Ubuntu" ]; then
  # Tested on Ubuntu 14.04 Trusty 64
  sudo apt-get update
  sudo apt-get -y upgrade

  # Install janus pre-reqs
  sudo apt-get install -y git
  sudo apt-get install -y ruby-dev rake exuberant-ctags ack-grep

  #Install janus
  curl -L https://bit.ly/janus-bootstrap | bash
else
  echo "Unsupported OS: ${OS}"
  exit 1
fi
