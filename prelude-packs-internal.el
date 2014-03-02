;;; prelude-packs-internal.el --- Minimal emacs-live routine to load user packs

;; Copyright (C) 2013 https://github.com/samaaron/

;; Author: Sam Aaron <https://github.com/samaaron/>
;; Maintainer: Antoine R. Dumont <eniotna.t AT gmail.com>
;; Version: 0.0.0
;; Package-Requires:
;; Keywords: live prelude packs
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

;; Emacs-live routine to load personal packs
;;
;;; Code:


;; live routine to agnostify (correctness first, make this work outside of emacs-live)

(defvar live-packs nil "List of packs to load")

(defvar live-current-pack-dir nil "The directory of the pack being currently loaded")
(defvar live-current-pack-version nil "The version string of the pack being currently loaded")
(defvar live-current-pack-name nil "The name of the pack being currently loaded")
(defvar live-current-pack-description nil "The description of the pack being currently loaded")

(defun live-pack-config-dir ()
  "Returns the path of the config dir for the current pack"
  (file-name-as-directory (concat live-current-pack-dir "config")))

(defun live-pack-version (version)
  "Specify the version of the current pack. This should typically
   only be used in the pack's info.el file"
  (setq live-current-pack-version version))

(defun live-pack-description (desc)
  "Specify the description of the current pack. This should typically
   only be used in the pack's info.el file"
  (setq live-current-pack-description desc))

(defun live-pack-name (name)
  "Specify the name of the current pack. This should typically
   only be used in the pack's info.el file"
  (setq live-current-pack-name name))

(defun live-clear-pack-info ()
  "Clears the pack-info vars for the current pack."
  (setq live-current-pack-version nil)
  (setq live-current-pack-name nil)
  (setq live-current-pack-description nil))

(defun live-pack-lib-dir ()
  "Returns the path of the lib dir for the current pack"
  (file-name-as-directory (concat live-current-pack-dir "lib")))

(defun live-add-pack-lib (p)
  "Adds the path (specified relative to the the pack's lib dir)
  to the load-path"
  (add-to-list 'load-path (concat (live-pack-lib-dir) p)))

(defun live-load-config-file (f-name)
  "Load the config file with name f-name in the current pack"
  (let* ((config-dir (live-pack-config-dir)))
    (load-file (concat config-dir f-name))))

(defun live-add-packs (pack-list)
  "Add the list pack-list to end of the current list of packs to load"
  (setq live-packs (append live-packs pack-list)))

(defun live-print-pack-info ()
  "Checks that that all the correct pack-info has been set by the
  current pack's pack-info.el"
  (if (not live-current-pack-name)
      (message (concat "Error - no pack name found for pack. Please add to pack's info.el"))
    (message (concat "==> Pack name: " live-current-pack-name)))

  (if (not live-current-pack-version)
      (message (concat "Error - no pack version found for pack. Please add to packs's info.el"))
    (message (concat "==> Pack Version: " live-current-pack-version)))
  ;;(version-to-list live-current-pack-version)

  (if (not live-current-pack-description)
      (message (concat "Error - no pack description found for pack. Please add to pack's info.el"))
    (message (concat "==> Pack Description: " live-current-pack-description))))

(defun live-load-pack (pack-dir)
  "Load a live pack. This is a dir that contains at least the
  files pack-info.el and init.el. Adds the packs's lib dir
  to the load-path"
  (message (concat "\n\n==> Loading Emacs Live Pack: " pack-dir))
  (let* ((pack-dir  (file-name-as-directory pack-dir))
         (pack-info (concat pack-dir "info.el"))
         (pack-init (concat pack-dir "init.el")))
    (setq live-current-pack-dir pack-dir)
    (live-clear-pack-info)
    (if (file-exists-p pack-info)
        (load-file pack-info)
      (message (concat "Error - could not find info.el file for pack with location: " pack-dir)))
    (live-print-pack-info)
    (add-to-list 'load-path (live-pack-lib-dir))
    (if (file-exists-p pack-init)
        (load-file pack-init))
    (setq live-current-pack-dir nil)))

(defun prelude-packs/add-packs (path packs)
  "Utility function to help in installing packs (bunch of user packs)"
  (live-add-packs (mapcar (lambda (pack) (concat path pack)) packs)))

(defun prelude-packs/load-packs (packs)
  "Load the packs"
  (mapc (lambda (pack-dir) (live-load-pack pack-dir)) packs))

(provide 'prelude-packs-internal)
;;; prelude-packs-internal.el ends here
