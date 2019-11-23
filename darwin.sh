#!/bin/bash

#homebrew
if ! [ -x "$(command -v brew)" ]; then 
    echo "no brew command found, installing from the internet"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#iterm
if [[ ! -d "/Applications/iTerm.app" ]]; then
    echo "iTerm not found, installing with brew"
    brew cask install iterm2
fi
ln -sf iterm2 ~/.config/iterm2

#vscode
if [[ ! -d "/Applications/Visual Studio Code.app" ]]; then
    echo "VSCode not found, installing with brew"
    brew cask install visual-studio-code
fi
ln -sf code/settings.json ~/Library/Application\ Support/Code/User/settings.json

#zsh
echo "updating zsh with brew"
brew install zsh
