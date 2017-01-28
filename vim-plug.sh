#! /usr/bin/env bash

set -u


readonly release_version="0.9.0"
readonly plugin_url="https://raw.githubusercontent.com/junegunn/vim-plug/${release_version}/plug.vim"
readonly autoload_dir="$HOME/.vim/autoload"


check_for_downloader() {
    if [ $(command -v wget) ]
    then
        readonly downloader="wget"
    elif [ $(command -v curl) ]
    then
        readonly downloader="curl"
    else
        echo "either wget or curl needed. none found. exiting."
        exit 1
    fi
}

check_for_autoload_dir() {
    [ -d "$autoload_dir" ] || mkdir -p $autoload_dir
}


check_for_downloader
check_for_autoload_dir

if [ "$downloader" == "wget" ]
then
    wget -O $HOME/.vim/autoload/plug.vim $plugin_url
else
    curl -o $HOME/.vim/autoload/plug.vim $plugin_url
fi

