#!/bin/bash

# merge/copy $1 into $2
function merge () {
    if [[ -f "$2" ]]; then
        echo "merging $1 into $2"
        sdiff -o "$2" "$1" "$2"
    else
        echo "copying $1 to $2"
        cp "$1" "$2"
    fi
}

merge .zshrc ~/.zshrc
merge .gitconfig ~/.gitconfig
merge .vimrc ~/.vimrc
merge custom.zsh $ZSH/custom/custom.zsh

case "$OSTYPE" in
    darwin*)
        merge codium/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
        ;;
    linux*)
        if [[ $1 = "server" ]]; then
            merge smb.conf /etc/samba/smb.conf
            merge minidlna.conf /etc/minidlna.conf
            #not sure about this merge hdparm.conf /etc/hdparm.conf
            echo "server merge"
        else
            merge codium/settings.json ~/.config/VSCodium/User/settings.json
        fi
        ;;
esac

