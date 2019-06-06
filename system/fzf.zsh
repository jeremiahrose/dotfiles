# Setup fzf
# ---------
[[ ! "$PATH" == *$HOME/.fzf/bin* ]] && [ -d "$HOME/.fzf/bin" ] && export PATH="$PATH:$HOME/.fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && [ -f "$HOME/.fzf/shell/completion.zsh" ] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
[ -f "$HOME/.fzf/shell/key-bindings.zsh" ] && source "$HOME/.fzf/shell/key-bindings.zsh"
