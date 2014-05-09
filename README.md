prelude-packs [![Build Status](https://travis-ci.org/ardumont/prelude-packs.png?branch=master)](https://travis-ci.org/ardumont/prelude-packs)
=============

A prelude packs setup to use with the most excellent [prelude](https://github.com/bbatsov/prelude).

This is mostly a way to permit the use of prelude with your `agnostic` (in sense of emacs-live's API) emacs-live user packs.

# Packs

Some packs still need some lovin' but most are ready:

- [install-packages-pack](https://github.com/ardumont/install-packages-pack)  some installation repository setup + function to install list of packages
- [scratch-pack](https://github.com/ardumont/scratch-pack)                    Tinkering pack
- [blog-pack](https://github.com/ardumont/blog-pack)                          blog setup to rapidly post article from org-mode to wordpress
- [haskell-pack](https://github.com/ardumont/haskell-pack)                    haskell environment setup
- [orgmode-pack](https://github.com/ardumont/orgmode-pack)                    some org-mode specificities
- [lisp-pack](https://github.com/ardumont/lisp-pack)                          lisp environment setup
- [buffer-pack](https://github.com/ardumont/buffer-pack)                      some buffer manipulation functions
- [git-pack](https://github.com/ardumont/git-pack)                            git specific setup
- [mail-pack](https://github.com/ardumont/mail-pack)                          email setup
- [shell-pack](https://github.com/ardumont/shell-pack)                        shell setup
- [browser-pack](https://github.com/ardumont/browser-pack)                    browser specific tryouts
- [chat-pack](https://github.com/ardumont/chat-pack)                          irc setup
- [clojure-pack](https://github.com/ardumont/clojure-pack)                    clojure override from emacs-live's defaults + other stuff
- [clojurescript-pack](https://github.com/ardumont/clojurescript-pack)        clojurescript setup
- [lisp-pack](https://github.com/ardumont/lisp-pack)                          All lisp (clojure, common-lisp) setup pack
- [elisp-pack](https://github.com/ardumont/elisp-pack)                        Emacs-lisp pack (more specific than the previous one)
- [macro-pack](https://github.com/ardumont/macro-pack)                        Macro setup
- [caml-pack](https://github.com/ardumont/caml-pack)                          ML family languages setup
- [twitter-pack](https://github.com/ardumont/twitter-pack)                    Twitter setup
- [puppet-pack](https://github.com/ardumont/puppet-pack)                      Puppet setup
- [chrome-pack](https://github.com/ardumont/chrome-pack)                      Chrome setup
- [scala-pack](https://github.com/ardumont/scala-pack)                        Scala pack
- [el-get-pack](https://github.com/ardumont/el-get-pack)                      Attempt to permit the use of el-get
- [groovy-pack](https://github.com/ardumont/groovy-pack)                      Pack to add groovy mode
- [modeline-pack](https://github.com/ardumont/modeline-pack)                  Improve modeline rendering
- [php-pack](https://github.com/ardumont/php-pack)                            PHP mode
- [prelude-pack](https://github.com/ardumont/prelude-pack)                    A pack to override some prelude core default
- [stumpwm-pack](https://github.com/ardumont/stumpwm-pack)                    Stumpwm tinkering from the repl
- [pres-pack](https://github.com/ardumont/pres-pack)                          Pack to make presentation using org-mode and org-reveal
- [irc-pack](https://github.com/ardumont/irc-pack)                            Pack to setup irc once with .netrc file

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

To add or remove packs, simply edit the `.prelude-packs.el` and comments packs from the list.

For example, to simply install orgmode-pack and the blog-pack, do as follow:
```elisp
;;(require 'install-packages-pack)
;;(require 'prelude-pack)
;;(require 'theme-pack)
;;(require 'el-get-pack)
;;(require 'buffer-pack)
;;(require 'scratch-pack)

(require 'blog-pack)

;;(require 'haskell-pack)

(require 'orgmode-pack)

;;(require 'lisp-pack)
;;(require 'git-pack)
;;(require 'mail-pack)
;;(require 'shell-pack)
;;(require 'browser-pack)
;;(require 'chat-pack)
;;(require 'clojure-pack)
;;(require 'clojurescript-pack)
;;(require 'caml-pack)
;;(require 'modeline-pack)
;;(require 'twitter-pack)
;;(require 'puppet-pack)
;;(require 'chrome-pack)
;;(require 'macro-pack)
;;(require 'scala-pack)
;;(require 'elisp-pack)
;;(require 'groovy-pack)
;;(require 'php-pack)
;;(require 'stumpwm-pack)
;;(require 'pres-pack)
;;(require 'irc-pack)
;;(require 'help-pack)

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

*Note*
This will create a file *prelude-packs-delegate.el* in your *~/.emacs.d/personal/* folder that will be loaded by prelude and trigger the prelude-packs loading.

## Start

Now start emacs.

```sh
emacs --daemon
```

This will install emacs packages needed if they are not already installed.
