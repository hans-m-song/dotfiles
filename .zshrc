export ZSH=$HOME/.oh-my-zsh
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"
export EDITOR=vim

ZSH_THEME="wezm+"
zstyle :omz:plugins:ssh-agent identities id_rsa
plugins=(git ssh-agent kubectl)

source $ZSH/oh-my-zsh.sh

bindkey "^[[C" forward-word
bindkey "^[[D" backward-word
