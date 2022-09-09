#!/usr/bin/env bash
# set -e

function starshipInstall {
    # Install
    curl -sS https://starship.rs/install.sh -o /tmp/install.sh || exit 1
    chmod +x /tmp/install.sh || exit 1
    sudo -E sh -c "/tmp/install.sh -y" || exit 1
    rm /tmp/install.sh

    # Update profile files
    if [ -f ~/.bashrc ]; then
        echo "Updating ~/.bashrc..."
        grep -qxF 'eval "$(starship init bash)"' ~/.bashrc || echo 'eval "$(starship init bash)"' >> ~/.bashrc
    fi
    if [ -f ~/.zshrc ]; then
        echo "Updating ~/.zshrc..."
        grep -qxF 'eval "$(starship init zsh)"' ~/.zshrc || echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    fi

    echo "Starship installed. Log out and back in or: source ~/.bashrc"
}

starshipInstall
