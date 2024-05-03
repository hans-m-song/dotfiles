exists() { command -v $1 >/dev/null; }

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git ssh-agent)
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
source $ZSH/oh-my-zsh.sh

exists nvim && alias vim=nvim
exists pip3 && alias pip=pip3
exists python3 && alias python=python3

export EDITOR=vim
export PATH=$PATH:/opt/homebrew/bin

exists brew && eval "$(brew shellenv zsh)"
exists direnv && eval "$(direnv hook zsh)"
exists gh && eval "$(gh completion --shell zsh)"
exists helm && eval "$(helm completion zsh)"
exists kubectl && eval "$(kubectl completion zsh)"
(
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /opt/homebrew/Cellar/tfenv/3.0.0/versions/1.8.2/terraform terraform
)
(
  autoload -Uz compinit && compinit
)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
