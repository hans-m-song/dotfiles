exists() { command -v $1 >/dev/null; }

export EDITOR=vim
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export PATH=$PATH:$HOME/bin

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git ssh-agent)
zstyle ':omz:plugins:ssh-agent' identities id_rsa id_ed25519
zstyle ':completion:*:*:make:*' tag-order 'targets' # makefile autocompletion
source $ZSH/oh-my-zsh.sh

exists nvim && alias vim=nvim
exists pip3 && alias pip=pip3
exists python3 && alias python=python3

exists atlas && eval "$(atlas completion zsh)"
exists borg && eval "$(borg completion zsh)"
exists gh && eval "$(gh completion --shell zsh)"
exists helm && eval "$(helm completion zsh)"
exists kubectl && eval "$(kubectl completion zsh)"
exists aws && complete -o nospace -C aws_completer aws
exists terraform && complete -o nospace -C terraform terraform

exists direnv && eval "$(direnv hook zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
