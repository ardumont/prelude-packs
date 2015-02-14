;;; prelude-packs.el --- Personal prelude packs

;; Copyright (C) 2013 Antoine R. Dumont <eniotna.t AT gmail.com>

;; Author: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Maintainer: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Version: 0.0.2
;; Package-Requires: ((dash "2.6.0"))
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


(defvar prelude-packs-root-folder "~/.prelude-packs"
  "The root dir of prelude-packs distribution.")

(defun prelude-packs/byte-compile! ()
  "Byte-compile all your prelude-packs modules to speed start-up."
  (interactive)
  (prelude-recompile-init)
  (byte-recompile-directory prelude-packs-root-folder 0 'do-force-recompile))

;; add subfolder to the load-path
(prelude-add-subfolders-to-load-path prelude-packs-root-folder)

;; #### Standard prelude

;;; Uncomment the modules you'd like to use and reload the buffer - M-x eval-buffer

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
(require 'prelude-company)

;; #### prelude-packs

(require 'shell-pack)
(require 'install-packages-pack)
(require 'theme-pack)
(require 'prelude-pack)

;;(require 'ctags-pack)
(require 'elisp-pack)
(require 'el-get-pack)
(require 'buffer-pack)
(require 'scratch-pack)
(require 'blog-pack)
(require 'haskell-pack)
(require 'orgmode-pack)
(require 'lisp-pack)
(require 'git-pack)
(require 'mercurial-pack)
(require 'mail-pack)
(require 'browser-pack)
(require 'conkeror-pack)
;;(require 'chat-pack)
(require 'clojure-pack)
(require 'clojurescript-pack)
(require 'caml-pack)
(require 'modeline-pack)
(require 'twitter-pack)
(require 'puppet-pack)
;; (require 'chrome-pack)
(require 'macro-pack)
(require 'scala-pack)
(require 'java-pack)
(require 'groovy-pack)
(require 'php-pack)
(require 'stumpwm-pack)
(require 'pres-pack)
(require 'irc-pack)
(require 'help-pack)
(require 'marmalade-pack)
(require 'js-pack)
(require 'purescript-pack)

(provide 'prelude-packs)
;;; prelude-packs ends here
