#!/bin/bash

wd() {
  ./auto/with-deploytools bash -c "echo -e \"$( (cat ~/.dotfiles/kubernetes/aliases.zsh; printf 'PS1="\\[\\n\\e[36;1m\\]$PS1\\[\\e[0m\\]"') | base64)\" | base64 -d >> ~/.bashrc && bash"
}
