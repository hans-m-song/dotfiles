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
    echo "no powerline fonts found, installing from the internet"
    git clone --depth=1 https://github.com/powerline/fonts.git ~/.misc/fonts && ~/misc/fonts/install.sh
fi

#oh-my-zsh
if [[ -z $ZSH ]]; then
    echo "no oh-my-zsh installation found, installing from the internet"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
ln -f custom.zsh $ZSH_CUSTOM/custom.zsh

#nvm
if ! [ -x "$(command -v nvm)" ]; then
    echo "no nvm command found, installing from internet"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash && nvm install --lts
fi

ln -f .zshrc ~/.zshrc
ln -f .gitconfig ~/.gitconfig
ln -f .vimrc ~/.vimrc
