#!/bin/bash
set -ex

# See: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

cd /tmp

# Download the latest release
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate the binary
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Test it
kubectl --help &>/dev/null

# Cleanup
rm /tmp/kubectl
rm /tmp/kubectl.sha256

# Success
echo "kubectl is installed!"

