if (( $+commands[sublim] )); then
  export EDITOR='sublime'
elif (( $+commands[nano] )); then
  export EDITOR='nano'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

if (( $+commands[google-chrome-stable] )); then
  export BROWSER=google-chrome-stable
fi
