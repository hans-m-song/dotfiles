#!/bin/bash
set -eo pipefail

OS=$(uname -s)

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew completions link

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

  /opt/homebrew/bin/brew install \
    doll \
    fork \
    iterm2 \
    karabiner-elements \
    rectangle \
    slack \
    speedcrunch \
    stats \
    zerotier-one
  ;;

*)
  echo "unsupported os: $OS"
  exit 1
  ;;
esac

/opt/homebrew/bin/brew install \
  awscli \
  direnv \
  fd \
  fontconfig \
  gh \
  helmfile \
  hugo \
  jq \
  k9s \
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

cp ./.zshrc ~/.zshrc
source ~/.zshrc

ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.p10k.zsh $HOME/.p10k.zsh
