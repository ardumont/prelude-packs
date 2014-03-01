prelude-packs [![Build Status](https://travis-ci.org/ardumont/prelude-packs.png?branch=master)](https://travis-ci.org/ardumont/prelude-packs)
=============

A prelude packs setup to use with the most excellent [prelude](https://github.com/bbatsov/prelude).

This is mostly a way to permit the use of prelude with your `agnostic` (in sense of emacs-live's API) emacs-live user packs.

# pack list

Some packs still need some lovin' but most are ready:

- [install-packages-pack](https://github.com/ardumont/install-packages-pack)  some installation repository setup + function to install list of packages

*Note*
This pack is an orchestrator.
You still need to setup those packs independently for the overall to be fully functional.
Report yourself to each pack's README.md file to know what are those steps.

# Install

## Pre-requisite

### Prelude

Install [prelude](https://github.com/bbatsov/prelude)

Long story short:

```sh
git clone git://github.com/bbatsov/prelude.git ~/.emacs.d
```

### Preparation for prelude-packs

Add this to `/path/to/prelude/personal/init.el` 

``` lisp
(let ((prelude-packs-file (expand-file-name "~/.prelude-packs/init.el")))
  (when (file-exists-p prelude-packs-file)
    (load-file prelude-packs-file)))
```

## Clone

Clone the repository.

```sh
git clone git@github.com:ardumont/prelude-packs.git --recursive
```

## Packs

### Default pack needed

If you want to use one of those packs, you need at minimum [install-packages-pack](https://github.com/ardumont/install-packages-pack).
This one is in charge of setuping different repositories (marmalade, milkbox, elpa, etc...).

Also, it installs a utility function `install-packs` to download packages from those repositories.
This utility function is used throughout all the [referenced packs](#pack-list).

### Adding/Removing packs

To add or remove packs, simply edit the `.prelude-packs.el` and add or remove packs from the list.

For example, to simply install orgmode-pack and the blog-pack, do as follow:
```elisp
;; all the other packs needed
(add-live-packs "~/.emacs-live-packs/" '(;; installing emacs repositories (melpa, milkbox, marmalade) and the install-packs utility function
                                         "install-packages-pack"
                                         ;; setup org-mode
                                         "orgmode-pack"
                                         ;; a setup blog pack for wordpress
                                         "blog-pack"))

```

## Deploy

Launch the deployer:

```sh
/path/to/prelude-packs/deploy.sh
```

This will trigger the creation of 1 link in your home folder towards your prelude-pack's installation folder.

Example:

```sh
tony@dagobah(0,43,) 15:30:39 ~/repo/perso/emacs-live-packs (master) $ ll ~/.emacs*
lrwxrwxrwx 1 tony tony 32 déc.  18 03:28 /home/tony/.emacs.d -> /home/tony/repo/perso/prelude
lrwxrwxrwx 1 tony tony 39 avril 15 12:38 /home/tony/.prelude-packs -> /home/tony/repo/perso/prelude-packs/
```

## Start

Now start emacs.

```sh
emacs --daemon
```

This will install emacs packages needed if they are not already installed.

