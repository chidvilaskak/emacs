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
(add-to-list 'load-path "~/.emacs.d/vendor/org-bullets")
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(load-file "~/.emacs.d/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(package-selected-packages (quote (org-bullets)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 120 :width normal))))
 '(avy-lead-face ((t (:foreground "#dc322f" :weight bold))))
 '(avy-lead-face-0 ((t (:foreground "#268bd2" :weight bold))))
 '(avy-lead-face-2 ((t (:foreground "#268bd2" :weight bold))))
 '(proof-locked-face ((t (:background "#e1fec1"))))
 '(proof-queue-face ((t (:background "#c1fefc")))))
