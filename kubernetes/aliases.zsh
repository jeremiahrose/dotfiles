function log_and_run_command {
  args="$@"
  echo -en "\e[34m"
  echo -en '--> '
  echo -en $args
  echo -e "\e[39m"
  eval $args
}

function k {
  args="$@"
  log_and_run_command kubectl $args
}

alias kg='k get'
alias kgp='k get pods'
alias kgn='k get nodes'
alias kgs='k get services'
alias kgi='k get ingresses'
alias kd='k describe'
alias kdp='k describe pods'
alias kdn='k describe nodes'
alias kds='k describe services'
alias kdi='k describe ingresses'
alias ke='k exec -it'
