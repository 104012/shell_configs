### CUSTOM SHELL

[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f /etc/bashrc ] && source /etc/bashrc

# alias
alias ls="ls --color=auto"
alias ll="ls -la"

# vi setup
if hash vim 2> /dev/null; then
    alias vi="vim"
    export EDITOR="vim"
else
    export EDITOR="vi"
fi; 

function portquiz() {
    local port="${1-80}"
    wget -qO- "portquiz.net:$port"
}

function speedtest() {
    local size="${1-100}"
    local url="http://speedtest.wdc01.softlayer.com/downloads/test${size}.zip"
    if hash wget 2> /dev/null; then
        wget -O /dev/null $url
    else
        curl $url > /dev/null
    fi
}

function extract() {
    case $1 in
        *.tar.bz2)   
            tar xvjf $1;;
        *.tar.gz)    
            tar xvzf $1;;
        *.bz2)       
            bunzip2 $1;;
        *.rar)
            unrar x $1;;
        *.gz)
            gunzip $1;;
        *.tar)
            tar xvf $1;;
        *.tbz2)
            tar xvjf $1;;
        *.tgz)
            tar xvzf $1;;
        *.zip)
            unzip $1;;
        *.Z)
            uncompress $1;;
        *.7z)
            7z x $1;;
        *)  
            echo "'$1' cannot be extracted via extract";;
    esac
}
