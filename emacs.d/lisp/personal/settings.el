(setq inhibit-startup-screen t)   ; disable welcome screen
(setf ring-bell-function 'ignore) ; disable alarm bell

(when (not (display-graphic-p))
  (menu-bar-mode -1)) ; disable menu bar in CLI

;; improve scrolling
(setf scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(show-paren-mode 1) ; highlight matching parens

(global-hl-line-mode 1) ; highlight current line

(setq-default indent-tabs-mode nil) ; use spaces instead of tabs

(fset 'yes-or-no-p 'y-or-n-p)            ;; enable y/n answers to yes/no

;; KEYBINDINGS ;;
; Toggle EVIL mode
(global-set-key (kbd "<f6>") 'evil-mode)
; Revert Buffer
(global-set-key (kbd "<f5>") 'revert-buffer)
