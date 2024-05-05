exists() { command -v $1 >/dev/null; }

eval "$(/opt/homebrew/bin/brew shellenv zsh)"
export EDITOR=vim
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git ssh-agent)
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
source $ZSH/oh-my-zsh.sh

exists nvim && alias vim=nvim
exists pip3 && alias pip=pip3
exists python3 && alias python=python3

exists atlas && eval "$(atlas completion zsh)"
exists direnv && eval "$(direnv hook zsh)"
exists gh && eval "$(gh completion --shell zsh)"
exists helm && eval "$(helm completion zsh)"
exists kubectl && eval "$(kubectl completion zsh)"
exists aws && complete -o nospace -C aws_completer aws
exists terraform && complete -o nospace -C terraform terraform

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
