# scripts-linux

## Pre-requisites

For tools that use ansible playbooks:

* Install `ansible` and `ansible-galaxy`
* Install ansible-galaxy dependencies: `cd ansible && ansible-galaxy install -r requirements.yaml`

## Install Scripts

| Icon | Application | Install command |
| ---- | ----------- | --------------- |
| <img width="32" src="https://cdn.simpleicons.org/ansible"> | [Ansible](https://www.ansible.com/) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/ansible-install.sh \| /bin/bash` |
|      | [AWS CLI](https://docs.aws.amazon.com/cli/) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/awscli-install.sh \| /bin/bash` |
| <img width="32" src="https://cdn.simpleicons.org/docker"> | [Docker](https://www.docker.com/) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/docker-install.sh \| /bin/bash` |
| <img width="32" src="https://cdn.simpleicons.org/helm"> | [Helm](https://helm.sh/docs/intro/install/#from-script) | `curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \| bash` |
| <img width="32" src="https://cdn.simpleicons.org/k3s"> | [k3s](https://docs.k3s.io/quick-start) | `curl -sfL https://get.k3s.io \| sh -` |
| <img width="32" src="https://cdn.simpleicons.org/kubernetes"> | [kubectl](https://kubernetes.io/docs/reference/kubectl/) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/kubectl-install.sh \| /bin/bash` |
| <img width="32" src="https://cdn.simpleicons.org/starship"> | [Starship Cross-shell Prompt](https://starship.rs/) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/starship-install.sh \| /bin/bash ` |
|      | [The Fuck](https://github.com/nvbn/thefuck) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/thefuck-install.sh \| /bin/bash` |
|      | [tldr pages](https://tldr.sh) | `curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/tldr-install.sh \| /bin/bash` |
| <img width="32" src="https://zellij.dev/img/logo.png"> | [zellij](https://zellij.dev/) | `ansible-playbook --connection=local --inventory 127.0.0.1, ansible/playbooks/zellij.yaml` |

## Utility scripts

- **mmd2svg.sh** - Convert mermaid.js .mmd file to .svg image file

## Resources

* [den-is/ansible-collection-tools | Github](https://github.com/den-is/ansible-collection-tools) - Ansible roles for installing common utilities