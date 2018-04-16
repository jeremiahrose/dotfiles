function log_and_run_command {
  args="$@"
  echo -n "\e[34m"
  echo -n '--> '
  echo -n $args
  echo "\e[39m"
  eval $args
}

alias tf='log_and_run_command terraform'
alias tfg='tf get'
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply'
