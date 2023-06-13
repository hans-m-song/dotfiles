export ZSH=$HOME/.oh-my-zsh
export NVM_DIR="$HOME/.nvm"
export EDITOR=vim

ZSH_THEME="powerlevel10k/powerlevel10k"
# zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
plugins=(aws gh git ssh-agent kubectl)
source $ZSH/oh-my-zsh.sh
autoload -U add-zsh-hook
autoload -U cominit
compinit

# direnv
eval "$(direnv hook zsh)"

# nvm
load-nvmrc() {
  test -f .nvmrc && command -v nvm >/dev/null && nvm use
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# aliases
alias python=python3
alias pip=pip3
alias nvim=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
