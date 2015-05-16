#!/bin/bash


function fetch() {
    local tarball="https://github.com/104012/shell_configs/tarball/master"
    curl -L $tarball | tar zx --strip=1
}

function vimrc() {
    local src="vimrc"
    local dest="$HOME/.vimrc"

    if [[ -e $dest ]]; then
        cp $dest ${dest}.old
    fi

    cp -f $src $dest
}

function bashrc() {
    local src="bashrc"
    local dest="$HOME/.bashrc"

    if [[ -e $dest ]]; then
        cp $dest ${dest}.old
    fi

    cp -f $src $dest
}

#fetch
vimrc
bashrc
