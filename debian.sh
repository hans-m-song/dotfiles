#!/bin/bash

#basic stuff
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
         apt-transport-https \
         build-essential \
         git \
         curl \
         wget \
         file \
         zsh 

#linuxbrew
if [[ ! -d $HOME/.linuxbrew ]]; then
    echo "linuxbrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [[ $1 = "server" ]]; then
    echo "server"
    #pihole
    curl -sSL https://install.pi-hole.net | bash

    #deluge
    sudo add-apt-repository ppa:deluge-team/ppa
    sudo apt-get update

    sudo apt install -y \
            minidlna \
            samba \
            deluge
else
    echo "regular"
    #vscodium
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | \
        sudo apt-key add -
    
    echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | \
        sudo tee --append /etc/apt/sources.list.d/vscodium.list
    
    if [[ ! -d ~/.config/VSCodium ]]; then mkdir ~/.config/VSCodium; fi
    if [[ ! -d ~/.config/VSCodium/User ]]; then mkdir ~/.config/VSCodium/User; fi
    
    sudo apt update
    sudo apt install -y \
        mysql-workbench \
        codium

    sudo snap install slack --classic
fi

#zsh
if [[ $SHELL != "/usr/bin/zsh" ]]; then chsh -s $(which zsh); fi
