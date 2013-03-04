#!/bin/bash
# lists all installed packages

for package in "$HOME/.kpkg/packages/*"; do
    if [ -f "$HOME/.kpkg/packages/$package/installed" ]; then
        echo "$package (installed)"
    else
        echo "$package (not installed)"
    fi
done
