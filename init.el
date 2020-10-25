;; Justin Mazors init.el
;; Heavily based on prelude emacs
;; Goals are to make it more minimal, customized, and learn.

;; TODO create a .gitattributes for cpplint and company
;; TODO create a package to remove line number margins
;; TODO experiment with semantic mode. How does it work with company

;; Always load newest byte-code
(setq load-prefer-newer t)

;; Define Emacs Directory Structure
(defvar e-dir (file-name-directory load-file-name)
  "Root dir of emacs config.")
(defvar core-dir (expand-file-name "core" e-dir)
  "Built in emacs configs.")
(defvar modules-dir (expand-file-name "modules" e-dir)
  "All package configs.")
(defvar vendor-dir (expand-file-name "vendor" e-dir)
  "Packages not in MELPA.")
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This is for all automatic save/history-files.")
(defvar modules-file (expand-file-name "modules.el" modules-dir))

(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)

;; TODO do we want to change frequency of garbage collection

;; warn when openenig files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; modules
(require 'prelude-packages)
;; load the core
(require 'prelude-ui)
(require 'prelude-core)
(require 'prelude-editor)
(require 'prelude-keybinds)

;; module configs
(require 'modules)

;; config changes
(setq custom-file (expand-file-name "custom.el" core-dir))
