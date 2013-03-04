#!/bin/bash

# set up .bashrc (will be expanded)
function setup_bashrc() {
    # check for .bash_profile, if it doesn't exist, create it
    test -f "$HOME/.bash_profile" || echo "#!/bin/bash\ntest -f ~/.bashrc && source ~/.bashrc" > "$HOME/.bash_profile"

    # check for .bashrc, if it doesn't exist, create it
    test -f "$HOME/.bashrc" || echo "#!/bin/bash" > "$HOME/.bashrc"

    # append to .bashrc
    echo "export PATH=\"\$PATH:\$HOME/bin\"" >> "$HOME/.bashrc"
}

read -p "Setup .bashrc (y/n)? " choice
case "$choice" in 
  y|Y ) setup_bashrc;;
esac
