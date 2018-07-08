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

;UTF-8
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

; Revert Buffer
(global-set-key (kbd "<f5>") 'revert-buffer)


; Uniquify Buffer/Region
(defun uniquify-all-lines-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))
(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
