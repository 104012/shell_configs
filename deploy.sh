#!/bin/bash


tarball="https://github.com/104012/shell_configs/tarball/master"

function fetch() {
    if hash git 2> /dev/null; then
        git pull origin master
    else
        curl -L $tarball | tar zx --strip=1
    fi
}

function vimrc() {
    local src="vimrc"
    local dest="$HOME/.vimrc"

    cp -i $src $dest
}

function bashrc() {
    local src="bashrc"
    local dest="$HOME/.bashrc"

    if [[ -e $dest ]]; then
        cat $src >> $dest
    else
        cp -i $src $dest
    fi
}

fetch
vimrc
bashrc
