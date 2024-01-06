#!/bin/bash

set -evo pipefail

# nvm
if [[ -z "$INSTALL_NVM" ]]
then
    read -p "Install NVM? (Y/n)" INSTALL_NVM
fi
if [[ "$INSTALL_NVM" == [yY] ]]
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.nvm/nvm.sh
    nvm install --lts
    npm install --global esbuild tsx
fi

# go
if [[ -z "$INSTALL_GO" ]]
then
    read -p "Install Go tooling? (Y/n)" INSTALL_GO
fi
if [[ "$INSTALL_GO" == [yY] ]]
then
    brew install go golangci-lint goreleaser
    go install github.com/go-delve/delve/cmd/dlv@master
fi

# rust
if [[ -z "$INSTALL_RUST" ]]
then
    read -p "Install Rust? (Y/n)" INSTALL_RUST
fi
if [[ "$INSTALL_RUST" == [yY] ]]
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
