#!/bin/bash
# install libreadline

version="6.2"

function fail() {
    echo "libreadline: $1"
    exit -1
}

# change to own directory
cd "$HOME/.kpkg/packages/libreadline"

# download & unpack
curl -o "readline-$version.tar.gz" "ftp://ftp.cwru.edu/pub/bash/readline-$version.tar.gz"
tar -xzf "readline-$version.tar.gz"

# compile
cd "readline-$version.tar.gz"
./configure || fail "error while configuring"
make || fail "error while compiling"

# install
prefix="$HOME" make -e install || fail "error while installing"

# mark package as installed
touch "$HOME/.kpkg/packages/libreadline/installed"
