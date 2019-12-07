#!/bin/bash

#homebrew
if ! [ -x "$(command -v brew)" ]; then 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install \
         zsh

brew cask install \
         iterm2 \
         slack \
         vscodium \
         mysqlworkbench
