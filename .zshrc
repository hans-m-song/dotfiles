export ZSH=$HOME/.oh-my-zsh
export CRAWLER_OUTPUT_DIR=$HOME/workspace/jaca/credfin-worker/debugout/
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"
export SERV_BKUP='/run/user/1000/gvfs/smb-share:server=h4n5-server,share=backup/hans/'
export EDITOR=vim
ZSH_THEME="agnoster"
SSH_IDS="id_rsa"
if [[ -f '$HOME/.ssh/github' ]]; then SSH_IDS="$SSH_IDS github"; fi
if [[ -f '$HOME/.ssh/gitlab' ]]; then SSH_IDS="$SSH_IDS gitlab"; fi
zstyle :omz:plugins:ssh-agent identities $SSH_IDS
plugins=(git ssh-agent nvm git-auto-fetch)

source $ZSH/oh-my-zsh.sh

bindkey '^[[C' forward-word
bindkey '^[[D' backward-word

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.npm-global/bin:/opt/jdk1.8.0_191/bin:/opt/ghc/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv); fi

refreshnipple

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
