gclg() {
  non_repo_args=()
  while [[ $# -gt 0 ]]; do
    case "$1" in
    -*)
      non_repo_args+=("$1")
      shift
      ;;
    *)
      repo="$1"
      shift
      break
      ;;
    esac
  done
  non_repo_args+=("$@")

  if [[ $repo = *"/"* ]]; then
    namespaced_repo=$repo
  else
    namespaced_repo=greensync/$repo
  fi

  gcl "$namespaced_repo" "${non_repo_args[@]}"
}

function ga {
  args="$@"
  if [ -z "$1" ]; then
    args="."
  fi
  eval git add $args
}

function log_and_run_command {
  args="$@"
  echo -n "\e[34m" >&2
  echo -n '--> ' >&2
  echo -n $args >&2
  echo "\e[39m" >&2
  eval $args
}

alias gr='git reset'

function grh {
  args="$@"
  log_and_run_command git reset --hard $args
}

function push_with_check {
  branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
  if [ "$branch" = "master" ] || [ "$branch" = "main" ] || [ "$branch" = "staging" ] || [ "$branch" = "prod-au" ] || [ "$branch" = "sandbox" ]
  then
    if read -q "choice?Do you really want to push to $branch? [y|n] "; then
      git push $@
    else
      echo
    fi
  else
    git push $@
  fi
}

function gsubs {
  args="$@"
  log_and_run_command git submodule foreach $args
}

function wip {
  name="wip-$1" &&
    gco -b "$name" &&
    gc -m "$name" &&
    gp origin HEAD --no-verify
}

# The rest of my fun git aliases
# alias gl='git pull --prune'
alias gl="git log --decorate --oneline --graph --all -n17"
# alias gl='git log --graph'
alias gap='git add -p'
alias glp='git log -p'
alias gsh='git show'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gp='push_with_check origin HEAD'
alias gpfwl='push_with_check --force-with-lease origin HEAD'
# alias gpf='gp origin HEAD --force-with-lease'
alias gpu='push_with_check -u origin HEAD'
# alias gpuf='gpu --force-with-lease'
# alias gpufn='gpu --force-with-lease --no-verify'
# alias gpun='gpu --no-verify'
# alias gps='gsubs git push staging HEAD:master && echo && gp staging HEAD:master'
# alias gpp='gsubs git push production HEAD:master && echo && gp production HEAD:master'
alias gpos='gp && echo && gps'
alias gposp='gpos && echo && gpp'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit --amend'
alias gcf='git commit --fixup'
alias gcan='git commit --amend --no-edit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gbl='gb -a --sort=committerdate --color'
alias gblr='gbl | tail'
alias gs='git status' # upgrade your git if -sb breaks for you. it's fun.
# alias gs='git statusdfsgdhs'

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
alias grbm='git rebase $(git-primary-branch-name)'
alias grbi='git rebase -i'
alias grbim='git rebase -i $(git-primary-branch-name)'
alias grbc='git rebase --continue'

alias gcop='git-checkout-commit-previous'
alias gcon='git-checkout-commit-next'

alias gstpl='git-update-from-remote-using-stash'
alias gpcl='git-update-from-remote-using-stash-then-commit'

alias grl='git remote -v'
alias gra='git remote add'
alias grr='git remote remove'

alias ci='cis | tee /dev/stderr | grep -oE "https://\S+" | head -1 | xargs -r open &>/dev/null'

# Check out the primary branch
gcom() {
  local branch_name
  branch_name="$(git-primary-branch-name)"
  if [[ -n "$branch_name" ]]; then
    log_and_run_command git checkout "$branch_name"
  else
    echo "Couldn't determine primary branch; assuming repo has no commits"
  fi
}

# Return the name of the primary branch
git-primary-branch-name() {
  local dirname_branch
  dirname_branch=$(git rev-parse --show-toplevel | grep -oP '(?<=:)\S+')
  if [[ -n "$dirname_branch" ]]; then
    echo -n "$dirname_branch"
  elif git branch -al | grep -E '^ *remotes/origin/main$' >/dev/null; then
    echo -n main
  elif git branch -al | grep -E '^ *remotes/origin/master$' >/dev/null; then
    echo -n master
  fi
}

alias gcoa=git-co-authors
