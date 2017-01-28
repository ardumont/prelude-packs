prelude-packs [![Build Status](https://travis-ci.org/ardumont/prelude-packs.png?branch=master)](https://travis-ci.org/ardumont/prelude-packs)
=============

A prelude packs setup to use with the most excellent [prelude](https://github.com/bbatsov/prelude).

# Context

- I used emacs-starter-kit (which is great) then migrated to emacs-live (which is also great).
- Along the way, I developed some code on my own.
- This code, little by little, became standardized the emacs-live way through the notion of packs (it's still emacs-lisp inside).
- I still like this notion. It goes well with the `separation of concerns` concept.
- So I kept them, agnostified them to permit the use outside of emacs-live.
- Now I can discover any other emacs distribution (prelude for example) without losing my existing code.
- This code is rather user agnostic too so it can be used by other people too.

# Packs

Some packs still need some lovin' but most are ready:

Pack name                                                                   | Description
----------------------------------------------------------------------------|-----------------------------------------------------------------------------------
[install-packages-pack](https://github.com/ardumont/install-packages-pack)  | Some installation repository setup + function to install list of packages
[scratch-pack](https://github.com/ardumont/scratch-pack)                    | Tinkering pack
[blog-pack](https://github.com/ardumont/blog-pack)                          | Blog setup to rapidly post article from org-mode to wordpress
[haskell-pack](https://github.com/ardumont/haskell-pack)                    | Haskell environment setup
[orgmode-pack](https://github.com/ardumont/orgmode-pack)                    | Some org-mode specificities
[lisp-pack](https://github.com/ardumont/lisp-pack)                          | Lisp environment setup
[buffer-pack](https://github.com/ardumont/buffer-pack)                      | Some buffer manipulation functions
[git-pack](https://github.com/ardumont/git-pack)                            | Git specific setup
[mail-pack](https://github.com/ardumont/mail-pack)                          | Email accounts setup (one or multiple accounts through authentication file setup)
[shell-pack](https://github.com/ardumont/shell-pack)                        | Shell setup
[browser-pack](https://github.com/ardumont/browser-pack)                    | Browser specific tryouts
[chat-pack](https://github.com/ardumont/chat-pack)                          | IRC setup
[clojure-pack](https://github.com/ardumont/clojure-pack)                    | Clojure override from emacs-live's defaults + other stuff
[clojurescript-pack](https://github.com/ardumont/clojurescript-pack)        | Clojurescript setup
[lisp-pack](https://github.com/ardumont/lisp-pack)                          | All lisp (clojure, common-lisp) setup pack
[elisp-pack](https://github.com/ardumont/elisp-pack)                        | Emacs-lisp pack (more specific than the previous one)
[macro-pack](https://github.com/ardumont/macro-pack)                        | Macro setup
[caml-pack](https://github.com/ardumont/caml-pack)                          | ML family languages setup
[twitter-pack](https://github.com/ardumont/twitter-pack)                    | Twitter setup
[puppet-pack](https://github.com/ardumont/puppet-pack)                      | Puppet setup
[chrome-pack](https://github.com/ardumont/chrome-pack)                      | Chrome setup
[scala-pack](https://github.com/ardumont/scala-pack)                        | Scala pack
[el-get-pack](https://github.com/ardumont/el-get-pack)                      | Attempt to permit the use of el-get
[groovy-pack](https://github.com/ardumont/groovy-pack)                      | Pack to add groovy mode
[modeline-pack](https://github.com/ardumont/modeline-pack)                  | Improve modeline rendering
[php-pack](https://github.com/ardumont/php-pack)                            | PHP mode
[prelude-pack](https://github.com/ardumont/prelude-pack)                    | A pack to override some prelude core default (bindings mostly)
[stumpwm-pack](https://github.com/ardumont/stumpwm-pack)                    | Stumpwm tinkering from the REPL
[pres-pack](https://github.com/ardumont/pres-pack)                          | Pack to make presentation fast (using [org-mode](http://orgmode.org/), [org-reveal](https://github.com/yjwen/org-reveal/) and [reveal.js](http://lab.hakim.se/reveal-js/#/))
[irc-pack](https://github.com/ardumont/irc-pack)                            | Pack to setup IRC once with .netrc file

*Note*
This pack is an orchestrator.
You still need to configure those packs independently for the overall to be fully functional.
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
mr -j4 update
```

Note:
mr being https://myrepos.branchable.com/

## Packs

### Default pack needed

If you want to use one of those packs, you need at minimum [install-packages-pack](https://github.com/ardumont/install-packages-pack).
This one is in charge of configuring different repositories (marmalade, melpa, melpa-stable, milkbox, elpa, etc...).

Also, it installs a utility function `install-packages-pack/install-packs` to download packages from those repositories.
This utility function is used throughout all the [referenced packs](#pack-list).

### Adding/Removing packs

To add or remove packs, simply edit the `.prelude-packs.el` and comments packs from the list.

For example, to simply install orgmode-pack and the blog-pack, do as follow:
```elisp
;;(use install-packages-pack)
;;(use prelude-pack)
;;(use theme-pack)
;;(use el-get-pack)
;;(use buffer-pack)
;;(use scratch-pack)

(use blog-pack)

;;(use haskell-pack)

(use orgmode-pack)

;;(use lisp-pack)
;;(use git-pack)
;;(use mail-pack)
;;(use shell-pack)
;;(use browser-pack)
;;(use chat-pack)
;;(use clojure-pack)
;;(use clojurescript-pack)
;;(use caml-pack)
;;(use modeline-pack)
;;(use twitter-pack)
;;(use puppet-pack)
;;(use chrome-pack)
;;(use macro-pack)
;;(use scala-pack)
;;(use elisp-pack)
;;(use groovy-pack)
;;(use php-pack)
;;(use stumpwm-pack)
;;(use pres-pack)
;;(use irc-pack)
;;(use help-pack)

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

## Faster start

Compiling the code will help.

<kbd>M-x prelude-packs/byte-compile!</kbd>
