# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

function ga {
  args="$@"
  if [ -z "$1" ]; then
    args="."
  fi
  eval git add $args
}

function log_and_run_command {
  args="$@"
  echo -n "\e[34m"
  echo -n '--> '
  echo -n $args
  echo "\e[39m"
  eval $args
}

alias gr='git reset'

function grh {
  args="$@"
  log_and_run_command git reset --hard $args
}

function gp {
  args="$@"
  if [ -z "$1" ]; then
    args="origin HEAD"
  fi
  log_and_run_command git push $args
}

function gsubs {
  args="$@"
  log_and_run_command git submodule foreach $args
}

function wip {
  name="wip-$1" && \
  gco -b "$name" && \
  gc -m "$name" && \
  gp origin HEAD --no-verify
}

# The rest of my fun git aliases
# alias gl='git pull --prune'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# alias gl='git log --graph'
alias glp='git log -p'
alias gsh='git show'
alias gpu='gp -u origin HEAD' # Set upstream / track remote branch
alias gps='gsubs git push staging HEAD:master && echo && gp staging HEAD:master'
alias gpp='gsubs git push production HEAD:master && echo && gp production HEAD:master'
alias gpos='gp && echo && gps'
alias gposp='gpos && echo && gpp'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gs='git status'

alias gds='git diff --staged'
alias gdh='git diff HEAD'
alias gpl='git pull'
alias gundoc='git-undo'
alias gclear='git reset --hard'
# alias gsts='git stash save'
alias gsts='git-stash-selection'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'

alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'

alias gcop='git-checkout-commit-previous'
alias gcon='git-checkout-commit-next'

alias gstpl='git-update-from-remote-using-stash'
alias gpcl='git-update-from-remote-using-stash-then-commit'

alias grl='git remote -v'
alias gra='git remote add'
alias grr='git remote remove'

alias ci='open $(hub ci-status -f%U) >/dev/null'
alias ghb='hub browse >/dev/null'
