#!/bin/bash

#basic stuff
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
         apt-transport-https \
         build-essential \
         git \
         zsh \
         curl \
         file

#linuxbrew
if [[ ! -d $HOME/.linuxbrew ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

#directory for vscode settings
if [[! -d ~/.config/Code ]]; then mkdir ~/.config/Code; fi
if [[! -d ~/.config/Code/User ]]; then mkdir ~/.config/Code/User; fi

#zsh
if [[ $SHELL != "/usr/bin/zsh" ]]; then chsh -s $(which zsh); fi
