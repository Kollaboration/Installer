#!/bin/bash
# install libjansson

version="2.4"
libname="jansson"

function fail() {
    echo "lib$libname: $1"
    exit -1
}

# change to own directory
cd "$HOME/.kpkg/packages/lib$libname"

# download & unpack
curl -o "$libname-$version.tar.gz" "http://www.digip.org/jansson/releases/jansson-$version.tar.gz" || fail "error while downloading"
tar -xzf "$libname-$version.tar.gz" || fail "error while unpacking"

# compile
cd "$libname-$version"
./configure || fail "error while configuring"
make || fail "error while compiling"

# install
prefix="$HOME" make -e install || fail "error while installing"

# mark package as installed
touch "$HOME/.kpkg/packages/lib$libname/installed"
