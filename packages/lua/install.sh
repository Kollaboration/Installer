#!/bin/bash
# install lua

version="5.2.1"
platform="linux"
progname="lua"

function fail() {
    echo "$progname: $1"
    exit -1
}

function require() {
    kpkg require $1 || fail "can't install $1"
}

# install dependencies
require libreadline
require libncurses

# change to own directory
cd "$HOME/.kpkg/packages/$progname"

# download & unpack
curl -o "$progname-$version.tar.gz" "http://www.lua.org/ftp/lua-$version.tar.gz" || fail "error while downloading"
tar -xzf "$progname-$version.tar.gz" || fail "error while unpacking"

# compile (this is a little hacky, but necessary)
cd "$progname-$version"
MYLDFLAGS="-L$HOME/lib" MAKE="make -e" make -e $platform || fail "error while compiling"

# install (manually cus that's how we roll)
cd src
cp lua luac "$HOME/bin" || fail "error while installing"
cp lua.h luaconf.h lualib.h lauxlib.h lua.hpp "$HOME/include" || fail "error while installing"
cp liblua.a "$HOME/lib" || fail "error while installing"

# mark package as installed
touch "$HOME/.kpkg/packages/$progname/installed"
