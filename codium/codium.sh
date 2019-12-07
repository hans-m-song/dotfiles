#!/bin/bash

if [[ $1 == 'save' ]]; then 
    codium --list-extensions | xargs -L 1 echo codium --install-extension > ~/dotfiles/codium/extentions.sh
    chmod +x ~/dotfiles/codium/extentions.sh
elif [[ $1 == 'install' ]]; then
    ~/dotfiles/codium/extentions.sh
else
    echo "usage: ./codium.sh save|install"
fi

