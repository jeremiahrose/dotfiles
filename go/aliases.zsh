# Always add verbose flag to go get commands
function go() {
  case $* in
    get* ) shift 1; command go get -v "$@" | more ;;
    * ) command go "$@" ;;
  esac
}

# Always add verbose flag to dep ensure commands
function dep() {
  case $* in
    ensure* ) shift 1; command dep ensure -v "$@" | more ;;
    * ) command dep "$@" ;;
  esac
}
