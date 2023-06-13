#!/bin/bash

set -x

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install \
  awscli \
  direnv \
  gh \
  git-secret \
  gnupg \
  helmfile \
  jq \
  k9s \
  kubectx \
  neovim \
  python3 \
  spectacle \
  speedcrunch \
  stern \
  terraform \
  tree \
  wget \
  yq \
  zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i -E 's|ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

cp ./.zshrc ~/.zshrc
cp ./.vimrc ~/.vimrc
cp -R ./.vim ~/.vim
source ~/.zshrc
