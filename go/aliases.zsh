# Always add verbose flag to go get commands
function go() {
  case $* in
    get* ) shift 1; command go get -v "$@" | more ;;
    * ) command go "$@" ;;
  esac
}
