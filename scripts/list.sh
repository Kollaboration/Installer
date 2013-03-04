#!/bin/bash
# lists all installed packages

for package_dir in $HOME/.kpkg/packages/*; do
    package=`basename $package_dir`
    if [ -f "$HOME/.kpkg/packages/$package/installed" ]; then
        echo "$package (installed)"
    else
        echo "$package (not installed)"
    fi
done
