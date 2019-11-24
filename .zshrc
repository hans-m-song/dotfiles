export ZSH=$HOME/.oh-my-zsh
export CRAWLER_OUTPUT_DIR=$HOME/workspace/jaca/credfin-worker/debugout/
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"

SERV_BKUP='/run/user/1000/gvfs/smb-share:server=h4n5-server,share=backup/hans/'

ZSH_THEME="agnoster"

zstyle :omz:plugins:ssh-agent identities id_rsa github
plugins=(git ssh-agent nvm)

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
