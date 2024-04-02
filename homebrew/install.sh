#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Check for Homebrew
if test $(which brew)
then
  brew update
  brew bundle --global
  brew cleanup
else
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.env-vars
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

exit 0
