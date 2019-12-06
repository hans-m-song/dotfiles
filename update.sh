#!/bin/bash

# merge left file ($1) INTO right file ($2)
function merge () {
    if [[ -f $2 ]]; then
        sdiff -o $2 $1 $2
    else
        cp $1 $2
    fi
}

merge .zshrc ~/.zshrc
merge .gitconfig ~/.gitconfig
merge .vimrc ~/.vimrc
merge custom.zsh $ZSH_CUSTOM/custom.zsh

case "$OSTYPE" in
    darwin*)
        merge code/settings.json ~/Library/Application\ Support/Code/User/settings.json
        ;;
    linux*)
        merge code/settings.json ~/.config/Code/User/settings.json
        ;;
esac
