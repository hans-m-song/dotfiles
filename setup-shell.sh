#!/bin/bash
set -evo pipefail

OS=$(uname -s)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

case $OS in
Linux)
  sudo apt-get update \
    && sudo apt-get install -y \
      jq \
      tilix \
      tree \
      zsh
  
  # neovim
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  mv nvim.appimage /usr/local/bin/nvim

  # tilix theme
  mkdir -p ~/.config/tilix/schemes
  ln -sf $(pwd)/tilix/one-dark.json $HOME/.config/tilix/schemes/one-dark.json
  echo "please manually enable tilix theme"
  ;;

Darwin)
  brew install \
    neovim \
    spectacle \
    speedcrunch \
    tree \
    wget
  ;;

*)
  echo "unsupported os: $OS"
  exit 1
  ;;
esac

brew install \
  awscli \
  direnv \
  ffmpeg \
  fontconfig \
  gh \
  helmfile \
  k9s \
  kubectx \
  stern \
  tfenv \
  python-yq

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# meslo lgs nf
FONT_DIR=~/.fonts
if [[ -d ~/Library ]]
then
    FONT_DIR=~/Library/Fonts
fi
mkdir -p $FONT_DIR
curl -Lo $FOND_DIR/meslo-lgs-nf-regular.tff https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -Lo $FOND_DIR/meslo-lgs-nf-bold.tff https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -Lo $FOND_DIR/meslo-lgs-nf-italic.tff https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -Lo $FOND_DIR/meslo-lgs-nf-bold-italic.tff https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
if command -v fc-cache
then
    fc-cache -f -v
else
    echo "please manully install fonts"
fi

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i -E 's|ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

cp ./.zshrc ~/.zshrc
cp ./.vimrc ~/.vimrc
cp -R ./.vim ~/.vim
source ~/.zshrc
