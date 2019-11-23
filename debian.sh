#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
         build-essential git zsh curl wget

#zsh
if [[ $SHELL != "/usr/bin/zsh" ]]; then chsh -s $(which zsh); fi
