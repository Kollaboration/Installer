#!/bin/bash
# install libreadline

version="5.9"
libname="readline"

function fail() {
    echo "lib$libname: $1"
    exit -1
}

# change to own directory
cd "$HOME/.kpkg/packages/lib$libname"

# download & unpack
curl -o "$libname-$version.tar.gz" "ftp://ftp.cwru.edu/pub/bash/readline-$version.tar.gz"
tar -xzf "$libname-$version.tar.gz"

# compile
cd "$libname-$version"
./configure || fail "error while configuring"
make || fail "error while compiling"

# install
prefix="$HOME" make -e install || fail "error while installing"

# mark package as installed
touch "$HOME/.kpkg/packages/lib$libname/installed"
