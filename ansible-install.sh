#!/usr/bin/env bash
################################################################################
# PURPOSE      : Install latest Ansible from official Ansible repository
# PARAMETERS   : None
# RETURNS      : 0 on success, non-zero on failure
# DEPENDENCIES : curl, sudo (optional)
# REMARKS      : Supports Debian/Ubuntu and Fedora/RHEL-based distributions
################################################################################

set -e

function die() {
    echo "$*" 1>&2 ; exit 1;
}

function elevate() {
    if command -v sudo 2>&1 >/dev/null; then
        sudo "$@"
    else
        "$@"
    fi
    return $?
}

function need {
    command -v "$1" >/dev/null || die "ERROR: $1 is required but was not found. Please install it and try again."
}

function detect_os_family() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian|linuxmint|pop)
                echo "debian"
                ;;
            fedora|rhel|centos|rocky|almalinux)
                echo "redhat"
                ;;
            *)
                die "Unsupported distribution: $ID"
                ;;
        esac
    else
        die "Cannot detect OS. /etc/os-release not found."
    fi
}

function install_ansible_debian() {
    echo "Installing Ansible on Debian/Ubuntu-based system..."

    # Pre-requisites
    need curl

    # Install required packages
    elevate apt-get update
    elevate apt-get install -y software-properties-common

    # Add Ansible PPA
    elevate add-apt-repository --yes --update ppa:ansible/ansible

    # Install Ansible
    elevate apt-get update
    elevate apt-get install -y ansible

    echo "Ansible installed successfully on Debian/Ubuntu."
}

function install_ansible_redhat() {
    echo "Installing Ansible on RHEL/Fedora-based system..."

    # Detect package manager
    if command -v dnf >/dev/null 2>&1; then
        PKG_MGR="dnf"
    elif command -v yum >/dev/null 2>&1; then
        PKG_MGR="yum"
    else
        die "Neither dnf nor yum found."
    fi

    # Install EPEL repository (for RHEL/CentOS/Rocky/AlmaLinux)
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [[ "$ID" =~ ^(rhel|centos|rocky|almalinux)$ ]]; then
            echo "Installing EPEL repository..."
            elevate $PKG_MGR install -y epel-release
        fi
    fi

    # Install Ansible
    elevate $PKG_MGR install -y ansible

    echo "Ansible installed successfully on RHEL/Fedora."
}

# Main execution
echo "Detecting operating system..."
OS_FAMILY=$(detect_os_family)

case "$OS_FAMILY" in
    debian)
        install_ansible_debian
        ;;
    redhat)
        install_ansible_redhat
        ;;
    *)
        die "Unsupported OS family: $OS_FAMILY"
        ;;
esac

# Verify installation
echo ""
echo "Verifying installation..."
ansible --version || die "Ansible installation verification failed."

echo ""
echo "Ansible installation complete!"
