#!/bin/env sh

# direktori target tempat script dunstify berada
helpDir=~/.config/rofi-help

# untuk menghandle argument
if [ -n "$@" ]; then
   helpDir="${helpDir}/$@"
fi

# untuk menghandle apabila argument bukan merupakan direktori
if [ ! -d "${helpDir}" ]; then
    coproc ( "${helpDir}" & > /dev/null  2>&1 )
    exit;
fi

# proses direktori target
helpDir=$(readlink -e "${helpDir}")
pushd "${helpDir}" >/dev/null

# tampilkan isi dari direktori
ls --group-directories-first --hide="keybinds-*"
