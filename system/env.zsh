if (( $+commands[sublim] )); then
  export EDITOR='sublime'
elif (( $+commands[nano] )); then
  export EDITOR='nano'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi
