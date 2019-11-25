#!/bin/bash

#homebrew
if ! [ -x "$(command -v brew)" ]; then 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

./brew.sh

ln -f code/settings.json ~/Library/Application\ Support/Code/User/settings.json
