# Currently enabled shortcuts
source ~/Code/dotfiles/git/aliases.zsh
source ~/Code/dotfiles/docker/aliases.zsh
source ~/Code/dotfiles/greensync/aliases.zsh

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
