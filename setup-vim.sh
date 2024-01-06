#!/bin/bash
set -evo pipefail

case $(uname -s) in
"Linux")
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
    ;;
"Darwin")
    brew install neovim
    ;;
"*")
    echo "unsupported platform"
    exit 1
    ;;
esac

mkdir -p ~/.config
ln -sf $(pwd)/nvim $HOME/.config/nvim
vim ./nvim/lua/hans-m-song/packer.lua +source +PackerSync
