#!/bin/bash

wd() {
  ./auto/with-deploytools bash -ic "echo -e \"$( (echo; cat ~/.dotfiles/kubernetes/aliases.zsh) | base64)\" | base64 -d >> ~/.bashrc && bash"
}
