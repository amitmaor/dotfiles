#!/bin/sh
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install antibody || brew upgrade antibody
antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
antibody update
