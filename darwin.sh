#!/bin/bash

#homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#iterm
brew cask install iterm2
ln -sf iterm2 ~/.config/iterm2

#vscode
brew cask install visual-studio-code
ln -sf code/settings.json ~/Library/Application\ Support/Code/User/settings.json

#zsh
brew install zsh
