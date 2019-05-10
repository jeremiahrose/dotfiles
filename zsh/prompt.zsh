autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}

gcloud_prompt() {
  local cyan="\e[36m"
  echo "${cyan}$(gcloud-project --current 2>&1)${reset_color}"
}

# https://github.com/jonmosco/kube-ps1
if [ -f "$PROJECTS/kube-ps1/kube-ps1.sh" ]; then
  . "$PROJECTS/kube-ps1/kube-ps1.sh"
  KUBE_PS1_PREFIX=''
  KUBE_PS1_SUFFIX=''
  KUBE_PS1_SYMBOL_ENABLE=false
  KUBE_PS1_CTX_COLOR=32

  get_cluster_short() {
    echo "$1" | sed -E 's/.+_//'
  }

  KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
else
  kube_ps1() {}
fi

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

exit_code_prompt() {
  if [[ "$last_exit_code" == "0" ]]; then
    local exit_code_prompt_colour="%{$fg_bold[green]%}"
  else
    local exit_code_prompt_colour="%{$fg_bold[red]%}"
  fi
  echo "${exit_code_prompt_colour}➜ ${reset_color}"
}

export PROMPT=$'\n$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n$(gcloud_prompt) $(kube_ps1)\n$(exit_code_prompt)'
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  last_exit_code="$?"
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
