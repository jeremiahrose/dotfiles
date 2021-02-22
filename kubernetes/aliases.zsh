function log_and_run_command {
  args="$@"
  echo -en "\e[34m" >&2
  echo -en '--> ' >&2
  echo -en $args >&2
  echo -e "\e[39m" >&2
  eval $args
}

function k {
  args="$@"
  log_and_run_command kubectl $args
}

alias kg='k get'
alias kgp='kg pod'
alias kgn='kg node'
alias kgs='kg secret'
alias kgi='kg ingress'
alias kd='k describe'
alias kdp='kd pod'
alias kdn='kd node'
alias kds='kd secret'
alias kdi='kd ingress'
alias ke='k exec -it'
