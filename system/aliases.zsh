# Shell
# ----------------------------------------------------------

#alias '#'=':||' # Replace hash with universal comment for zsh compatibiliy (use "# foo")
setopt interactivecomments

# Directory listing
# ----------------------------------------------------------

alias l="ls -alF --icons --colour-scale --header --git -a -g"

# Programs
# ----------------------------------------------------------

alias hideme='history -d $((HISTCMD-1))' # Or just prefix a command with a space =P
alias hideprev='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

alias gooch='google-chrome'

inspect-jq() { x=$(</dev/stdin); echo "$x" | jq -C . > /dev/tty; echo "$x"; }
