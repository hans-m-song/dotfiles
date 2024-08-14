exists_cmd() { command -v $1 >/dev/null; }
exists_file() { test -f $1 >/dev/null; }

exists_file && eval "$(/opt/homebrew/bin/brew shellenv zsh)"
exists_cmd direnv && eval "$(direnv hook zsh)"

export EDITOR=vim
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/go/bin
export NVM_DIR="$HOME/.nvm"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git ssh-agent)
[[ -d $NVM_DIR ]] && plugins+=(nvm)
zstyle ':omz:plugins:ssh-agent' identities id_rsa id_ed25519
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':completion:*:*:make:*' tag-order 'targets' # makefile autocompletion
exists_file $ZSH/oh-my-zsh.sh && source $ZSH/oh-my-zsh.sh
exists_file $HOME/.p10k.zsh && source $HOME/.p10k.zsh

exists_cmd nvim && alias vim=nvim
exists_cmd pip3 && alias pip=pip3
exists_cmd python3 && alias python=python3
exists_cmd digs && alias dig="dig +noall +answer"
exists_cmd helmfile && alias helmfile="helmfile --skip-deps"
