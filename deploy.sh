#!/bin/bash

bashrc="$HOME/.bashrc"
vimrc="$HOME/.vimrc"


install() {
    local src="$1"
    local dest="$2"

    if [[ -e $dest ]]; then
        cp $dest ${dest}.old
    fi

    cp -f $src $dest
}

cleanup() {
    local src="$1"

    rm -f $src
    if [[ -e ${src}.old ]]; then
        cp ${src}.old $src 
    fi
}

install_all() {
    install bashrc $bashrc
    install vimrc $vimrc
}

clean_all() {
    cleanup $bashrc
    cleanup $vimrc
}

fetch() {
    local tarball="https://github.com/104012/shell_configs/tarball/master"
    curl -L $tarball | tar pzx --strip=1
}

update() {
    fetch
    clean_all
    ./deploy.sh install
}


main() {
    case "$1" in
        "install")
            install_all
            ;;
        "clean")
            clean_all
            ;;
        "update")
            update
            ;;
    esac
}

main "$@"
