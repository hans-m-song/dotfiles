#!/bin/bash
set -eo pipefail

OS=$(uname -s)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

case $OS in
Linux)
  sudo apt-get update
  sudo apt-get install -y \
    speedcrunch \
    tilix \
    zsh

  # tilix theme
  mkdir -p ~/.config/tilix/schemes
  ln -sf $(pwd)/tilix/one-dark.json $HOME/.config/tilix/schemes/one-dark.json
  echo "please manually enable tilix theme"
  ;;

Darwin)
  xcode-select --install

  brew install \
    fork \
    iterm2 \
    rectangle \
    slack \
    speedcrunch \
    stats \
    visual-studio-code \
    zerotier-one
  ;;

*)
  echo "unsupported os: $OS"
  exit 1
  ;;
esac

brew install \
  ansible \
  awscli \
  direnv \
  eksctl \
  ffmpeg \
  fontconfig \
  gh \
  helmfile \
  hugo \
  jq \
  k9s \
  kubectx \
  neofetch \
  neovim \
  python-yq \
  ripgrep \
  stern \
  tree \
  wget

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
sed -i -E 's|ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

cp ./.zshrc ~/.zshrc
source ~/.zshrc
