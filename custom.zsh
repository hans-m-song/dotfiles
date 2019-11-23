alias gitdogf='git log --format="%h %ai %an %s"'
alias gitdog='gitdogf --decorate --graph'
alias server='ssh h4n5@h4n5-server -p 42'
alias chx='chmod +x '
alias zshs='source $ZSH_CUSTOM/custom.zsh'
alias zshc='vim $ZSH_CUSTOM/custom.zsh && zshs'
alias nipple='sudo vim /etc/tmpfiles.d/trackpoint.conf && sudo systemd-tmpfiles --prefix=/sys --create'
alias tsn='ts-node --files -P tsconfig.json'
alias updateomz='cd $HOME/.oh-my-zsh/ && git stash && git pull && git stash pop'

function refreshnipple () {
    if [[ -f /etc/tmpfiles.d/trackpoint.conf ]] then 
        sudo systemd-tmpfiles --prefix=/sys --create
    fi
}

function music () {
    if [[ $# == 2 ]] then
        cd $2 && 
        pwd &&
        youtube-dl -x --audio-format mp3 $1 && cd -
    elif [[ $# == 1 ]] then
        cd $HOME/Music/staging && 
        pwd &&
        youtube-dl -x --audio-format mp3 $1 && cd -
    else
        echo "need at least 1 argument"
    fi
}

#function musicsync () {
#    if [[ $# == 1 ]]
#        rsync -avh --progress --delete --no-perms ~/Music/ $1
#    else
#        rsync -avh --progress --delete --no-perms ~/Music/ /run/user/1000/gvfs/smb-share:server=h4n5-server,share=media/audio/music
#}

alias sshkey='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github'

# jaca

alias jacastage='cloud_sql_proxy -instances=credfin-gcp:australia-southeast1:staging-update=tcp:3307'
alias jacaprod='cloud_sql_proxy -instances=credfin-gcp:australia-southeast1:production=tcp:3307'
alias jaca='cd $HOME/workspace/jaca/credfin-worker'
function jd() {
    if [[ $# == 1 ]] then
        CRAWLER_OUTPUT_DIR=$CRAWLER_OUTPUT_DIR node dist/debug au_$1 
    elif [[ $# == 2 ]] then
        CRAWLER_OUTPUT_DIR=$CRAWLER_OUTPUT_DIR node dist/debug au_$1 -s $2 
    fi
}
function jdc() {
    npm run compile && jd $*
}
function jdt() {
    echo "$2\n$3\n" | jd $1
}
alias jrevert='git checkout $( git rev-parse HEAD^ ) -- kubernetes/deployments/credfin-chrome-crawler.yaml kubernetes/deployments/credfin-worker.yaml'

