#!/bin/bash

echo "What is your system?"
echo "1) MacOS"
echo "2) Debian distro"

read -p ">> " distro

if [ $distro == "1" ]; then
  # --------- MacOS setup -----------
  # Install dependencies using Homebrew
  brew tap homebrew/cask-fonts
  brew install font-fira-code-nerd-font

  brew install ripgrep #Telescope dependency
  brew install npm

  # Node.js language servers
  npm i -g typescript typescript-language-server # TypeScript / JS
  npm i -g vscode-langservers-extracted # Html, Css
  npm i -g bash-language-server # Bash
elif [ $distro == "2" ]; then
  # ---------- Debian setup ---------
  sudo apt update
  sudo apt install -y npm ripgrep nodejs
  mkdir -p ~/.fonts
  cp -rf Fonts/* ~/.fonts
  fc-cache -fv

  # Node.js language servers
  sudo npm i -g typescript typescript-language-server # TypeScript / JS
  sudo npm i -g vscode-langservers-extracted # Html, Css
  sudo npm i -g bash-language-server # Bash
else
  echo "Unknown option. Skipping dependencies."
fi

# Initial Setup file for new systems
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim
cp -rf init.lua "$HOME/.config/nvim"
