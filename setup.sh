#!/bin/bash

chmod +x *.sh

case "$OSTYPE" in
    darwin*)
        echo 'DARWIN setup'
        ./darwin.sh
        ;;
    linux*)
        echo 'LINUX setup'
        ./linux.sh
        ;;
esac

ln -sf .zshrc ~/.zshrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .vimrc ~/.vimrc
