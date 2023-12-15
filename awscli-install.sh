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

function need {
  which "$1" >/dev/null || die "ERROR: $1 is required but was not found. Please install it and try again."
}

# Dependencies: curl, die, need
function awscliInstall {
    # See: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

    need "curl"
    need "unzip"

    sudoCmd=$(getSudoCmd)

    os=$(getOsType)
    if [ "$os" == "linux" ]; then
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" || die "Failed to curl awscli zip"
      unzip /tmp/awscliv2.zip -d /tmp/ || die "Failed to unzip"
      ${sudoCmd} /tmp/aws/install || die "Install failed"
    else
        die "Unsupported OS"
    fi

    return 0
}

if which aws >/dev/null; then
  echo "AWS CLI found. Skipping install.";
  exit 0;
fi

awscliInstall && echo "AWS CLI installed successfully." || echo "AWS CLI install failed."
