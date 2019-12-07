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
         wget \
         file \
         zsh \
         mysql-workbench

sudo snap install slack --classic

#vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt install -y codium

#linuxbrew
if [[ ! -d $HOME/.linuxbrew ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

#directory for vscodium settings
if [[! -d ~/.config/VSCodium ]]; then mkdir ~/.config/VSCodium; fi
if [[! -d ~/.config/VSCodium/User ]]; then mkdir ~/.config/VSCodium/User; fi

#zsh
if [[ $SHELL != "/usr/bin/zsh" ]]; then chsh -s $(which zsh); fi
