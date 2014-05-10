;;; prelude-packs.el --- Personal prelude packs

;; Copyright (C) 2013 Antoine R. Dumont <eniotna.t AT gmail.com>

;; Author: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Maintainer: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Version: 0.0.2
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

;; #### prelude-packs

(defvar prelude-packs-dir "~/.prelude-packs"
  "The root directory of prelude-packs distribution.")

;; add subfolder to the load-path
(prelude-add-subfolders-to-load-path prelude-packs-dir)

(defun prelude-packs/byte-compile! ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory prelude-packs-dir 0 'do-force-recompile))

(defun prelude-packs/pack-names (parent-dir)
  "Add all pack names from the PARENT-DIR."
  (--> parent-dir
    (directory-files it nil "^[a-zA-z-]*$")
    (-filter #'file-directory-p it)
    (mapcar #'intern it)))

;;; Uncomment the modules you'd like to use and reload the buffer - M-x eval-buffer

(defvar prelude-packs/packs (prelude-packs/pack-names prelude-packs-dir))

(defmacro prelude-packs/load-pack-definition (pack-name)
  "Define a function to permit the loading of a pack with name PACK-NAME."
  `(defun ,(intern (format "prelude-packs/load-%s!" pack-name)) ()
     ,(format "Load the pack %s." pack-name)
     (interactive)
     (require ',pack-name)))

;; Install the interactive commands to load the different packs
(eval
 `(progn
    ,@(mapcar (lambda (pack)
                `(prelude-packs/load-pack-definition ,pack))
              prelude-packs/packs)))

(provide 'prelude-packs)
;;; prelude-packs ends here
