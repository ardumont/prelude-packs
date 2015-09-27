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


;; ####
;; #### prelude-packs internal
;; ####

(defvar prelude-packs-root-folder "~/.prelude-packs"
  "The root dir of prelude-packs distribution.")

(defun prelude-packs/byte-compile! ()
  "Byte-compile all your prelude-packs modules to speed start-up."
  (interactive)
  (prelude-recompile-init)
  (byte-recompile-directory prelude-packs-root-folder 0 'do-force-recompile))

(defun prelude-pack-path (pack)
  "Compute path to the prelude-pack PACK."
  (format "%s/%s" prelude-packs-root-folder pack))

;; prelude-packs core's deps
(require 'package)
(package-install 'use-package)
;; (custom-set-variables '(use-package-always-ensure nil)) ;; always fetch non present packages

;; from use-package's doc
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(defmacro use (pack)
  "A macro to ease the prelude-pack PACK's loading.
Use: \(use theme-pack\) expands to:
\(use-package theme-pack :load-path \"~/prelude-packs/theme-pack/theme-pack.\"\)"
  `(use-package ,pack
     :load-path ,(prelude-pack-path pack)
     :ensure nil))

(defconst prelude-pack-use-font-lock-keywords
  '(("(\\(use\\)\\_>[ \t']*\\(\\(?:\\sw\\|\\s_\\)+\\)?"
     (1 font-lock-keyword-face)
     (2 font-lock-constant-face nil t))))

(font-lock-add-keywords 'emacs-lisp-mode prelude-pack-use-font-lock-keywords)

;; ####
;; #### Standard prelude
;; ####

;;; Uncomment the modules you'd like to use and reload the buffer - M-x eval-buffer

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
(require 'prelude-helm) ;; Interface for narrowing and search

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
(require 'prelude-latex)
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

;; ####
;; #### prelude-packs
;; ####

;; prelude-packs definition
(use install-packages-pack)
(use shell-pack)
(use nix-pack)
(use theme-pack)

(use prelude-pack)

;;(use ctags-pack)
(use elisp-pack)
(use el-get-pack)
(use buffer-pack)
(use scratch-pack)
(use blog-pack)
(use wiki-pack)
(use haskell-pack)
(use orgmode-pack)
(use lisp-pack)
(use git-pack)
(use mercurial-pack)
(use mail-pack)
(use browser-pack)
(use conkeror-pack)
(use chat-pack)
(use clojure-pack)
(use clojurescript-pack)
(use caml-pack)
(use modeline-pack)
(use twitter-pack)
(use puppet-pack)
;; (use chrome-pack)
(use macro-pack)
(use scala-pack)
(use java-pack)
(use groovy-pack)
(use php-pack)
;;(use stumpwm-pack)
(use pres-pack)
(use irc-pack)
(use help-pack)
(use marmalade-pack)
;; (use js-pack)
(use purescript-pack)
(use idris-pack)
(use popup-pack)
(use python-pack)
(use graph-pack)
(use viewer-pack)
(use helm-pack)

;; ####
;; #### work specific stuff
;; ####

(let ((custom-work-file "~/work/.emacs.d/init.el"))
  (when (file-exists-p custom-work-file)
    (load-file custom-work-file)))

(provide 'prelude-packs)
;;; prelude-packs ends here
