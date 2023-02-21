#!/bin/bash

# Install dependencies using Homebrew
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

brew install ripgrep #Telescope dependency

# Initial Setup file for new systems
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim
cp -rf init.lua "$HOME/.config/nvim"
