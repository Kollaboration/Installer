#!/bin/bash

function fail() {
    echo $1 # show error
    kpgk usage # show usage
    exit -1
}

# check if package name provided
if [ -z "$1" ]; then
    fail "no package name provided"
fi

# check if package exists
if [ ! -d "$HOME/.kpkg/packages/$1" ]; then
    fail "package $1 not available"
fi

# check if package is already installed
if [ -f "$HOME/.kpkg/packages/$1/installed" ]; then
    echo "package $1 is already installed"
else
    fail "package $1 is not installed yet"
fi
