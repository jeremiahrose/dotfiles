# Currently enabled shortcuts
source ~/Code/dotfiles/git/aliases.zsh
source ~/Code/dotfiles/docker/aliases.zsh
source ~/Code/dotfiles/greensync/aliases.zsh
source ~/Code/dotfiles/zsh/aliases.zsh

# source ~/Code/dex-core/scripts/shell-utils/jq.sh
# source ~/Code/dex-core/scripts/shell-utils/jwt.sh

# Set up Python bin path
export PATH=$(python3 -m site --user-base)/bin:$PATH

# Update PATH for the Google Cloud SDK.
if [ -f '/Users/jez/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jez/google-cloud-sdk/path.zsh.inc'; fi

# Enable shell command completion for gcloud.
if [ -f '/Users/jez/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jez/google-cloud-sdk/completion.zsh.inc'; fi

# Initialise rbenv
eval "$(rbenv init - zsh)"

# Customise the prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
precmd() {
    vcs_info
}
setopt prompt_subst
PROMPT='%F{yellow}%n@%m %1~ ${vcs_info_msg_0_} %# %f'
