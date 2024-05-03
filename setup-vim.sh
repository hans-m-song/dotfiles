#!/bin/bash
set -eo pipefail

command -v nvim >/dev/null || install neovim

if [[ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

mkdir -p ~/.config
ln -sf ./nvim $HOME/.config/nvim
vim ./nvim/lua/hans-m-song/packer.lua +source +PackerSync
