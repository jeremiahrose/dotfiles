function log_and_run_command {
  args="$@"
  echo -n "\e[34m" >&2
  echo -n '--> ' >&2
  echo -n $args >&2
  echo "\e[39m" >&2
  eval $args
}

alias tf='log_and_run_command terraform'
alias tfg='tf get'
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply'
