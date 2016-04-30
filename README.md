Emacs Configuration
===================

This repo stores my current configuration files for Emacs. I primarily work in
Python nowadays, so this configuration is quite biased towards using Emacs for
Python programming.

The general organization of these configuration files and some of the settings
are based on jhamrick's [emacs configuration](https://github.com/jhamrick/emacs)

For reference, I have tested this configuration using the following version(s):
- GNU Emacs 24.5.1 (x86_64-apple-darwin13.4.0) of 2015-08-11

Dependencies
------------

Emacs, Python, IPython, and git are assumed to be installed and available. 

Organization
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

- [`jedi`](https://github.com/tkf/emacs-jedi): Useful auto-completion package for Python
- [`emacs-fireplace`](https://github.com/johanvts/emacs-fireplace): Just a fun Emacs package

`jedi` has quite a few additional dependencies, but those will all be installed
automatically by `el-get`. I simply included the source code for `emacs-fireplace` in my
`.emacs.d/elisp/` directory. As per the manual installation instructions on its GitHub page,
I would recommend compiling the file using `M-x byte-compile-file` to make it look less
choppy.

Installation
------------

Clone this repository to download `.emacs` and `.emacs.d/`. You then need to make
sure that these are part of `PATH` so that the configuration files will be found. I
usually accomplish this by adding symlinks to `.emacs` and `.emacs.d/` in my home
directory, but it can certainly also be accomplished in other ways.

```bash
git clone https://github.com/JBGreisman/emacs.git
ln -s emacs/.emacs ~/.emacs
ln -s emacs/.emacs.d ~/.emacs.d
```

To get started, now simply open up Emacs. `el-get` will get to work installing
packages and all of their dependencies.

The last step is to install the Python server by running `M-x jedi:install-server`
in Emacs.
