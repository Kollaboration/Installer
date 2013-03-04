#!/bin/bash
# makes sure a given package is installed or
# returns -1

function fail() {
    echo $1
    exit -1
}

if [ -z "$!" ]; then
    fail "no package name provided"
fi

if ! kpkg check "$1"; then
    if ! kpkg install "$1"; then
        fail "error installing $1"
    fi
fi
