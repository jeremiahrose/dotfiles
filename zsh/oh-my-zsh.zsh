touch ~/.z
source "$ZSH/oh-my-zsh/plugins/z/z.sh"
unalias z
function z {
  if _z "$1" 2>&1; then
    echo -n "\\e[34m" # blue
    pwd
  else
    echo -n "\\e[31m" # red
    echo "Directory match not found" >&2
  fi
  echo -n "\\e[39m"
}
