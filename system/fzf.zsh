# Setup fzf
# ---------
[[ ! "$PATH" == *$HOME/.fzf/bin* ]] && [ -d "$HOME/.fzf/bin" ] && export PATH="$PATH:$HOME/.fzf/bin"

# Auto-completion
# ---------------
if [[ $- == *i* ]]; then
  if [ -f /usr/share/fzf/completion.zsh ]; then
    source /usr/share/fzf/completion.zsh 2> /dev/null
  elif [ -f "$HOME/.fzf/shell/completion.zsh" ]; then
    source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
  fi
fi

# Key bindings
# ------------
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
elif [ -f "$HOME/.fzf/shell/key-bindings.zsh" ]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi
