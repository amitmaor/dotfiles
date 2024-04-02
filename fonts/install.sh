#!/bin/sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono font-hack
