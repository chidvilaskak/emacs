(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
;; Uncomment to refresh packages at init. Will cause slow startup
;(package-refresh-contents)
(setq-default inhibit-startup-screen t) ; inhibit startup screen
; -*- no-byte-compile: t -*-
(setf load-prefer-newer t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/vendor/dash.el")
(add-to-list 'load-path "~/.emacs.d/vendor/packed")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-compile")
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(load-file "~/.emacs.d/init.el")
