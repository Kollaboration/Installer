#!/bin/bash
# tries to install a given package with the package
# script name provided

package=$1

function fail() {
    echo $1 # show error
    exit -1
}

# check if package name provided
if [ -z "$package" ]; then
    fail "no package name provided"
fi

# check if package exists
if [ ! -d "$HOME/.kpkg/packages/$package" ]; then
    fail "package $package not available"
fi

# check if package has installation script
if [ ! -f "$HOME/.kpkg/packages/$package/install.sh" ]; then
    fail "package $package doesn't have an installation script"
fi

# check if package is already installed
if [ -f "$HOME/.kpkg/packages/$package/installed" ]; then
    fail "package $package already installed"
fi

# every possible error has been handled
# we can pass control to the installation
# script of the package
echo "installing $package..."
shift # remove first command line argument
source "$HOME/.kpkg/packages/$package/install.sh" $@

# check if package was installed correctly
if [ ! -f "$HOME/.kpkg/packages/$package/installed" ]; then
    fail "package $package not installed properly (file packages/$package/installed missing)"
fi
