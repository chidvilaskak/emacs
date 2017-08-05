
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(load "personal/packages")
(load "personal/theme")
(load "personal/settings")

(let ((custom "~/.emacs_local"))
  (when (file-exists-p custom)
    (load-file custom)))