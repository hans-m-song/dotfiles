#!/bin/bash

if [[ $1 == 'save' ]]; then 
    code --list-extensions | xargs -L 1 echo code --install-extension > code-extentions.sh
    chmod +x code-extentions.sh
elif [[ $1 == 'install' ]]; then
    ./code-extentions.sh
else
    echo "usage: ./code.sh save|install"
fi

