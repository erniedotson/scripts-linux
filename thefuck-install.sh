#!/usr/bin/env bash
# set -e

function die() {
    echo "$*" 1>&2 ; exit 1;
}

function getOsType {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     os=linux;;
        Darwin*)    os=mac;;
        CYGWIN*|MINGW*|MSYS*)    os=windows;;
        *)          os="UNKNOWN:${unameOut}"
    esac
    echo ${os}
}

function getSudoCmd {
    sudo --help &>/dev/null && echo "sudo" || echo " "
}

# Dependencies: die, grep
function thefuckInstall {
    # See: https://github.com/nvbn/thefuck#installation

    sudoCmd=$(getSudoCmd)

    os=$(getOsType)
    if [ "$os" == "linux" ]; then
        # Only supporting apt for now...
        ${sudoCmd} apt update || die "apt update command failed."
        ${sudoCmd} apt install -y thefuck || die "apt install command failed."
    elif [ "$os" == "mac" ]; then
        # Untested
        brew install thefuck || die "brew install command failed".
    else
        die "Unsupported OS"
    fi

    # Update startup script
    if [ -f ~/.bashrc ]; then
        echo "Updating ~/.bashrc..."
        grep -qxF 'eval $(thefuck --alias)' ~/.bashrc || echo 'eval $(thefuck --alias)' >> ~/.bashrc
    fi
    if [ -f ~/.zshrc ]; then
        echo "Updating ~/.zshrc..."
        grep -qxF 'eval $(thefuck --alias)' ~/.zshrc || echo 'eval $(thefuck --alias)' >> ~/.zshrc
    fi

    return 0
}

grep --help &>/dev/null || die "Grep not found. Please install it."
thefuckInstall && echo "thefuck installed successfully. Open a new shell or execute: source ~/.bashrc" || echo "thefuck install failed."
