#!/bin/bash
# this script checks if it is correctly installed,
# and if it is, passes the work on to other scripts

# determine if it's been installed
if [ ! -d "$HOME/.kpkg/scripts" ]; then
    echo "not installed! run install.sh first."
    exit -1
fi

if [ -d "$HOME/.kpkg/scripts/$1.sh" ]; then
    # save path to script
    script="$HOME/.kpkg/scripts/$1.sh"

    # forget about first argument
    shift

    # call script with the rest of the arguments
    source $script $@
else
    # complain what's wrong
    echo "unrecognized command \"$1\""
    
    # show usage (if there is such a script)
    if [ -d "$HOME/.kpkg/scrips/usage.sh" ]; then
        source "$HOME/.kpkg/scripts/usage.sh"
    fi

    # fail badly
    exit -1
fi
