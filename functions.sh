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
# os=$(getOsType)
# echo "Detected OS type: ${os}"

# if [ "$os" == "linux" ]; then
#     echo "Linux"
# elif [ "$os" == "windows" ]; then
#     echo "Windows"
# else
#     ...
# fi

# Example Usage: sudoCmd=$(getSudoCmd); echo $sudoCmd
function getSudoCmd {
    sudo --help &>/dev/null && echo "sudo" || echo ""
}

# Depends on: die
function need {
  which "$1" >/dev/null || die "ERROR: $1 is required but was not found. Please install it and try again."
}
