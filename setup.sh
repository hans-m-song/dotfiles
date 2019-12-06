#!/bin/bash

if [[ ! -d ~/.config ]]; then mkdir ~/.config; fi
if [[ ! -d ~/.misc ]]; then mkdir ~/.misc; fi

case "$OSTYPE" in
    darwin*)
        echo "DARWIN setup"
        ./darwin.sh
        ;;
    linux*)
        echo "LINUX setup"
        ./debian.sh
        ;;
esac

#fonts
if [[ ! -d ~/.misc/fonts ]]; then
    git clone --depth=1 https://github.com/powerline/fonts.git ~/.misc/fonts && ~/.misc/fonts/install.sh
fi

#oh-my-zsh
if [[ -z $ZSH ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#nvm
if ! [ -z $NVM_DIR ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash 
fi

./brew.sh

./merge.sh
