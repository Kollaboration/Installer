Installer
=========

This repository provides a script to install commonly needed, but
unavailable packages on Koding. It can be easily extended by 
providing custom scripts, and it is advisable to do so for anything
you install so that other Koders have access to it.

How it works
------------

This is like a very basic package management system. Packages are
in the folder `packages/` (or `~/.kpkg/packages/` if you installed
it), and are plain bash install scripts. 

To install a packages, type `kpkg install <pkgname>`, and that is
about all you will need to know. 

If you want to write you own installer scripts, one useful command
to know is `kpkg require <pkgname>`. This will do everything it
can to try to install the package, and if it fails, it will return
nonzero, meaning you can use it like this: `kpkg require <pkgname> 
|| exit -1`. 
