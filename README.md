Installer
=========

This repository provides a script to install commonly needed, but
unavailable packages on Koding. It can be easily extended by 
providing custom scripts, and it is advisable to do so for anything
you install so that other Koders have access to it.

How it works
------------

The idea is that everything is managed by a simple `install` script.
Running `install setup` should set up some folders that will be needed
(namely `~/bin`, `~/lib` and `~/include`), it will install itself
into `~/bin` and, if needed, set up the `~/.bashrc` so that it will
work. The individual install scripts are to be placed somewhere in
`~/.install`. The scripts should provide a means of making sure that
they are not called multiple times to reduce redundancy
