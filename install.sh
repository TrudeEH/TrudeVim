#!/bin/bash

# Install dependencies using Homebrew
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

brew install ripgrep #Telescope dependency

# Install Language Servers
brew install npm
npm i -g typescript typescript-language-server # TypeScript / JS
npm i -g vscode-langservers-extracted # Html, Css
npm i -g bash-language-server # Bash

# Initial Setup file for new systems
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim
cp -rf init.lua "$HOME/.config/nvim"
