# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
# alias gl='git pull --prune'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# alias gl='git log --graph'
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gs='git status'

alias gds='git diff --staged'
alias gdh='git diff HEAD'
alias gpl='git pull'
alias gundoc="git reset --soft 'HEAD^'"
alias gclear='git reset --hard'
alias gcop='git checkout HEAD~1'
alias gcon='git_next'
alias gsts='git stash save'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'

# Functions
# ==============================================================================
# TODO: move into own file

# Git stash & pull & pop stash
# ------------------------------------------------------------------------------
# Update from remote -- stash any changes, pull new commits, pop stash
# TODO: test more thoroughly
function gstpl {
  echo "Stash save..."
  git stash | grep "No local changes to save" > /dev/null
  stashed=$?
  test $stashed -eq 0 && echo "Nothing to stash"
  test $stashed -ne 0 && echo "Stash saved"

  echo "Pull..."
  git pull

  test $stashed -ne 0 && echo "Stash pop..." && git stash pop && echo "Stash pop'd"
}

# Git stash & pull & pop stash & commit
# ------------------------------------------------------------------------------
# Probably not a good idea to automate this, on second thought
# TODO: test more thoroughly
function gplc {
  gstpl

  echo "Commit..."
  git commit "$@"
  committed=$?

  echo "Status..."
  git status

  test $committed -eq 0 && echo "Press Enter to push, or Ctrl+C to cancel" && read && git push
}

# Checkout next (newer) commit
# ------------------------------------------------------------------------------
# TODO: test more thoroughly
git_next() {
    BRANCH=`git show-ref | grep $(git show-ref -s -- HEAD) | sed 's|.*/\(.*\)|\1|' | grep -v HEAD | sort | uniq`
    HASH=`git rev-parse $BRANCH`
    PREV=`git rev-list --topo-order HEAD..$HASH | tail -1`
    git checkout $PREV
}