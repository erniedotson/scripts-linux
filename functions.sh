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