#!/usr/bin/env bash

function die() {
    echo "$*" 1>&2 ; exit 1;
}

function getSudoCmd {
    sudo --help &>/dev/null && echo "sudo" || echo " "
}

# Pre-reqs
sudoCmd=$(getSudoCmd)
USER=${USER:-root}
curl --help &>/dev/null || die "curl not found. Please install it."

# Install
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh || die "Failed to download instlal script."
sh /tmp/get-docker.sh || die "get-docker.sh script failed."

# Post-install steps
# See: https://docs.docker.com/engine/install/linux-postinstall/
# ${sudoCmd} groupadd docker || true
${sudoCmd} usermod -aG docker $USER
# newgrp docker 
# docker run hello-world || die "Failed to run hello-world"

${sudoCmd} systemctl enable docker.service
${sudoCmd} systemctl enable containerd.service

echo "Docker installed."
echo "Log off and log back on for the docker group membership to take effect."
