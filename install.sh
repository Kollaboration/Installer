#!/bin/bash
# this script checks if it is correctly installed,
# and if it is, passes the work on to other scripts

# determine if it's been installed
if [ ! -d "$HOME/.install/scripts" ]; then
    if [ "$1" != "setup" ]; then
        echo "You need to run \"install setup\" first!";
        exit -1
    fi
fi

if [ -d "$HOME/.install/scripts/$1.sh" ]; then
    # save path to script
    script="$HOME/.install/scripts/$1.sh"

    # forget about first argument
    shift

    # call script with the rest of the arguments
    source $script $@
else
    # complain what's wrong
    echo "Unrecognized command \"$1\""
    
    # show usage (if there is such a script)
    if [ -d "$HOME/.install/scrips/usage.sh" ]; then
        source "$HOME/.install/scripts/usage.sh"
    fi
fi
