#!/usr/bin/env bash
# set -e

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

function thefuckInstall {
    # See: https://github.com/nvbn/thefuck#installation

    os=$(getOsType)
    if [ "$os" == "linux" ]; then
        # Only supporting apt for now...
        sudo apt update || return 1
        sudo apt install -y thefuck || return 1
    elif [ "$os" == "mac" ]; then
        # Untested
        brew install thefuck || return 1
    else
        echo "Unsupported OS"
        return 1
    fi

    # Update startup script
    if [ -f ~/.bashrc ]; then
        echo "Updating ~/.bashrc..."
        grep -qxF 'eval $(thefuck --alias)' .bashrc || echo 'eval "eval $(thefuck --alias)' >> .bashrc
    fi
    if [ -f ~/.zshrc ]; then
        echo "Updating ~/.zshrc..."
        grep -qxF 'eval $(thefuck --alias)' .zshrc || echo 'eval "eval $(thefuck --alias)' >> .zshrc
    fi

    return 0
}

thefuckInstall && echo "thefuck installed successfully." || echo "thefuck install failed."
