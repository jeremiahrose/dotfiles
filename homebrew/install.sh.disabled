#!/bin/sh
#
# Homebrew (linuxbrew)
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew (linuxbrew) for you."
  echo "    Installing dependencies."
  sudo apt-get install -y build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
  echo "    Disabling conflicting pkg-config at /usr/bin/pkg-config"
  sudo mv /usr/bin/pkg-config /usr/bin/pkg-config.orig_before_homebrew_installed
  echo "    Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
fi

# Install homebrew packages
brew install coreutils spark
# This is separate so as to prevent not installing the others due to a 404 on this currently
brew install grc

exit 0