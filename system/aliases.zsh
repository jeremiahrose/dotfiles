# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  ls_bin="gls"
else
  ls_bin="ls"
fi

alias '#'=':||' # Replace hash with universal comment for zsh compatibiliy (use "# foo")

alias ls="$ls_bin -F --color"
alias l="$ls_bin -lAh --color"
alias ll="$ls_bin -l --color"
alias la="$ls_bin -A --color"

alias '..'='cd ..'

alias als='alsamixer'

alias hideme='history -d $((HISTCMD-1))' # Or just prefix a command with a space =P
alias hideprev='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

alias gooch='google-chrome'
alias gcgpu='google-chrome-with-gpu'
