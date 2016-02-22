Emacs Configuration
===================

This repo stores my current configuration files for using
emacs as my IDE of choice. I primarily work in Python nowadays, so this
configuration is quite biased towards using emacs for Python programming.

For reference, I have tested this configuration using the following version(s):
- GNU Emacs 24.5.1 (x86_64-apple-darwin13.4.0) of 2015-08-11

Dependencies
------------

Emacs, Python, IPython, and git are assumed to be installed and available. 

Installation
------------

This configuration follows the standard practice of using an initialization file
(`~/.emacs`) for all of the desired settings, features, and customizations.
Additional plug-ins and Emacs Lisp files are stored in `~/.emacs.d/` and are
loaded as needed by `~/.emacs`.

Emacs Plug-ins
--------------

This configuration uses [`el-get`](https://github.com/dimitri/el-get "el-get repo")
in order to install and manage Emacs Lisp plug-ins. The plug-ins that are used
are listed below:

- `auto-complete`: Auto-completion of text in Emacs ([auto-complete repo](https://github.com/auto-complete/auto-complete))
- `jedi`: Useful auto-completion package for Python ([jedi repo](https://github.com/tkf/emacs-jedi))

Several additional plug-ins are required as dependencies for these plug-ins to
work, but `el-get` should be able to handle these dependencies rather transparently.
