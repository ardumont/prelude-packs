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


(load-file "live-routine.el")
(require 'live-routine)

(defun prelude-packs/add-packs (path packs)
  "Utility function to help in installing packs (bunch of user packs)"
  (live-add-packs (mapcar (lambda (pack) (concat path pack)) packs)))

(defun prelude-packs/load-packs (paths)
  "Load the packs"
  (mapc (lambda (pack-dir) (live-load-pack pack-dir)) prelude-packs))

(defvar prelude-packs
  (prelude-packs/add-packs "~/.prelude-packs/"
                           '("install-packages-pack" ;; installing emacs repositories (melpa, milkbox, marmalade) and the install-packs utility function
                             ;; ;;                                   "el-get-pack"
                             ;;                            "buffer-pack" ;; a pack to mess around until drying stuff
                             ;;                            "scratch-pack"
                             ;;                            "blog-pack" ;; a setup blog pack for wordpress
                             ;;                            "haskell-pack"
                             ;;                            "orgmode-pack" ;; setup org-mode
                             ;;                            "lisp-pack"
                             ;;                            "git-pack"
                             ;;                            "mail-pack" ;; setup mail credentials
                             ;;                            "shell-pack"
                             ;;                            "browser-pack"
                             ;;                            "chat-pack" ;; irc credential setup
                             ;;                            "clojure-pack"
                             ;; ;;                                   "nrepl-pack"           ;; nrepl override bindings from nrepl
                             ;;                            "clojurescript-pack"
                             ;;                            "caml-pack"
                             ;;                            "modeline-pack" ;; adding stuff regarding emacs modeline
                             ;;                            "twitter-pack"
                             ;;                            "puppet-pack"
                             ;; ;;                                   "chrome-pack"          ;; chrome editing textarea using emacs
                             ;;                            "macro-pack"
                             ;;                            "scala-pack"
                             ;;                            "elisp-pack"
                             ;;                            "groovy-pack"
                             ;;                            "php-pack"
                             ;; ;;                                   "ctags-pack"
                             ;;                            "prelude-pack"
                             ;;                            "stumpwm-pack"
                             )))

(prelude-packs/load-packs prelude-packs)

(provide 'prelude-packs)
;;; prelude-packs ends here
