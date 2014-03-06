;;; prelude-packs.el --- Personal prelude packs

;; Copyright (C) 2013 Antoine R. Dumont <eniotna.t AT gmail.com>

;; Author: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Maintainer: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Version: 0.0.1
;; Package-Requires:
;; Keywords: prelude packs
;; URL: https://github.com/ardumont/prelude-packs

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Personal prelude packs
;;
;;; Code:


;; Standard prelude

;;; Uncomment the modules you'd like to use and restart Prelude afterwards

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
;; (require 'prelude-helm) ;; Interface for narrowing and search

(require 'prelude-c)
(require 'prelude-clojure)
;; (require 'prelude-coffee)
(require 'prelude-common-lisp)
;; (require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-erc) ;; Emacs IRC client
;; (require 'prelude-erlang)
(require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-mediawiki)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
;; (require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-scala)
(require 'prelude-scheme)
;; (require 'prelude-scss)
;; (require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)



(load-file (expand-file-name (format "~/.prelude-packs/prelude-packs-internal.el")))

(require 'prelude-packs-internal)
(require 'dash)

;;; Comment out the packs you won't use and reevaluate the form afterwards (C-M-x)

(->> '("install-packages-pack"
       "prelude-pack"
       "theme-pack"
       "el-get-pack"
       "buffer-pack"
       "scratch-pack"
       "blog-pack"
       "haskell-pack"
       "orgmode-pack"
       "lisp-pack"
       "git-pack"
       "mail-pack"
       "shell-pack"
       "browser-pack"
       "chat-pack"
       "clojure-pack"
       "clojurescript-pack"
       "caml-pack"
       "modeline-pack"
       "twitter-pack"
       "puppet-pack"
       "chrome-pack"
       "macro-pack"
       "scala-pack"
       "elisp-pack"
       "groovy-pack"
       "php-pack"
       "stumpwm-pack"
       "pres-pack")
     (prelude-packs/add-packs "~/.prelude-packs/")
     prelude-packs/load-packs)

(provide 'prelude-packs)
;;; prelude-packs ends here
