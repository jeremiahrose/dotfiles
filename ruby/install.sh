#!/bin/sh

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  sudo apt-get install rbenv > /tmp/rbenv-install.log
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-build for you."
  sudo apt-get install ruby-build > /tmp/ruby-build-install.log
fi
