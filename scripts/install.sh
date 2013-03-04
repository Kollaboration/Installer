#!/bin/bash
# tries to install a given package with the package
# script name provided

function fail() {
    echo $1 # show error
    kpkg usage # show usage
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
if [ -f "$HOME/.kpkg/packages/installed" ]; then
    fail "package $1 already installed"
fi

# every possible error has been handled
# we can pass control to the installation
# script of the package
echo "installing $1..."
script="$HOME/.kpkg/packages/$1/install.sh"
shift # remove first command line argument
source $script $@ # call script with parameters
