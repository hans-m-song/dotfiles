#!/bin/bash

chmod +x *.sh
if [[ ! -d ~/.config ]]; then mkdir ~/.config fi

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

#oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf custom.zsh $ZSH_CUSTOM/custom.zsh

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash && nvm install --lts

ln -sf .zshrc ~/.zshrc
ln -sf .gitconfig ~/.gitconfig
ln -sf .vimrc ~/.vimrc
