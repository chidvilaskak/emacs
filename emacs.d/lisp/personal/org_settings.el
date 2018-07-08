;;------------------
;; FLYSPELL Mode
;;------------------
;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (progn (message "Microsoft Windows"))))
;; We need tell emacs to use aspell, and where your custom dictionary is.
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/org_files/.ispell")
                                        ;Then, we need to turn it on.
(require 'ispell)
                                        ; Lastly you need some way of invoking it.  “M-$” is the default method, which will check the word currently under the point.  If a region is active “M-$ will check all words within the region.  However, I like to customize all the keybindings.  So, here’s an example to use it with FlySpell:
                                        ;(global-set-key (kbd "<f8>") 'ispell-word)
                                        ;(global-set-key (kbd "C-<f8>") 'flyspell-mode)


(add-hook 'org-mode-hook
          (lambda()
            (flyspell-mode 1)))

;;--- ;;------------------------------------------------------------------------
;;--- ;; ORG Mode
;;--- ;;------------------------------------------------------------------------
;;--- 
;;--- ;;;; Trying to fix issue with non-monospace fonts 
;;--- ;;;;
;;--- ; (defun set-buffer-variable-pitch ()
;;--- ;     (interactive)
;;--- ;     (variable-pitch-mode t)
;;--- ;     (setq line-spacing 3)
;;--- ;      (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
;;--- ;      (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
;;--- ;      (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
;;--- ;      (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)
;;--- ;     )
;;--- ;
;;--- ;  (add-hook 'org-mode-hook 'set-buffer-variable-pitch)
;;--- ;;  (add-hook 'eww-mode-hook 'set-buffer-variable-pitch)
;;--- ;;  (add-hook 'markdown-mode-hook 'set-buffer-variable-pitch)
;;--- ;;  (add-hook 'Info-mode-hook 'set-buffer-variable-pitch)
;;--- 
;;--- 
;;--- 
;;--- (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;--- (require 'org)
;;--- (require 'ox)
;;--- ;;
;;--- ;; Standard key bindings
;;--- (global-set-key "\C-cl" 'org-store-link)
;;--- (global-set-key "\C-ca" 'org-agenda)
;;--- (global-set-key "\C-cb" 'org-iswitchb)
;;--- 
;;--- 
;;--- (setq org-agenda-files (quote ("~/org_files"))) 
;;--- ;; Custom Key Bindings
;;--- (global-set-key (kbd "<f12>") 'org-agenda)
;;--- (global-set-key (kbd "<f5>") 'bh/org-todo)
;;--- (global-set-key (kbd "<S-f5>") 'bh/widen)
;;--- (global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
;;--- (global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
;;--- (global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
;;--- (global-set-key (kbd "<f9> b") 'bbdb)
;;--- (global-set-key (kbd "<f9> c") 'calendar)
;;--- (global-set-key (kbd "<f9> f") 'boxquote-insert-file)
;;--- (global-set-key (kbd "<f9> g") 'gnus)
;;--- (global-set-key (kbd "<f9> h") 'bh/hide-other)
;;--- (global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)
;;--- 
;;--- (global-set-key (kbd "<f9> I") 'bh/punch-in)
;;--- (global-set-key (kbd "<f9> O") 'bh/punch-out)
;;--- 
;;--- (global-set-key (kbd "<f9> o") 'bh/make-org-scratch)
;;--- 
;;--- (global-set-key (kbd "<f9> r") 'boxquote-region)
;;--- (global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)
;;--- 
;;--- (global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
;;--- (global-set-key (kbd "<f9> T") 'bh/toggle-insert-inactive-timestamp)
;;--- 
;;--- (global-set-key (kbd "<f9> v") 'visible-mode)
;;--- (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
;;--- (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
;;--- (global-set-key (kbd "C-<f9>") 'previous-buffer)
;;--- (global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
;;--- (global-set-key (kbd "C-x n r") 'narrow-to-region)
;;--- (global-set-key (kbd "C-<f10>") 'next-buffer)
;;--- (global-set-key (kbd "<f11>") 'org-clock-goto)
;;--- (global-set-key (kbd "C-<f11>") 'org-clock-in)
;;--- (global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
;;--- (global-set-key (kbd "C-c c") 'org-capture)
;;--- 
;;--- (defun bh/hide-other ()
;;---   (interactive)
;;---   (save-excursion
;;---     (org-back-to-heading 'invisible-ok)
;;---     (hide-other)
;;---     (org-cycle)
;;---     (org-cycle)
;;---     (org-cycle)))
;;--- 
;;--- (defun bh/set-truncate-lines ()
;;---   "Toggle value of truncate-lines and refresh window display."
;;---   (interactive)
;;---   (setq truncate-lines (not truncate-lines))
;;---   ;; now refresh window display (an idiom from simple.el):
;;---   (save-excursion
;;---     (set-window-start (selected-window)
;;---                       (window-start (selected-window)))))
;;--- 
;;--- (defun bh/make-org-scratch ()
;;---   (interactive)
;;---   (find-file "/tmp/publish/scratch.org")
;;---   (gnus-make-directory "/tmp/publish"))
;;--- 
;;--- (defun bh/switch-to-scratch ()
;;---   (interactive)
;;---   (switch-to-buffer "*scratch*"))
;;--- 
;;--- (setq org-todo-keywords
;;---       (quote ((sequence "TODO(t)" "NEXT(n)" "INPROGRESS(i)" "|" "DONE(d)")
;;---               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
;;---               (sequence "BLOCKED(b@)" "NEXT" "|" "DONE")
;;---               (sequence "TRACKING" "|" "DONE")
;;---       )))
;;--- 
;;--- (setq org-todo-keyword-faces
;;---       (quote (("TODO" :foreground "red" :weight bold)
;;---               ("NEXT" :foreground "blue" :weight bold)
;;---               ("DONE" :foreground "forest green" :weight bold)
;;---               ("WAITING" :foreground "magenta" :weight bold)
;;---               ("SCHEDULED" :foreground "orange" :weight bold)
;;---               ("INPROGRESS" :foreground "orange" :weight bold)
;;---               ("TRACKING" :foreground "orange" :weight bold)
;;---               ("BLOCKED" :foreground "red" :weight bold)
;;---               ("HOLD" :foreground "magenta" :weight bold)
;;---               ("CANCELLED" :foreground "forest green" :weight bold)
;;---               ("MEETING" :foreground "forest green" :weight bold)
;;---               ("PHONE" :foreground "forest green" :weight bold))))
;;--- (setq org-directory "~/org_files")
;;--- (setq org-default-notes-file "~/org_files/refile.org")
;;--- 
;;--- ;; I use C-c c to start capture mode
;;--- (global-set-key (kbd "C-c c") 'org-capture)
;;--- 
;;--- ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;;--- (setq org-capture-templates
;;---       (quote (("t" "todo" entry (file "~/org_files/refile.org")
;;---                "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;;---               ("r" "respond" entry (file "~/org_files/refile.org")
;;---                "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;;---               ("n" "note" entry (file "~/org_files/refile.org")
;;---                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;;---               ("j" "Journal" entry (file+datetree "~/org_files/diary.org")
;;---                "* %?\n%U\n" :clock-in t :clock-resume t)
;;---               ("w" "org-protocol" entry (file "~/org_files/refile.org")
;;---                "* TODO Review %c\n%U\n" :immediate-finish t)
;;---               ("m" "Meeting" entry (file "~/org_files/refile.org")
;;---                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;;---               ("p" "Phone call" entry (file "~/org_files/refile.org")
;;---                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;;---               ("h" "Habit" entry (file "~/org_files/refile.org")
;;---                "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
;;--- 
;;--- ;; Remove empty LOGBOOK drawers on clock out
;;--- (defun bh/remove-empty-drawer-on-clock-out ()
;;---   (interactive)
;;---   (save-excursion
;;---     (beginning-of-line 0)
;;---     (org-remove-empty-drawer-at "LOGBOOK" (point))))
;;--- 
;;--- (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
;;---                                         ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
;;--- (setq org-refile-targets (quote ((nil :maxlevel . 9)
;;---                                  (org-agenda-files :maxlevel . 9))))
;;--- 
;;---                                         ; Use full outline paths for refile targets - we file directly with IDO
;;--- (setq org-refile-use-outline-path t)
;;--- 
;;---                                         ; Targets complete directly with IDO
;;--- (setq org-outline-path-complete-in-steps nil)
;;--- 
;;---                                         ; Allow refile to create parent tasks with confirmation
;;--- (setq org-refile-allow-creating-parent-nodes (quote confirm))
;;--- 
;;---                                         ; Use IDO for both buffer and file completion and ido-everywhere to t
;;--- (setq org-completion-use-ido t)
;;--- (setq ido-everywhere t)
;;--- (setq ido-max-directory-size 100000)
;;--- (ido-mode (quote both))
;;---                                         ; Use the current window when visiting files and buffers with ido
;;--- (setq ido-default-file-method 'selected-window)
;;--- (setq ido-default-buffer-method 'selected-window)
;;---                                         ; Use the current window for indirect buffer display
;;--- (setq org-indirect-buffer-display 'current-window)
;;--- 
;;--- ;;;; Refile settings
;;---                                         ; Exclude DONE state tasks from refile targets
;;--- (defun bh/verify-refile-target ()
;;---   "Exclude todo keywords with a done state from refile targets"
;;---   (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;;--- 
;;--- (setq org-refile-target-verify-function 'bh/verify-refile-target)
;;--- ;; Do not dim blocked tasks
;;--- (setq org-agenda-dim-blocked-tasks nil)
;;--- 
;;--- ;; Compact the block agenda view
;;--- (setq org-agenda-compact-blocks t)
;;--- 
;;--- ;; Custom agenda command definitions
;;--- ; (setq org-agenda-custom-commands
;;--- ;       '(("X" agenda "" nil ("agenda.html" "agenda.ps"))
;;--- ;         ("Y" alltodo "" nil ("todo.html" "todo.txt" "todo.ps"))
;;--- ;         ("h" "Agenda and Home-related tasks"
;;--- ;          ((agenda "")
;;--- ;           (tags-todo "home")
;;--- ;           (tags "garden"))
;;--- ;          nil
;;--- ;          ("~/views/home.html"))
;;--- ;         ("o" "Agenda and Office-related tasks"
;;--- ;          ((agenda)
;;--- ;           (tags-todo "work")
;;--- ;           (tags "office"))
;;--- ;          nil
;;--- ;          ("~/views/office.ps" "~/calendars/office.ics"))))
;;--- 
;;--- (setq org-agenda-custom-commands
;;---       (quote (
;;---               ("R" . "Custom Reviews")
;;---               ("Rw" "Weekly review sans routines" agenda ""
;;---                ((org-agenda-span 7)
;;---                 (org-agenda-log-mode 1)
;;---                 (org-agenda-sorting-strategy '(category-keep))
;;---                 ) ("~/org_files/Weekly/thisweek.html" "~/org_files/Weekly/thisweek.org"))
;;---               ("Rd" "Weekly review sans routines" agenda ""
;;---                ((org-agenda-span 7)
;;---                 (org-agenda-log-mode 1)
;;---                 (org-agenda-sorting-strategy '(category-keep))
;;---                 (org-agenda-tag-filter-preset '("+DONE"))) "~/org_files/Weekly/thisweek_done.html")
;;---               ("W" . "Custom Weekly Reports")
;;---               ("Wa" "Blocked Items" (
;;---                                      (tags "-noexport+TODO=\"BLOCKED\"")
;;---                                      (tags "-noexport+TODO=\"WAITING\"")
;;---                                      (tags-todo "-noexport-TODO=\"BLOCKED\"|\"WAITING\"|\"DONE\"|\"CANCELLED\"|\"DEFERED\"")
;;---                                      (tags "-noexport-TODO=\"BLOCKED\"|\"WAITING\"|\"DONE\"|\"CANCELLED\"|\"DEFERED\"")
;;---                                      (tags "-noexport+TODO=\"DONE\"\|\"CANCELLED\"\|\"DEFERED\"")
;;---                                      (tags "-noexport+TODO=\"DONE\"")
;;---                                      (tags-todo "-noexport+TODO=\"INPROGRESS\"")
;;---                                      (agenda "" ((org-agenda-entry-types '(:deadline))
;;---                                                  ;; a slower way to do the same thing
;;---                                                  ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
;;---                                                  (org-agenda-span 1)
;;---                                                  (org-deadline-warning-days 60)
;;---                                                  (org-agenda-time-grid nil)))
;;---                                      (agenda "" ((org-agenda-entry-types '(:scheduled))
;;---                                                  ;; a slower way to do the same thing
;;---                                                  ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
;;---                                                  (org-agenda-span 1)
;;---                                                  (org-agenda-time-grid nil)))
;;---                                      (agenda "" ((org-agenda-entry-types '(:deadline))
;;---                                                  ;; a slower way to do the same thing
;;---                                                  ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
;;---                                                  (org-agenda-span 1)
;;---                                                  (org-deadline-warning-days 60)
;;---                                                  (org-agenda-time-grid nil)))
;;---                                      ) nil ("~/org_files/Weekly/full.org")
;;---                )
;;---               ("Wb" "Blocked Items" ((tags "-noexport+TODO=\"BLOCKED\"")) nil ("~/org_files/Weekly/blocked.org") )
;;---               ("Ww" "Waiting Items" ((tags "-noexport+TODO=\"WAITING\"")) nil ("~/org_files/Weekly/waiting.org") )
;;---               ("Wt" "TODO Tasks" ((tags-todo "-noexport-TODO=\"BLOCKED\"|\"WAITING\"|\"DONE\"|\"CANCELLED\"|\"DEFERED\"")) nil ("~/org_files/Weekly/todo.org") )
;;---               ("Wc" "Completed Tasks" ((tags "-noexport+TODO=\"DONE\"\|\"CANCELLED\"\|\"DEFERED\"")) nil ("~/org_files/Weekly/done.org") )
;;---               ("Wn" "Inprogress Tasks" ((tags-todo "-noexport+TODO=\"INPROGRESS\"")) nil ("~/org_files/Weekly/inprogress.org") )
;;---               ("Wm" "Upcoming deadlines" ((agenda "" ((org-agenda-entry-types '(:deadline))
;;---                                                      ;; a slower way to do the same thing
;;---                                                      ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
;;---                                                      (org-agenda-span 1)
;;---                                                      (org-deadline-warning-days 60)
;;---                                                      (org-agenda-time-grid nil)))
;;---                                          ) nil ("~/org_files/Weekly/deadlines.org" "~/org_files/Weekly/deadlines.html"))
;;---               ("Ws" "Scheduled" ((agenda "" ((org-agenda-entry-types '(:scheduled))
;;---                                                      ;; a slower way to do the same thing
;;---                                                      ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
;;---                                                      (org-agenda-span 1)
;;---                                                      (org-agenda-time-grid nil)))
;;---                                  (tags-todo "-noexport+TODO=\"NEXT\"|\"INPROGRESS\"")
;;---                                 ) nil ("~/org_files/Weekly/scheduled.org"))
;;---               ("Wv" "Vacations" ((tags "-noexport+vacation")
;;---                                 ) nil ("~/org_files/Weekly/vacation.org"))
;;---               ;("W" "Weekly Agenda View"
;;---               ; ((agenda "")
;;---               ;  (tags "-noexport+TODO=\"INPROGRESS\"")
;;---               ;  (tags "-noexport+TODO=\"BLOCKED\""))
;;---               ; nil
;;---               ; ("~/org_files/html/Weekly.html" "~/org_files/html/Weekly.org"))        
;;---               ("N" "Notes" tags "NOTE"
;;---                ((org-agenda-overriding-header "Notes")
;;---                 (org-tags-match-list-sublevels t)))
;;---               ("h" "Habits" tags-todo "STYLE=\"habit\""
;;---                ((org-agenda-overriding-header "Habits")
;;---                 (org-agenda-sorting-strategy
;;---                  '(todo-state-down effort-up category-keep))))
;;---               (" " "Agenda"
;;---                ((agenda "" nil)
;;---                 (tags "REFILE"
;;---                       ((org-agenda-overriding-header "Tasks to Refile")
;;---                        (org-tags-match-list-sublevels nil)))
;;---                 (tags-todo "-CANCELLED/!"
;;---                            ((org-agenda-overriding-header "Stuck Projects")
;;---                             (org-agenda-skip-function 'bh/skip-non-stuck-projects)
;;---                             (org-agenda-sorting-strategy
;;---                              '(category-keep))))
;;---                 (tags-todo "-HOLD-CANCELLED/!"
;;---                            ((org-agenda-overriding-header "Projects")
;;---                             (org-agenda-skip-function 'bh/skip-non-projects)
;;---                             (org-tags-match-list-sublevels 'indented)
;;---                             (org-agenda-sorting-strategy
;;---                              '(category-keep))))
;;---                 (tags-todo "-CANCELLED/!NEXT"
;;---                            ((org-agenda-overriding-header (concat "Project Next Tasks"
;;---                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;---                                                                       ""
;;---                                                                     " (including WAITING and SCHEDULED tasks)")))
;;---                             (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
;;---                             (org-tags-match-list-sublevels t)
;;---                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-sorting-strategy
;;---                              '(todo-state-down effort-up category-keep))))
;;---                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
;;---                            ((org-agenda-overriding-header (concat "Project Subtasks"
;;---                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;---                                                                       ""
;;---                                                                     " (including WAITING and SCHEDULED tasks)")))
;;---                             (org-agenda-skip-function 'bh/skip-non-project-tasks)
;;---                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-sorting-strategy
;;---                              '(category-keep))))
;;---                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
;;---                            ((org-agenda-overriding-header (concat "Standalone Tasks"
;;---                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;---                                                                       ""
;;---                                                                     " (including WAITING and SCHEDULED tasks)")))
;;---                             (org-agenda-skip-function 'bh/skip-project-tasks)
;;---                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-sorting-strategy
;;---                              '(category-keep))))
;;---                 (tags-todo "-CANCELLED+WAITING|HOLD/!"
;;---                            ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
;;---                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;---                                                                       ""
;;---                                                                     " (including WAITING and SCHEDULED tasks)")))
;;---                             (org-agenda-skip-function 'bh/skip-non-tasks)
;;---                             (org-tags-match-list-sublevels nil)
;;---                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;---                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
;;---                 (tags "-REFILE/"
;;---                       ((org-agenda-overriding-header "Tasks to Archive")
;;---                        (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
;;---                        (org-tags-match-list-sublevels nil))))
;;---                nil))))
;;--- 
;;--- ;;
;;--- ;; Resume clocking task when emacs is restarted
;;--- (org-clock-persistence-insinuate)
;;--- ;;
;;--- ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
;;--- (setq org-clock-history-length 23)
;;--- ;; Resume clocking task on clock-in if the clock is open
;;--- (setq org-clock-in-resume t)
;;--- ;; Change tasks to NEXT when clocking in
;;--- (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;;--- ;; Separate drawers for clocking and logs
;;--- (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;;--- ;; Save clock data and state changes and notes in the LOGBOOK drawer
;;--- (setq org-clock-into-drawer t)
;;--- ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
;;--- (setq org-clock-out-remove-zero-time-clocks t)
;;--- ;; Clock out when moving task to a done state
;;--- (setq org-clock-out-when-done t)
;;--- ;; Save the running clock and all clock history when exiting Emacs, load it on startup
;;--- (setq org-clock-persist t)
;;--- ;; Do not prompt to resume an active clock
;;--- (setq org-clock-persist-query-resume nil)
;;--- ;; Enable auto clock resolution for finding open clocks
;;--- (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;;--- ;; Include current clocking task in clock reports
;;--- (setq org-clock-report-include-clocking-task t)
;;--- 
;;--- (setq bh/keep-clock-running nil)
;;--- 
;;--- (defun bh/clock-in-to-next (kw)
;;---   "Switch a task from TODO to NEXT when clocking in.
;;--- Skips capture tasks, projects, and subprojects.
;;--- Switch projects and subprojects from NEXT back to TODO"
;;---   (when (not (and (boundp 'org-capture-mode) org-capture-mode))
;;---     (cond
;;---      ((and (member (org-get-todo-state) (list "TODO"))
;;---            (bh/is-task-p))
;;---       "NEXT")
;;---      ((and (member (org-get-todo-state) (list "NEXT"))
;;---            (bh/is-project-p))
;;---       "TODO"))))
;;--- 
;;--- (defun bh/find-project-task ()
;;---   "Move point to the parent (project) task if any"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
;;---       (while (org-up-heading-safe)
;;---         (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;---           (setq parent-task (point))))
;;---       (goto-char parent-task)
;;---       parent-task)))
;;--- 
;;--- (defun bh/punch-in (arg)
;;---   "Start continuous clocking and set the default task to the
;;--- selected task.  If no task is selected set the Organization task
;;--- as the default task."
;;---   (interactive "p")
;;---   (setq bh/keep-clock-running t)
;;---   (if (equal major-mode 'org-agenda-mode)
;;---       ;;
;;---       ;; We're in the agenda
;;---       ;;
;;---       (let* ((marker (org-get-at-bol 'org-hd-marker))
;;---              (tags (org-with-point-at marker (org-get-tags-at))))
;;---         (if (and (eq arg 4) tags)
;;---             (org-agenda-clock-in '(16))
;;---           (bh/clock-in-organization-task-as-default)))
;;---     ;;
;;---     ;; We are not in the agenda
;;---     ;;
;;---     (save-restriction
;;---       (widen)
;;---                                         ; Find the tags on the current task
;;---       (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
;;---           (org-clock-in '(16))
;;---         (bh/clock-in-organization-task-as-default)))))
;;--- 
;;--- (defun bh/punch-out ()
;;---   (interactive)
;;---   (setq bh/keep-clock-running nil)
;;---   (when (org-clock-is-active)
;;---     (org-clock-out))
;;---   (org-agenda-remove-restriction-lock))
;;--- 
;;--- (defun bh/clock-in-default-task ()
;;---   (save-excursion
;;---     (org-with-point-at org-clock-default-task
;;---       (org-clock-in))))
;;--- 
;;--- (defun bh/clock-in-parent-task ()
;;---   "Move point to the parent (project) task if any and clock in"
;;---   (let ((parent-task))
;;---     (save-excursion
;;---       (save-restriction
;;---         (widen)
;;---         (while (and (not parent-task) (org-up-heading-safe))
;;---           (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;---             (setq parent-task (point))))
;;---         (if parent-task
;;---             (org-with-point-at parent-task
;;---               (org-clock-in))
;;---           (when bh/keep-clock-running
;;---             (bh/clock-in-default-task)))))))
;;--- 
;;--- (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
;;--- 
;;--- (defun bh/clock-in-organization-task-as-default ()
;;---   (interactive)
;;---   (org-with-point-at (org-id-find bh/organization-task-id 'marker)
;;---     (org-clock-in '(16))))
;;--- 
;;--- (defun bh/clock-out-maybe ()
;;---   (when (and bh/keep-clock-running
;;---              (not org-clock-clocking-in)
;;---              (marker-buffer org-clock-default-task)
;;---              (not org-clock-resolving-clocks-due-to-idleness))
;;---     (bh/clock-in-parent-task)))
;;--- 
;;--- (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
;;--- (require 'org-id)
;;--- (defun bh/clock-in-task-by-id (id)
;;---   "Clock in a task by id"
;;---   (org-with-point-at (org-id-find id 'marker)
;;---     (org-clock-in nil)))
;;--- 
;;--- (defun bh/clock-in-last-task (arg)
;;---   "Clock in the interrupted task if there is one
;;--- Skip the default task and get the next one.
;;--- A prefix arg forces clock in of the default task."
;;---   (interactive "p")
;;---   (let ((clock-in-to-task
;;---          (cond
;;---           ((eq arg 4) org-clock-default-task)
;;---           ((and (org-clock-is-active)
;;---                 (equal org-clock-default-task (cadr org-clock-history)))
;;---            (caddr org-clock-history))
;;---           ((org-clock-is-active) (cadr org-clock-history))
;;---           ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
;;---           (t (car org-clock-history)))))
;;---     (widen)
;;---     (org-with-point-at clock-in-to-task
;;---       (org-clock-in nil))))
;;--- (setq org-time-stamp-rounding-minutes (quote (1 1)))
;;--- (setq org-agenda-clock-consistency-checks
;;---       (quote (:max-duration "4:00"
;;---                             :min-duration 0
;;---                             :max-gap 0
;;---                             :gap-ok-around ("4:00"))))
;;--- (setq org-clock-out-remove-zero-time-clocks t)
;;--- (setq org-agenda-clockreport-parameter-plist
;;---       (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
;;---                                         ; Set default column view headings: Task Effort Clock_Summary
;;--- (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
;;---                                         ; global Effort estimate values
;;---                                         ; global STYLE property values for completion
;;--- (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
;;---                                     ("STYLE_ALL" . "habit"))))
;;--- ;; Agenda log mode items to display (closed and state changes by default)
;;--- (setq org-agenda-log-mode-items (quote (closed state clock)))
;;---                                         ; Tags with fast selection keys
;;--- (setq org-tag-alist (quote ((:startgroup)
;;---                             ("@errand" . ?e)
;;---                             ("@office" . ?o)
;;---                             ("@home" . ?H)
;;---                             ("@farm" . ?f)
;;---                             (:endgroup)
;;---                             ("WAITING" . ?w)
;;---                             ("HOLD" . ?h)
;;---                             ("PERSONAL" . ?P)
;;---                             ("WORK" . ?W)
;;---                             ("FARM" . ?F)
;;---                             ("ORG" . ?O)
;;---                             ("NORANG" . ?N)
;;---                             ("crypt" . ?E)
;;---                             ("NOTE" . ?n)
;;---                             ("CANCELLED" . ?c)
;;---                             ("FLAGGED" . ??))))
;;--- 
;;---                                         ; Allow setting single tags without the menu
;;--- (setq org-fast-tag-selection-single-key (quote expert))
;;--- 
;;---                                         ; For tag searches ignore tasks with scheduled and deadline dates
;;--- (setq org-agenda-tags-todo-honor-ignore-options t)
;;--- (setq org-agenda-span 'day)
;;--- ;; Show all future entries for repeating tasks
;;--- (setq org-agenda-repeating-timestamp-show-all t)
;;--- 
;;--- ;; Show all agenda dates - even if they are empty
;;--- (setq org-agenda-show-all-dates t)
;;--- 
;;--- ;; Sorting order for tasks on the agenda
;;--- (setq org-agenda-sorting-strategy
;;---       (quote ((agenda habit-down time-up user-defined-up effort-up category-keep)
;;---               (todo category-up effort-up)
;;---               (tags category-up effort-up)
;;---               (search category-up))))
;;--- 
;;--- ;; Start the weekly agenda on Monday
;;--- (setq org-agenda-start-on-weekday 6)
;;--- 
;;--- ;; Enable display of the time grid so we can see the marker for the current time
;;--- (setq org-agenda-time-grid (quote ((daily today remove-match)
;;---                                    #("----------------" 0 16 (org-heading t))
;;---                                    (0900 1100 1300 1500 1700))))
;;--- 
;;--- ;; Display tags farther right
;;--- (setq org-agenda-tags-column -102)
;;--- 
;;--- ;;
;;--- ;; Agenda sorting functions
;;--- ;;
;;--- (setq org-agenda-cmp-user-defined 'bh/agenda-sort)
;;--- 
;;--- (defun bh/agenda-sort (a b)
;;---   "Sorting strategy for agenda items.
;;--- Late deadlines first, then scheduled, then non-late deadlines"
;;---   (let (result num-a num-b)
;;---     (cond
;;---                                         ; time specific items are already sorted first by org-agenda-sorting-strategy
;;--- 
;;---                                         ; non-deadline and non-scheduled items next
;;---      ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))
;;--- 
;;---                                         ; deadlines for today next
;;---      ((bh/agenda-sort-test 'bh/is-due-deadline a b))
;;--- 
;;---                                         ; late deadlines next
;;---      ((bh/agenda-sort-test-num 'bh/is-late-deadline '> a b))
;;--- 
;;---                                         ; scheduled items for today next
;;---      ((bh/agenda-sort-test 'bh/is-scheduled-today a b))
;;--- 
;;---                                         ; late scheduled items next
;;---      ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))
;;--- 
;;---                                         ; pending deadlines last
;;---      ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))
;;--- 
;;---                                         ; finally default to unsorted
;;---      (t (setq result nil)))
;;---     result))
;;--- 
;;--- (defmacro bh/agenda-sort-test (fn a b)
;;---   "Test for agenda sort"
;;---   `(cond
;;---                                         ; if both match leave them unsorted
;;---     ((and (apply ,fn (list ,a))
;;---           (apply ,fn (list ,b)))
;;---      (setq result nil))
;;---                                         ; if a matches put a first
;;---     ((apply ,fn (list ,a))
;;---      (setq result -1))
;;---                                         ; otherwise if b matches put b first
;;---     ((apply ,fn (list ,b))
;;---      (setq result 1))
;;---                                         ; if none match leave them unsorted
;;---     (t nil)))
;;--- 
;;--- (defmacro bh/agenda-sort-test-num (fn compfn a b)
;;---   `(cond
;;---     ((apply ,fn (list ,a))
;;---      (setq num-a (string-to-number (match-string 1 ,a)))
;;---      (if (apply ,fn (list ,b))
;;---          (progn
;;---            (setq num-b (string-to-number (match-string 1 ,b)))
;;---            (setq result (if (apply ,compfn (list num-a num-b))
;;---                             -1
;;---                           1)))
;;---        (setq result -1)))
;;---     ((apply ,fn (list ,b))
;;---      (setq result 1))
;;---     (t nil)))
;;--- 
;;--- (defun bh/is-not-scheduled-or-deadline (date-str)
;;---   (and (not (bh/is-deadline date-str))
;;---        (not (bh/is-scheduled date-str))))
;;--- 
;;--- (defun bh/is-due-deadline (date-str)
;;---   (string-match "Deadline:" date-str))
;;--- 
;;--- (defun bh/is-late-deadline (date-str)
;;---   (string-match "\\([0-9]*\\) d\. ago:" date-str))
;;--- 
;;--- (defun bh/is-pending-deadline (date-str)
;;---   (string-match "In \\([^-]*\\)d\.:" date-str))
;;--- 
;;--- (defun bh/is-deadline (date-str)
;;---   (or (bh/is-due-deadline date-str)
;;---       (bh/is-late-deadline date-str)
;;---       (bh/is-pending-deadline date-str)))
;;--- 
;;--- (defun bh/is-scheduled (date-str)
;;---   (or (bh/is-scheduled-today date-str)
;;---       (bh/is-scheduled-late date-str)))
;;--- 
;;--- (defun bh/is-scheduled-today (date-str)
;;---   (string-match "Scheduled:" date-str))
;;--- 
;;--- (defun bh/is-scheduled-late (date-str)
;;---   (string-match "Sched\.\\(.*\\)x:" date-str))
;;--- ;; Use sticky agenda's so they persist
;;--- (setq org-agenda-sticky t)
;;--- (setq org-enforce-todo-dependencies t)
;;--- (setq org-show-following-heading t)
;;--- (setq org-show-hierarchy-above t)
;;--- (setq org-show-siblings (quote ((default))))
;;--- (setq org-agenda-exporter-settings
;;---       '((ps-number-of-columns 2)
;;---         (ps-landscape-mode t)
;;---         ;(org-agenda-add-entry-text-maxlines 5)
;;---         (htmlize-output-type 'font)))
;;--- (setq org-html-htmlize-output-type 'inline-css)
;;--- 
;;--- (defun my-org-clocktable-indent-string (level)
;;---   (if (= level 1)
;;---       ""
;;---     (let ((str "-")) ;first char, e.g can be "|"
;;---       (while (> level 2)
;;---         (setq level (1- level)
;;---               str (concat str "-"))) ;fillers, e.g can be "---"
;;---       (concat str " ")))) ;end e.g can be ">"
;;--- 
;;--- (advice-add 'org-clocktable-indent-string :override
;;---             #'my-org-clocktable-indent-string)
;;--- (defun bh/is-project-p ()
;;---   "Any task with a todo keyword subtask"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((has-subtask)
;;---           (subtree-end (save-excursion (org-end-of-subtree t)))
;;---           (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;---       (save-excursion
;;---         (forward-line 1)
;;---         (while (and (not has-subtask)
;;---                     (< (point) subtree-end)
;;---                     (re-search-forward "^\*+ " subtree-end t))
;;---           (when (member (org-get-todo-state) org-todo-keywords-1)
;;---             (setq has-subtask t))))
;;---       (and is-a-task has-subtask))))
;;--- 
;;--- (defun bh/is-project-subtree-p ()
;;---     "Any task with a todo keyword that is in a project subtree.
;;--- Callers of this function already widen the buffer view."
;;---     (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
;;---                                 (point))))
;;---       (save-excursion
;;---         (bh/find-project-task)
;;---         (if (equal (point) task)
;;---             nil
;;---           t))))
;;--- 
;;--- (defun bh/is-task-p ()
;;---   "Any task with a todo keyword and no subtask"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((has-subtask)
;;---           (subtree-end (save-excursion (org-end-of-subtree t)))
;;---           (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;---       (save-excursion
;;---         (forward-line 1)
;;---         (while (and (not has-subtask)
;;---                     (< (point) subtree-end)
;;---                     (re-search-forward "^\*+ " subtree-end t))
;;---           (when (member (org-get-todo-state) org-todo-keywords-1)
;;---             (setq has-subtask t))))
;;---       (and is-a-task (not has-subtask)))))
;;--- 
;;--- (defun bh/is-subproject-p ()
;;---   "Any task which is a subtask of another project"
;;---   (let ((is-subproject)
;;---         (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
;;---     (save-excursion
;;---       (while (and (not is-subproject) (org-up-heading-safe))
;;---         (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
;;---           (setq is-subproject t))))
;;---     (and is-a-task is-subproject)))
;;--- 
;;--- (defun bh/list-sublevels-for-projects-indented ()
;;---     "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
;;---   This is normally used by skipping functions where this variable is already local to the agenda."
;;---     (if (marker-buffer org-agenda-restrict-begin)
;;---         (setq org-tags-match-list-sublevels 'indented)
;;---       (setq org-tags-match-list-sublevels nil))
;;---     nil)
;;--- 
;;--- (defun bh/list-sublevels-for-projects ()
;;---     "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
;;---   This is normally used by skipping functions where this variable is already local to the agenda."
;;---     (if (marker-buffer org-agenda-restrict-begin)
;;---         (setq org-tags-match-list-sublevels t)
;;---       (setq org-tags-match-list-sublevels nil))
;;---     nil)
;;--- 
;;--- (defvar bh/hide-scheduled-and-waiting-next-tasks t)
;;--- 
;;--- (defun bh/toggle-next-task-display ()
;;---   (interactive)
;;---   (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
;;---   (when  (equal major-mode 'org-agenda-mode)
;;---     (org-agenda-redo))
;;---   (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))
;;--- 
;;--- (defun bh/skip-stuck-projects ()
;;---   "Skip trees that are not stuck projects"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;---       (if (bh/is-project-p)
;;---           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;---                  (has-next ))
;;---             (save-excursion
;;---               (forward-line 1)
;;---               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;;---                 (unless (member "WAITING" (org-get-tags-at))
;;---                   (setq has-next t))))
;;---             (if has-next
;;---                 nil
;;---               next-headline)) ; a stuck project, has subtasks but no next task
;;---         nil))))
;;--- 
;;--- (defun bh/skip-non-stuck-projects ()
;;---   "Skip trees that are not stuck projects"
;;---   ;; (bh/list-sublevels-for-projects-indented)
;;---   (save-restriction
;;---     (widen)
;;---     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;---       (if (bh/is-project-p)
;;---           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;---                  (has-next ))
;;---             (save-excursion
;;---               (forward-line 1)
;;---               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;;---                 (unless (member "WAITING" (org-get-tags-at))
;;---                   (setq has-next t))))
;;---             (if has-next
;;---                 next-headline
;;---               nil)) ; a stuck project, has subtasks but no next task
;;---         next-headline))))
;;--- 
;;--- (defun bh/skip-non-projects ()
;;---   "Skip trees that are not projects"
;;---   ;; (bh/list-sublevels-for-projects-indented)
;;---   (if (save-excursion (bh/skip-non-stuck-projects))
;;---       (save-restriction
;;---         (widen)
;;---         (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;---           (cond
;;---            ((bh/is-project-p)
;;---             nil)
;;---            ((and (bh/is-project-subtree-p) (not (bh/is-task-p)))
;;---             nil)
;;---            (t
;;---             subtree-end))))
;;---     (save-excursion (org-end-of-subtree t))))
;;--- 
;;--- (defun bh/skip-non-tasks ()
;;---     "Show non-project tasks.
;;--- Skip project and sub-project tasks, habits, and project related tasks."
;;---     (save-restriction
;;---       (widen)
;;---       (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;---         (cond
;;---          ((bh/is-task-p)
;;---           nil)
;;---          (t
;;---           next-headline)))))
;;--- 
;;--- (defun bh/skip-project-trees-and-habits ()
;;---   "Skip trees that are projects"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;---       (cond
;;---        ((bh/is-project-p)
;;---         subtree-end)
;;---        ((org-is-habit-p)
;;---         subtree-end)
;;---        (t
;;---         nil)))))
;;--- 
;;--- (defun bh/skip-projects-and-habits-and-single-tasks ()
;;---   "Skip trees that are projects, tasks that are habits, single non-project tasks"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;---       (cond
;;---        ((org-is-habit-p)
;;---         next-headline)
;;---        ((and bh/hide-scheduled-and-waiting-next-tasks
;;---              (member "WAITING" (org-get-tags-at)))
;;---         next-headline)
;;---        ((bh/is-project-p)
;;---         next-headline)
;;---        ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
;;---         next-headline)
;;---        (t
;;---         nil)))))
;;--- 
;;--- (defun bh/skip-project-tasks-maybe ()
;;---     "Show tasks related to the current restriction.
;;--- When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
;;--- When not restricted, skip project and sub-project tasks, habits, and project related tasks."
;;---     (save-restriction
;;---       (widen)
;;---       (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;---              (next-headline (save-excursion (or (outline-next-heading) (point-max))))
;;---              (limit-to-project (marker-buffer org-agenda-restrict-begin)))
;;---         (cond
;;---          ((bh/is-project-p)
;;---           next-headline)
;;---          ((org-is-habit-p)
;;---           subtree-end)
;;---          ((and (not limit-to-project)
;;---                (bh/is-project-subtree-p))
;;---           subtree-end)
;;---          ((and limit-to-project
;;---                (bh/is-project-subtree-p)
;;---                (member (org-get-todo-state) (list "NEXT")))
;;---           subtree-end)
;;---          (t
;;---           nil)))))
;;--- 
;;--- (defun bh/skip-project-tasks ()
;;---     "Show non-project tasks.
;;--- Skip project and sub-project tasks, habits, and project related tasks."
;;---     (save-restriction
;;---       (widen)
;;---       (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
;;---         (cond
;;---          ((bh/is-project-p)
;;---           subtree-end)
;;---          ((org-is-habit-p)
;;---           subtree-end)
;;---          ((bh/is-project-subtree-p)
;;---           subtree-end)
;;---          (t
;;---           nil)))))
;;--- 
;;--- (defun bh/skip-non-project-tasks ()
;;---     "Show project tasks.
;;--- Skip project and sub-project tasks, habits, and loose non-project tasks."
;;---     (save-restriction
;;---       (widen)
;;---       (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;;---              (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;;---         (cond
;;---          ((bh/is-project-p)
;;---           next-headline)
;;---          ((org-is-habit-p)
;;---           subtree-end)
;;---          ((and (bh/is-project-subtree-p)
;;---                (member (org-get-todo-state) (list "NEXT")))
;;---           subtree-end)
;;---          ((not (bh/is-project-subtree-p))
;;---           subtree-end)
;;---          (t
;;---           nil)))))
;;--- 
;;--- (defun bh/skip-projects-and-habits ()
;;---   "Skip trees that are projects and tasks that are habits"
;;---   (save-restriction
;;---     (widen)
;;---     (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;---       (cond
;;---        ((bh/is-project-p)
;;---         subtree-end)
;;---        ((org-is-habit-p)
;;---         subtree-end)
;;---        (t
;;---         nil)))))
;;--- 
;;--- (defun bh/skip-non-subprojects ()
;;---   "Skip trees that are not projects"
;;---   (let ((next-headline (save-excursion (outline-next-heading))))
;;---     (if (bh/is-subproject-p)
;;---         nil
;;---             next-headline)))
;;--- (setq org-duration-format (quote h:mm))
;;--- 
;;--- 
;;--- (defun org-summary-todo (n-done n-not-done)
;;---   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;---   (let (org-log-done org-log-states)   ; turn off logging
;;---     (org-todo (if (= n-not-done 0) "DONE"
;;---                 (if (= n-done 0) "TODO" "INPROGRESS")
;;---                 ;"TODO"
;;---                 ))))
;;--- 
;;--- (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;;--- ;; ;; ORG mode
;;--- ;; ;; define "R" as the prefix key for reviewing what happened in various
;;--- ;; ;; time periods
;;--- ;; (add-to-list 'org-agenda-custom-commands
;;--- ;;              '("R" . "Review" )
;;--- ;;              )
;;--- ;; 
;;--- ;; ;; Common settings for all reviews
;;--- ;; (setq efs/org-agenda-review-settings
;;--- ;;       '(;(org-agenda-files '("~/org/notes.org"
;;--- ;;         ;                    "~/org/projects.org"
;;--- ;;         ;                    ))
;;--- ;;         (org-agenda-show-all-dates t)
;;--- ;;         (org-agenda-start-with-log-mode t)
;;--- ;;         (org-agenda-start-with-clockreport-mode t)
;;--- ;;         (org-agenda-archives-mode t)
;;--- ;;         ;; I don't care if an entry was archived
;;--- ;;         (org-agenda-hide-tags-regexp
;;--- ;;          (concat org-agenda-hide-tags-regexp
;;--- ;;                  "\\|ARCHIVE"))
;;--- ;;         ))
;;--- ; ;; Show the agenda with the log turn on, the clock table show and
;;--- ; ;; archived entries shown.  These commands are all the same exept for
;;--- ; ;; the time period.
;;--- ; (add-to-list 'org-agenda-custom-commands
;;--- ;              `("Rw" "Week in review"
;;--- ;                agenda ""
;;--- ;                ;; agenda settings
;;--- ;                ,(append
;;--- ;                  efs/org-agenda-review-settings
;;--- ;                  '((org-agenda-span 'week)
;;--- ;                    (org-agenda-start-on-weekday 0)
;;--- ;                    (org-agenda-overriding-header "Week in Review"))
;;--- ;                  )
;;--- ;                ("~/org/review/week.html")
;;--- ;                ))
;;--- ; 
;;--- ; 
;;--- ; (add-to-list 'org-agenda-custom-commands
;;--- ;              `("Rd" "Day in review"
;;--- ;                agenda ""
;;--- ;                ;; agenda settings
;;--- ;                ,(append
;;--- ;                  efs/org-agenda-review-settings
;;--- ;                  '((org-agenda-span 'day)
;;--- ;                    (org-agenda-overriding-header "Week in Review"))
;;--- ;                  )
;;--- ;                ("~/org/review/day.html")
;;--- ;                ))
;;--- ; 
;;--- ; (add-to-list 'org-agenda-custom-commands
;;--- ;              `("Rm" "Month in review"
;;--- ;                agenda ""
;;--- ;                ;; agenda settings
;;--- ;                ,(append
;;--- ;                  efs/org-agenda-review-settings
;;--- ;                  '((org-agenda-span 'month)
;;--- ;                    (org-agenda-start-day "01")
;;--- ;                    (org-read-date-prefer-future nil)
;;--- ;                    (org-agenda-overriding-header "Month in Review"))
;;--- ;                  )
;;--- ;                ("~/org/review/month.html")
;;--- ;                                ))
;;--- ; 
;;--- ; 
;;--- ; 
;;--- ; (add-to-list 'org-agenda-custom-commands
;;--- ;              `("Rw" "Week in review"
;;--- ;                agenda ""
;;--- ;                ;; agenda settings
;;--- ;                ,(append
;;--- ;                  efs/org-agenda-review-settings
;;--- ;                  '((org-agenda-span 'week)
;;--- ;                    (org-agenda-start-on-weekday 0)
;;--- ;                    (org-agenda-overriding-header "Week in Review"))
;;--- ;                  )
;;--- ;                ("~/org/review/week.html")
;;--- ;                ))
;;--- ; 
;;--- ; (add-to-list 'org-agenda-custom-commands
;;--- ;              `("Ro" "Week in review"
;;--- ;                 ((agenda "" ((org-agenda-ndays 1)) )
;;--- ;                  (tags "DONE")
;;--- ;                  (tags-todo "NEXT"))
;;--- ;                 ;; agenda settings
;;--- ;                 ;(append
;;--- ;                 ;  efs/org-agenda-review-settings
;;--- ;                 ;  '((org-agenda-span 'week)
;;--- ;                 ;    (org-agenda-start-on-weekday 6)
;;--- ;                 ;    (org-agenda-overriding-header "Week in Review"))
;;--- ;                 ;  )
;;--- ;                 ;("~/org_files/Weekly-Chidvilas.html"))
;;--- ;                ))
;;--- ; 
;;--- ;(setq 'org-agenda-custom-commands
;;--- ;      '(("O" "Office block agenda"
;;--- ;         ((agenda "" ((org-agenda-ndays 1)))
;;--- ;          ;; limits the agenda display to a single day
;;--- ;          (tags-todo "+PRIORITY=\"A\"")
;;--- ;          (tags-todo "computer|office|phone")
;;--- ;          (tags "project+CATEGORY=\"elephants\"")
;;--- ;          (tags "review" ((org-agenda-files '("~/org/circuspeanuts.org"))))
;;--- ;          ;; limits the tag search to the file circuspeanuts.org
;;--- ;          (todo "WAITING"))
;;--- ;         ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block
;;--- ;        ;; ...other commands here
;;--- ;                ))
;;--- 
;;--- 
;;--- 
;;--- ; Make it easier to generate bullets for $BOSS
;;--- (defvar bullet-entry-types
;;---   '(:closed)
;;---   "Org-mode agenda types that we want to see in the monthly bullet report
;;--- See `org-agenda-entry-types'."
;;---   )
;;--- 
;;--- (defun bullets ()
;;---   "Show a list of achievements for the past month, for monthly reports.
;;--- Uses `org-agenda'.
;;--- "
;;---   (interactive)
;;---   (require 'org-agenda)
;;---   ; All we're doing here, really, is calling `org-agenda' with
;;---   ; arguments giving a start date and a number of days. But to do
;;---   ; that, we need to figure out
;;---   ; - the date of the first of last month
;;---   ; - the number of days in last month
;;---   (let* ((now (current-time))
;;--- 	 ; Figure out when last month was. Assuming that I run this
;;--- 	 ; close to the beginning of a month, then `now' minus two
;;--- 	 ; weeks was some time in the previous month. We can use that
;;--- 	 ; to extract the year and month that we're interested in.
;;--- 	 (2weeks-ago
;;--- 	  (time-subtract now
;;--- 			 (days-to-time 14)))
;;--- 	 ; We'll also need to know when the first of this month was,
;;--- 	 ; to find out how long last month was. If today is the 12th
;;--- 	 ; of the month, then the first of the month was `now' minus
;;--- 	 ; 11 days.
;;--- 	 (1st-of-this-month
;;--- 	  (time-subtract now
;;--- 			 (days-to-time
;;--- 			  (- (nth 3 (decode-time now))
;;--- 			     1))))
;;--- 	 ; Ditto to find the first of last month.
;;--- 	 (1st-of-last-month
;;--- 	  (time-subtract 2weeks-ago
;;--- 			 (days-to-time
;;--- 			  (- (nth 3 (decode-time 2weeks-ago))
;;--- 			     1))))
;;--- 	 ; The length of last month is the difference (in days)
;;--- 	 ; between the first of last month, and the first of this
;;--- 	 ; month.
;;--- 	 (len-last-month
;;--- 	  (time-to-number-of-days
;;--- 	   (time-subtract 1st-of-this-month
;;--- 			  1st-of-last-month)))
;;--- 	 (start-date (decode-time 1st-of-last-month))
;;--- 	 (start-year (nth 5 start-date))	; Year number
;;--- 	 (start-mon (nth 4 start-date))		; Month number
;;--- 	 ; Restrict the agenda to only those types of entries we're
;;--- 	 ; interested in. I think this takes advantage of dynamic
;;--- 	 ; scoping, which is normally an abomination unto the lord,
;;--- 	 ; but is useful here.
;;--- 	 (org-agenda-entry-types bullet-entry-types)
;;--- 	 )
;;---     ; Create an agenda with the stuff we've prepared above
;;---     (org-agenda-list nil
;;--- 		     (format "%04d-%02d-01"
;;--- 			     start-year
;;--- 			     start-mon)
;;--- 		     len-last-month)
;;---     ))
;;--- 
;;--- 
;;------------------------------------------------------------------------
;; ORG Mode
;;------------------------------------------------------------------------
(require 'org)
(require 'ob-tangle)

;;;;emacs auto save for org-mode only - Stack Overflow
;;(add-hook 'org-mode-hook 'my-org-mode-autosave-settings)
;;(defun my-org-mode-autosave-settings ()
;;  ;; (auto-save-mode 1)   ; this is unnecessary as it is on by default
;;  (set (make-local-variable 'auto-save-visited-file-name) t)
;;  (setq auto-save-interval 20))

;;;;; Load modules
                                        ;(setq org-modules '(org-bbdb
                                        ;                      org-gnus
                                        ;                      org-drill
                                        ;                      org-info
                                        ;                      org-jsinfo
                                        ;                      org-habit
                                        ;                      org-irc
                                        ;                      org-mouse
                                        ;                      org-protocol
                                        ;                      org-annotate-file
                                        ;                      org-eval
                                        ;                      org-expiry
                                        ;                      org-interactive-query
                                        ;                      org-man
                                        ;                      org-collector
                                        ;                      org-panel
                                        ;                      org-screen
                                        ;                      org-toc))
                                        ;(eval-after-load 'org
                                        ; '(org-load-modules-maybe t))
;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

;;;;; UTF-8 checkboxes
(setq org-html-checkbox-type 'unicode)
(setq org-html-checkbox-types
      '((unicode (on . "<span class=\"task-done\">&#x2611;</span>")
                 (off . "<span class=\"task-todo\">&#x2610;</span>")
                 (trans . "<span class=\"task-in-progress\">[-]</span>"))))

;;;;; Keyboard shortcuts
(bind-key "C-c r" 'org-capture)
(bind-key "C-c a" 'org-agenda)
(bind-key "C-c l" 'org-store-link)
(bind-key "C-c L" 'org-insert-link-global)
(bind-key "C-c O" 'org-open-at-point-global)
(bind-key "<f9> <f9>" 'org-agenda-list)
(bind-key "<f9> <f8>" (lambda () (interactive) (org-capture nil "r")))

                                        ;append-next-kill is more useful to me than org-table-copy-region.
(with-eval-after-load 'org
  (bind-key "C-M-w" 'append-next-kill org-mode-map)
  (bind-key "C-TAB" 'org-cycle org-mode-map)
  (bind-key "C-c v" 'org-show-todo-tree org-mode-map)
  (bind-key "C-c C-r" 'org-refile org-mode-map)
  (bind-key "C-c R" 'org-reveal org-mode-map)
  (bind-key "C-c o" 'my/org-follow-entry-link org-mode-map)
  (bind-key "C-c d" 'my/org-move-line-to-destination org-mode-map)
  (bind-key "C-c f" 'my/org-file-blog-index-entries org-mode-map)
  (bind-key "C-c t s"  'my/split-sentence-and-capitalize org-mode-map)
  (bind-key "C-c t -"  'my/split-sentence-delete-word-and-capitalize org-mode-map)
  (bind-key "C-c t d"  'my/delete-word-and-capitalize org-mode-map)

  (bind-key "C-c C-p C-p" 'my/org-publish-maybe org-mode-map)
  (bind-key "C-c C-r" 'my/org-refile-and-jump org-mode-map))

                                        ;I don't use the diary, but I do use the clock a lot.
;(with-eval-after-load 'org-agenda
;  (bind-key "i" 'org-agenda-clock-in org-agenda-mode-map))

;;;;;;;;;;;;; Speed commands
                                        ;These are great for quickly acting on tasks.
(setq org-use-effective-time t)

(defun my/org-use-speed-commands-for-headings-and-lists ()
  "Activate speed commands on list items too."
  (or (and (looking-at org-outline-regexp) (looking-back "^\**"))
      (save-excursion (and (looking-at (org-item-re)) (looking-back "^[ \t]*")))))
(setq org-use-speed-commands 'my/org-use-speed-commands-for-headings-and-lists)

(with-eval-after-load 'org
  (add-to-list 'org-speed-commands-user '("x" org-todo "DONE"))
  (add-to-list 'org-speed-commands-user '("y" org-todo-yesterday "DONE"))
  (add-to-list 'org-speed-commands-user '("!" my/org-clock-in-and-track))
  (add-to-list 'org-speed-commands-user '("s" call-interactively 'org-schedule))
  (add-to-list 'org-speed-commands-user '("d" my/org-move-line-to-destination))
  (add-to-list 'org-speed-commands-user '("i" call-interactively 'org-clock-in))
  (add-to-list 'org-speed-commands-user '("P" call-interactively 'org2blog/wp-post-subtree))
  (add-to-list 'org-speed-commands-user '("o" call-interactively 'org-clock-out))
  (add-to-list 'org-speed-commands-user '("$" call-interactively 'org-archive-subtree))
  ;(bind-key "!" 'my/org-clock-in-and-track org-agenda-mode-map)
  )

;;;;;;;;;;;;;;; Navigation
                                        ;From http://stackoverflow.com/questions/15011703/is-there-an-emacs-org-mode-command-to-jump-to-an-org-heading

(setq org-goto-interface 'outline
      org-goto-max-level 10)
(require 'imenu)
(setq org-startup-folded nil)
(bind-key "C-c j" 'org-clock-goto) ;; jump to current task from anywhere
(bind-key "C-c C-w" 'org-refile)
(setq org-cycle-include-plain-lists 'integrate)
                                        ;Link Org subtrees and navigate between them
                                        ;The following code makes it easier for me to link trees with entries, as in http://sachachua.com/evil-plans

(defun my/org-follow-entry-link ()
  "Follow the defined link for this entry."
  (interactive)
  (if (org-entry-get (point) "LINK")
      (org-open-link-from-string (org-entry-get (point) "LINK"))
    (org-open-at-point)))

(defun my/org-link-projects (location)
  "Add link properties between the current subtree and the one specified by LOCATION."
  (interactive
   (list (let ((org-refile-use-cache nil))
           (org-refile-get-location "Location"))))
  (let ((link1 (org-store-link nil)) link2)
    (save-window-excursion
      (org-refile 4 nil location)
      (setq link2 (org-store-link nil))
      (org-set-property "LINK" link1))
    (org-set-property "LINK" link2)))

                                        ;Viewing, navigating, and editing the Org tree
                                        ;I often cut and paste subtrees. This makes it easier to cut something and paste it elsewhere in the hierarchy.
(with-eval-after-load 'org
  (bind-key "C-c k" 'org-cut-subtree org-mode-map)
  (setq org-yank-adjusted-subtrees t))

;;;;;;;;;Taking notes
                                        ;My org files are in my personal directory, which is actually a symlink to a directory in my Dropbox. That way, I can update my Org files from multiple computers.

(setq org-directory "~/org_files")
(setq org-default-notes-file "~/org_files/organizer.org")

(defun my/yank-more ()
  (interactive)
  (insert "[[")
  (yank)
  (insert "][more]]"))
(global-set-key (kbd "C-<f6>") 'my/yank-more)

;;;;;;;;;;;;;;;Date trees
                                        ;This quickly adds a same-level heading for the succeeding day.
(defun my/org-insert-heading-for-next-day ()
  "Insert a same-level heading for the following day."
  (interactive)
  (let ((new-date
         (seconds-to-time
          (+ 86400.0
             (float-time
              (org-read-date nil 'to-time (elt (org-heading-components) 4)))))))
    (org-insert-heading-after-current)
    (insert (format-time-string "%Y-%m-%d\n\n" new-date))))

;;;;;Templates
;I use org-capture templates to quickly jot down tasks, ledger entries, notes, and other semi-structured pieces of information.
(defun my/org-contacts-template-email (&optional return-value)
  "Try to return the contact email for a template.
  If not found return RETURN-VALUE or something that would ask the user."
  (or (cadr (if (gnus-alive-p)
                (gnus-with-article-headers
                 (mail-extract-address-components
                  (or (mail-fetch-field "Reply-To") (mail-fetch-field "From") "")))))
      return-value
      (concat "%^{" org-contacts-email-property "}p")))

(defvar my/org-basic-task-template "* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i
" "Basic task data")
(setq org-capture-templates
      `(("t" "Tasks" entry
         (file+headline "~/personal/organizer.org" "Inbox")
         ,my/org-basic-task-template)
        ("T" "Quick task" entry
         (file+headline "~/personal/organizer.org" "Inbox")
         "* TODO %^{Task}\nSCHEDULED: %t\n"
         :immediate-finish t)
        ("i" "Interrupting task" entry
         (file+headline "~/personal/organizer.org" "Inbox")
         "* STARTED %^{Task}"
         :clock-in :clock-resume)
        ("e" "Emacs idea" entry
         (file+headline "~/code/emacs-notes/tasks.org" "Emacs")
         "* TODO %^{Task}"
         :immediate-finish t)
        ("E" "Energy" table-line
         (file+headline "~/personal/organizer.org" "Track energy")
         "| %U | %^{Energy 5-awesome 3-fuzzy 1-zzz} | %^{Note} |"
         :immediate-finish t
         )
        ("b" "Business task" entry
         (file+headline "~/personal/business.org" "Tasks")
         ,my/org-basic-task-template)
        ("p" "People task" entry
         (file+headline "~/personal/people.org" "Tasks")
         ,my/org-basic-task-template)
        ("j" "Journal entry" plain
         (file+datetree "~/personal/journal.org")
         "%K - %a\n%i\n%?\n"
         :unnarrowed t)
        ("J" "Journal entry with date" plain
         (file+datetree+prompt "~/personal/journal.org")
         "%K - %a\n%i\n%?\n"
         :unnarrowed t)
        ("s" "Journal entry with date, scheduled" entry
         (file+datetree+prompt "~/personal/journal.org")
         "* \n%K - %a\n%t\t%i\n%?\n"
         :unnarrowed t)
        ("c" "Protocol Link" entry (file+headline ,org-default-notes-file "Inbox")
         "* [[%:link][%:description]] \n\n#+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n%?\n\nCaptured: %U")
        ("db" "Done - Business" entry
         (file+headline "~/personal/business.org" "Tasks")
         "* DONE %^{Task}\nSCHEDULED: %^t\n%?")
        ("dp" "Done - People" entry
         (file+headline "~/personal/people.org" "Tasks")
         "* DONE %^{Task}\nSCHEDULED: %^t\n%?")
        ("dt" "Done - Task" entry
         (file+headline "~/personal/organizer.org" "Inbox")
         "* DONE %^{Task}\nSCHEDULED: %^t\n%?")
        ("q" "Quick note" item
         (file+headline "~/personal/organizer.org" "Quick notes"))
        ("l" "Ledger entries")
        ("lm" "MBNA" plain
         (file "~/personal/ledger")
         "%(org-read-date) %^{Payee}
    Liabilities:MBNA
    Expenses:%^{Account}  $%^{Amount}
  " :immediate-finish t)
        ("ln" "No Frills" plain
         (file "~/personal/ledger")
         "%(let ((org-read-date-prefer-future nil)) (org-read-date)) * No Frills
    Liabilities:MBNA
    Assets:Wayne:Groceries  $%^{Amount}
  " :immediate-finish t)
        ("lc" "Cash" plain
         (file "~/personal/ledger")
         "%(org-read-date) * %^{Payee}
    Expenses:Cash
    Expenses:%^{Account}  %^{Amount}
  ")
        ("B" "Book" entry
         (file+datetree "~/personal/books.org" "Inbox")
         "* %^{Title}  %^g
  %i
  *Author(s):* %^{Author} \\\\
  *ISBN:* %^{ISBN}

  %?

  *Review on:* %^t \\
  %a
  %U"
         :clock-in :clock-resume)
        ("C" "Contact" entry (file "~/personal/contacts.org")
         "* %(org-contacts-template-name)
  :PROPERTIES:
  :EMAIL: %(my/org-contacts-template-email)
  :END:")
        ("n" "Daily note" table-line (file+olp "~/personal/organizer.org" "Inbox")
         "| %u | %^{Note} |"
         :immediate-finish t)
        ("r" "Notes" entry
         (file+datetree "~/personal/organizer.org")
         "* %?\n\n%i\n%U\n"
         )))
(bind-key "C-M-r" 'org-capture)

                                        ;Allow refiling in the middle(ish) of a capture
                                        ;This lets me use C-c C-r to refile a capture and then jump to the new location. I wanted to be able to file tasks under projects so that they could inherit the QUANTIFIED property that I use to track time (and any Beeminder-related properties too), but I also wanted to be able to clock in on them.
(defun my/org-refile-and-jump ()
  (interactive)
  (if (derived-mode-p 'org-capture-mode)
      (org-capture-refile)
    (call-interactively 'org-refile))
  (org-refile-goto-last-stored))
(eval-after-load 'org-capture
  '(bind-key "C-c C-r" 'my/org-refile-and-jump org-capture-mode-map))



;;;;;;;;;;;;;;;;;;Refiling
                                        ;org-refile lets you organize notes by typing in the headline to file them under.

(setq org-reverse-note-order t)
(setq org-refile-use-outline-path nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-use-cache nil)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))
(setq org-blank-before-new-entry nil)

;;;;TEACH Jump to Org location by substring
;; Example: (org-refile 4 nil (my/org-refile-get-location-by-substring "Other Emacs"))
(defun my/org-refile-get-location-by-substring (regexp &optional file)
  "Return the refile location identified by REGEXP."
  (let ((org-refile-targets org-refile-targets) tbl)
    (setq org-refile-target-table (org-refile-get-targets)))
  (unless org-refile-target-table
    (user-error "No refile targets"))
  (cl-find regexp org-refile-target-table
           :test
           (lambda (a b)
             (and
              (string-match a (car b))
              (or (null file)
                  (string-match file (elt b 1)))))))
(defun my/org-refile-subtree-to (name)
  (org-refile nil nil (my/org-refile-get-location-exact name)))

(defun my/org-refile-get-location-exact (name &optional file)
  "Return the refile location identified by NAME."
  (let ((org-refile-targets org-refile-targets) tbl)
    (setq org-refile-target-table (org-refile-get-targets)))
  (unless org-refile-target-table
    (user-error "No refile targets"))
  (cl-find name org-refile-target-table
           :test (lambda (a b)
                   (and (string-equal a (car b))
                        (or (null file)
                            (string-match file (elt b 1)))))))
;; Example: (my/org-clock-in-refile "Off my computer")
(defun my/org-clock-in-refile (location &optional file)
  "Clocks into LOCATION.
LOCATION and FILE can also be regular expressions for `my/org-refile-get-location-by-substring'."
  (interactive (list (my/org-refile-get-location)))
  (save-window-excursion
    (save-excursion
      (if (stringp location) (setq location (my/org-refile-get-location-by-substring location file)))
      (org-refile 4 nil location)
      (org-clock-in))))

(defun my/org-finish-previous-task-and-clock-in-new-one (location &optional file)
  (interactive (list (my/org-refile-get-location)))
  (save-window-excursion
    (org-clock-goto)
    (org-todo 'done))
  (my/org-clock-in-and-track-by-name location file))

(defun my/org-clock-in-and-track-by-name (location &optional file)
  (interactive (list (my/org-refile-get-location)))
  (save-window-excursion
    (save-excursion
      (if (stringp location) (setq location (my/org-refile-get-location-exact location file)))
      (org-refile 4 nil location)
      (my/org-clock-in-and-track))))
(defun my/org-off-my-computer (category)
  (interactive "MCategory: ")
  (my/org-clock-in-refile "Off my computer")
  (quantified-track category))
                                        ;Quick way to jump
(defun my/org-jump ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'org-refile)))
;;;;Estimating WPM
                                        ;I'm curious about how fast I type some things.

(require 'org-clock)
(defun my/org-entry-wpm ()
  (interactive)
  (save-restriction
    (save-excursion
      (org-narrow-to-subtree)
      (goto-char (point-min))
      (let* ((words (count-words-region (point-min) (point-max)))
             (minutes (org-clock-sum-current-item))
             (wpm (/ words minutes)))
        (message "WPM: %d (words: %d, minutes: %d)" wpm words minutes)
        (kill-new (number-to-string wpm))))))
;;;;;;;;;;;;;;;Tasks
                                        ;Managing tasks
                                        ;Track TODO state
                                        ;The parentheses indicate keyboard shortcuts that I can use to set the task state. @ and ! toggle logging. @ prompts you for a note, and ! automatically logs the timestamp of the state change.

(setq org-todo-keywords
      '((sequence
         "TODO(t)"  ; next action
         "TOBLOG(b)"  ; next action
         "STARTED(s)"
         "WAITING(w@/!)"
         "SOMEDAY(.)" "|" "DONE(x!)" "CANCELLED(c@)")
        (sequence "TODO(t)" "NEXT(n)" "INPROGRESS(i)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
        (sequence "BLOCKED(b@)" "NEXT" "|" "DONE")
        (sequence "TRACKING" "|" "DONE")
        (sequence "LEARN" "TRY" "TEACH" "|" "COMPLETE(x)")
        (sequence "TOSKETCH" "SKETCHED" "|" "POSTED")
        (sequence "TOBUY" "TOSHRINK" "TOCUT"  "TOSEW" "|" "DONE(x)")
        (sequence "TODELEGATE(-)" "DELEGATED(d)" "|" "COMPLETE(x)")
        ))
(setq org-todo-keyword-faces
      '(
        ("BLOCKED" :foreground "red" :weight bold)
        ("CANCELLED" :foreground "forest green" :weight bold)
        ;("DONE" . (:foreground "cyan" :weight bold))
        ("DONE" :foreground "forest green" :weight bold)
        ("HOLD" :foreground "magenta" :weight bold)
        ("STARTED" :foreground "orange" :weight bold)
        ("INPROGRESS" :foreground "orange" :weight bold)
        ("MEETING" :foreground "forest green" :weight bold)
        ("STARTED" :foreground "blue" :weight bold)
        ("NEXT" :foreground "blue" :weight bold)
        ("PHONE" :foreground "forest green" :weight bold)
        ("SCHEDULED" :foreground "orange" :weight bold)
        ("SOMEDAY" . (:foreground "gray" :weight bold))
        ;("TODO" . (:foreground "green" :weight bold))
        ("TODO" :foreground "red" :weight bold)
        ("TRACKING" :foreground "orange" :weight bold)
        ("WAITING" . (:foreground "magenta" :weight bold))
        ;("WAITING" :foreground "magenta" :weight bold)
        ))
(setq org-log-done 'time)

;;;;;;Projects
                                        ;Projects are headings with the :project: tag, so we generally don't want that tag inherited, except when we display unscheduled tasks that don't belong to any projects.
(setq org-tags-exclude-from-inheritance '("project"))
                                        ;This code makes it easy for me to focus on one project and its tasks.
(add-to-list 'org-speed-commands-user '("N" org-narrow-to-subtree))
(add-to-list 'org-speed-commands-user '("W" widen))

(defun my/org-agenda-for-subtree ()
  (interactive)
  (when (derived-mode-p 'org-agenda-mode) (org-agenda-switch-to))
  (my/org-with-current-task
   (let ((org-agenda-view-columns-initially t))
     (org-agenda nil "t" 'subtree))))
(add-to-list 'org-speed-commands-user '("T" my/org-agenda-for-subtree))
                                        ;There's probably a proper way to do this, maybe with <. Oh, that would work nicely. < C-c a t too.
                                        ;And sorting:
(add-to-list 'org-speed-commands-user '("S" call-interactively 'org-sort))
                                        ;Tag tasks with GTD-ish contexts
                                        ;This defines keyboard shortcuts for those, too.

(setq org-tag-alist '(("@work" . ?b)
                      ("@home" . ?h)
                      ("@writing" . ?w)
                      ("@errands" . ?e)
                      ("@drawing" . ?d)
                      ("@coding" . ?c)
                      ("kaizen" . ?k)
                      ("@phone" . ?p)
                      ("@reading" . ?r)
                      ("@computer" . ?l)
                      ("quantified" . ?q)
                      ("fuzzy" . ?0)
                      ("highenergy" . ?1)))
                                        ;Enable filtering by effort estimates
                                        ;That way, it's easy to see short tasks that I can finish.

(add-to-list 'org-global-properties
             '("Effort_ALL". "0:05 0:15 0:30 1:00 2:00 3:00 4:00"))
                                        ;Track time
(use-package org
  :init
  (progn
    (setq org-expiry-inactive-timestamps t)
    (setq org-clock-idle-time nil)
    (setq org-log-done 'time)
    (setq org-clock-continuously nil)
    (setq org-clock-persist t)
    (setq org-clock-in-switch-to-state "STARTED")
    (setq org-clock-in-resume nil)
    (setq org-show-notification-handler 'message)
    (setq org-clock-report-include-clocking-task t))
  :config
  (org-clock-persistence-insinuate))
                                        ;Too many clock entries clutter up a heading.

(setq org-log-into-drawer "LOGBOOK")
(setq org-clock-into-drawer 1)
                                        ;Habits
                                        ;I like using org-habits to track consistency. My task names tend to be a bit long, though, so I've configured the graph column to show a little bit more to the right.

(setq org-habit-graph-column 80)
(setq org-habit-show-habits-only-for-today nil)
                                        ;If you want to use habits, be sure to schedule your tasks and add a STYLE property with the value of habit to the tasks you want displayed.

;;;;;;;;Estimating tasks
                                        ;From "Add an effort estimate on the fly when clocking in" on the Org Hacks page:

(add-hook 'org-clock-in-prepare-hook
          'my/org-mode-ask-effort)

(defun my/org-mode-ask-effort ()
  "Ask for an effort estimate when clocking in."
  (unless (org-entry-get (point) "Effort")
    (let ((effort
           (completing-read
            "Effort: "
            (org-entry-get-multivalued-property (point) "Effort"))))
      (unless (equal effort "")
        (org-set-property "Effort" effort)))))
                                        ;Modifying org agenda so that I can display a subset of tasks
                                        ;I want to create an agenda command that displays a list of tasks by context. That way, I can quickly preview a bunch of contexts and decide what I feel like doing the most.

(defvar my/org-agenda-limit-items nil "Number of items to show in agenda to-do views; nil if unlimited.")
(eval-after-load 'org
  '(defadvice org-agenda-finalize-entries (around sacha activate)
     (if my/org-agenda-limit-items
         (progn
           (setq list (mapcar 'org-agenda-highlight-todo list))
           (setq ad-return-value
                 (subseq list 0 my/org-agenda-limit-items))
           (when org-agenda-before-sorting-filter-function
             (setq list (delq nil (mapcar org-agenda-before-sorting-filter-function list))))
           (setq ad-return-value
                 (mapconcat 'identity
                            (delq nil
                                  (subseq
                                   (sort list 'org-entries-lessp)
                                   0
                                   my/org-agenda-limit-items))
                            "\n")))
       ad-do-it)))
                                        ;Flexible scheduling of tasks
                                        ;I (theoretically) want to be able to schedule tasks for dates like the first Saturday of every month. Fortunately, someone else has figured that out!

;; Get this from https://raw.github.com/chenfengyuan/elisp/master/next-spec-day.el
(load "~/elisp/next-spec-day.el" t)
                                        ;Task dependencies
(setq org-enforce-todo-dependencies t)
(setq org-track-ordered-property-with-tag t)
(setq org-agenda-dim-blocked-tasks t)

;;;;;;;;;;;;;;Templates
                                        ;Structure templates
                                        ;Org makes it easy to insert blocks by typing <s[TAB], etc. I hardly ever use LaTeX, but I insert a lot of Emacs Lisp blocks, so I redefine <l to insert a Lisp block instead.

(setq org-structure-template-alist
      '(("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
        ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
        ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
        ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE" "<verse>\n?\n</verse>")
        ("c" "#+BEGIN_COMMENT\n?\n#+END_COMMENT")
        ("p" "#+BEGIN_PRACTICE\n?\n#+END_PRACTICE")
        ("l" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>")
        ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
        ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
        ("H" "#+html: " "<literal style=\"html\">?</literal>")
        ("a" "#+begin_ascii\n?\n#+end_ascii")
        ("A" "#+ascii: ")
        ("i" "#+index: ?" "#+index: ?")
        ("I" "#+include %file ?" "<include file=%file markup=\"?\">")))
                                        ;This lets me nest quotes. http://emacs.stackexchange.com/questions/2404/exporting-org-mode-nested-blocks-to-html

(defun my/org-html-quote2 (block backend info)
  (when (org-export-derived-backend-p backend 'html)
    (when (string-match "\\`<div class=\"quote2\">" block)
      (setq block (replace-match "<blockquote>" t nil block))
      (string-match "</div>\n\\'" block)
      (setq block (replace-match "</blockquote>\n" t nil block))
      block)))
(eval-after-load 'ox
  '(add-to-list 'org-export-filter-special-block-functions 'my/org-html-quote2))
                                        ;Emacs chats, Emacs hangouts
(defun my/org-link-youtube-time (url beg end)
  "Link times of the form h:mm to YouTube video at URL.
Works on region defined by BEG and END."
  (interactive (list (read-string "URL: " (org-entry-get-with-inheritance "YOUTUBE")) (point) (mark)))
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ((char (if (string-match "\\?" url) "&" "?")))
        (while (re-search-forward "\\(\\([0-9]+\\):\\([0-9]+\\)\\(:\\([0-9]+\\)\\)?\\) ::" nil t)
          (replace-match
           (format "[[%s%st=%sh%sm%ss][%s]] "
                   url
                   char
                   (match-string 2)
                   (match-string 3)
                   (or (match-string 5) "0")
                   (match-string 1)) nil t))))))

(defun my/clean-up-google-hangout-chat ()
  (interactive)
  (save-excursion
    (while (re-search-forward "<hr.*?div class=\"Kc-Ma-m\".*?>" nil t)
      (replace-match "\n| ")))
  (save-excursion
    (while (re-search-forward "</div><div class=\"Kc-yi-m\">" nil t)
      (replace-match " | ")))
  (save-excursion
    (while (re-search-forward "</div></div><div class=\"Kc-ib\">" nil t)
      (replace-match " | ")))
  (save-excursion
    (while (re-search-forward "<a rel=\"nofollow\" target=\"_blank\" href=\"\\(.*?\\)\">\\(.*?\\)</a>" nil t)
      (replace-match "[[\\1][\\2]]")))
  (save-excursion
    (while (re-search-forward "</div></div></div></div>" nil t)
      (replace-match " |")))
  (save-excursion
    (while (re-search-forward "&nbsp;" nil t)
      (replace-match " ")))
  (save-excursion
    (while (re-search-forward "</div><div class=\"Kc-ib\">" nil t)
      (replace-match " ")))
  (save-excursion
    (while (re-search-forward "<img.*?>" nil t)
      (replace-match "")))
  (save-excursion
    (while (re-search-forward "<wbr>" nil t)
      (replace-match "")))
  )

;;;;;;;;;;Org agenda
;;Basic configuration
                                        ;I have quite a few Org files, but I keep my agenda items and TODOs in only a few of them them for faster scanning.

                                        ;(defvar my/kid-org-file nil "Defined in secrets")
(setq org-agenda-files (quote ("~/org_files"))) 
                                        ;(setq org-agenda-files
                                        ;      (delq nil
                                        ;            (mapcar (lambda (x) (and x (file-exists-p x) x))
                                        ;                    `("~/personal/organizer.org"
                                        ;                      "~/personal/sewing.org"
                                        ;                      "~/personal/people.org"
                                        ;                      "~/Dropbox/wsmef/trip.txt"
                                        ;                      ,my/kid-org-file
                                        ;                      "~/personal/business.org"
                                        ;                      "~/personal/calendar.org"
                                        ;                      "~/Dropbox/tasker/summary.txt"
                                        ;                      "~/Dropbox/public/sharing/index.org"
                                        ;                      "~/dropbox/public/sharing/learning.org"
                                        ;                      "~/code/emacs-notes/tasks.org"
                                        ;                      "~/sachac.github.io/evil-plans/index.org"
                                        ;                      "~/personal/cooking.org"
                                        ;                      "~/personal/routines.org"))))
                                        ;(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
                                        ;I like looking at two days at a time when I plan using the Org agenda. I want to see my log entries, but I don't want to see scheduled items that I've finished. I like seeing a time grid so that I can get a sense of how appointments are spread out.
(setq org-agenda-span 2)
(setq org-agenda-tags-column -100) ; take advantage of the screen width
(setq org-agenda-sticky nil)
(setq org-agenda-inhibit-startup t)
(setq org-agenda-use-tag-inheritance t)
(setq org-agenda-show-log t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
(setq org-agenda-time-grid
      '((daily today require-timed)
        "----------------"
        (800 1000 1200 1400 1600 1800)))
(setq org-columns-default-format "%14SCHEDULED %Effort{:} %1PRIORITY %TODO %50ITEM %TAGS")

                                        ;Some other keyboard shortcuts:
;(bind-key "Y" 'org-agenda-todo-yesterday org-agenda-mode-map)
                                        ;Starting my weeks on Saturday
                                        ;I like looking at weekends as week beginnings instead, so I want the Org agenda to start on Saturdays.

(setq org-agenda-start-on-weekday 6)
                                        ;Display projects with associated subtasks
                                        ;I wanted a view that showed projects with a few subtasks underneath them. Here's a sample of the output:

                                        ;Headlines with TAGS match: +PROJECT
                                        ;Press `C-u r' to search again with new search string
                                        ;  organizer:  Set up communication processes for Awesome Foundation Toronto
                                        ;  organizer:  TODO Announce the next pitch night
                                        ;  organizer:  TODO Follow up with the winner of the previous pitch night for any news to include in the updates
                                        ;
                                        ;  organizer:  Tidy up the house so that I can find things quickly
                                        ;  organizer:  TODO Inventory all the things in closets and boxes         :@home:
                                        ;  organizer:  TODO Drop things off for donation                       :@errands:
                                        ;
                                        ;  organizer:  Learn how to develop for Android devices
(defun my/org-agenda-project-agenda ()
  "Return the project headline and up to `my/org-agenda-limit-items' tasks."
  (save-excursion
    (let* ((marker (org-agenda-new-marker))
           (heading
            (org-agenda-format-item "" (org-get-heading) (org-get-category) nil))
           (org-agenda-restrict t)
           (org-agenda-restrict-begin (point))
           (org-agenda-restrict-end (org-end-of-subtree 'invisible))
           ;; Find the TODO items in this subtree
           (list (org-agenda-get-day-entries (buffer-file-name) (calendar-current-date) :todo)))
      (org-add-props heading
          (list 'face 'defaults
                'done-face 'org-agenda-done
                'undone-face 'default
                'mouse-face 'highlight
                'org-not-done-regexp org-not-done-regexp
                'org-todo-regexp org-todo-regexp
                'org-complex-heading-regexp org-complex-heading-regexp
                'help-echo
                (format "mouse-2 or RET jump to org file %s"
                        (abbreviate-file-name
                         (or (buffer-file-name (buffer-base-buffer))
                             (buffer-name (buffer-base-buffer))))))
        'org-marker marker
        'org-hd-marker marker
        'org-category (org-get-category)
        'type "tagsmatch")
      (concat heading "\n"
              (org-agenda-finalize-entries list)))))

(defun my/org-agenda-projects-and-tasks (match)
  "Show TODOs for all `org-agenda-files' headlines matching MATCH."
  (interactive "MString: ")
  (let ((todo-only nil))
    (if org-agenda-overriding-arguments
        (setq todo-only (car org-agenda-overriding-arguments)
              match (nth 1 org-agenda-overriding-arguments)))
    (let* ((org-tags-match-list-sublevels
            org-tags-match-list-sublevels)
           (completion-ignore-case t)
           rtn rtnall files file pos matcher
           buffer)
      (when (and (stringp match) (not (string-match "\\S-" match)))
        (setq match nil))
      (when match
        (setq matcher (org-make-tags-matcher match)
              match (car matcher) matcher (cdr matcher)))
      (catch 'exit
        (if org-agenda-sticky
            (setq org-agenda-buffer-name
                  (if (stringp match)
                      (format "*Org Agenda(%s:%s)*"
                              (or org-keys (or (and todo-only "M") "m")) match)
                    (format "*Org Agenda(%s)*" (or (and todo-only "M") "m")))))
        (org-agenda-prepare (concat "TAGS " match))
        (org-compile-prefix-format 'tags)
        (org-set-sorting-strategy 'tags)
        (setq org-agenda-query-string match)
        (setq org-agenda-redo-command
              (list 'org-tags-view `(quote ,todo-only)
                    (list 'if 'current-prefix-arg nil `(quote ,org-agenda-query-string))))
        (setq files (org-agenda-files nil 'ifmode)
              rtnall nil)
        (while (setq file (pop files))
          (catch 'nextfile
            (org-check-agenda-file file)
            (setq buffer (if (file-exists-p file)
                             (org-get-agenda-file-buffer file)
                           (error "No such file %s" file)))
            (if (not buffer)
                ;; If file does not exist, error message to agenda
                (setq rtn (list
                           (format "ORG-AGENDA-ERROR: No such org-file %s" file))
                      rtnall (append rtnall rtn))
              (with-current-buffer buffer
                (unless (derived-mode-p 'org-mode)
                  (error "Agenda file %s is not in `org-mode'" file))
                (save-excursion
                  (save-restriction
                    (if org-agenda-restrict
                        (narrow-to-region org-agenda-restrict-begin
                                          org-agenda-restrict-end)
                      (widen))
                    (setq rtn (org-scan-tags 'my/org-agenda-project-agenda matcher todo-only))
                    (setq rtnall (append rtnall rtn))))))))
        (if org-agenda-overriding-header
            (insert (org-add-props (copy-sequence org-agenda-overriding-header)
                        nil 'face 'org-agenda-structure) "\n")
          (insert "Headlines with TAGS match: ")
          (add-text-properties (point-min) (1- (point))
                               (list 'face 'org-agenda-structure
                                     'short-heading
                                     (concat "Match: " match)))
          (setq pos (point))
          (insert match "\n")
          (add-text-properties pos (1- (point)) (list 'face 'org-warning))
          (setq pos (point))
          (unless org-agenda-multi
            (insert "Press `C-u r' to search again with new search string\n"))
          (add-text-properties pos (1- (point)) (list 'face 'org-agenda-structure)))
        (org-agenda-mark-header-line (point-min))
        (when rtnall
          (insert (mapconcat 'identity rtnall "\n") ""))
        (goto-char (point-min))
        (or org-agenda-multi (org-agenda-fit-window-to-buffer))
        (add-text-properties (point-min) (point-max)
                             `(org-agenda-type tags
                                               org-last-args (,todo-only ,match)
                                               org-redo-cmd ,org-agenda-redo-command
                                               org-series-cmd ,org-cmd))
        (org-agenda-finalize)
        (setq buffer-read-only t)))))


;;;;;;;;Org agenda custom commands
                                        ;
                                        ;   There are quite a few custom commands here, and I often forget to use them. =) But it's good to define them, and over time, I'll get the hang of using these more!
                                        ;   
                                        ;   Key	Description
                                        ;   .	What am I waiting for?
                                        ;   T	Not really an agenda command - shows the to-do tree in the current file
                                        ;   b	Shows business-related tasks
                                        ;   o	Shows personal tasks and miscellaneous tasks (o: organizer)
                                        ;   w	Show all tasks for the upcoming week
                                        ;   W	Show all tasks for the upcoming week, aside from the routine ones
                                        ;   g …	Show tasks by context: b - business; c - coding; w - writing; p - phone; d - drawing, h - home
                                        ;   0	Show common contexts with up to 3 tasks each, so that I can choose what I feel like working on
                                        ;   ) (shift-0)	Show common contexts with all the tasks associated with them
                                        ;   9	Show common contexts with up to 3 unscheduled tasks each
                                        ;   ( (shift-9)	Show common contexts with all the unscheduled tasks associated with them
                                        ;   d	Timeline for today (agenda, clock summary)
                                        ;   u	Unscheduled tasks to do if I have free time
                                        ;   U	Unscheduled tasks that are not part of projects
                                        ;   P	Tasks by priority
                                        ;   p	My projects
                                        ;   2	Projects with tasks
(defvar my/org-agenda-contexts
  '((tags-todo "+@phone")
    (tags-todo "+@work")
    (tags-todo "+@drawing")
    (tags-todo "+@coding")
    (tags-todo "+@writing")
    (tags-todo "+@computer")
    (tags-todo "+@home")
    (tags-todo "+@errands"))
  "Usual list of contexts.")
(defun my/org-agenda-skip-scheduled ()
  (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "\n]+>"))
(setq org-agenda-custom-commands
      `(("t" tags-todo "-cooking"
         ((org-agenda-sorting-strategy '(todo-state-up priority-down effort-up))))
        ("T" tags-todo "TODO=\"TODO\"-goal-routine-cooking-SCHEDULED={.+}" nil "~/cloud/agenda/nonroutine.html")
        ("f" tags-todo "fuzzy-TODO=\"DONE\"-TODO=\"CANCELLED\"")
        ("F" tags-todo "highenergy-TODO=\"DONE\"-TODO=\"CANCELLED\"")
        ("b" todo ""
         ((org-agenda-files '("~/personal/business.org"))))
        ("B" todo ""
         ((org-agenda-files '("~/Dropbox/books"))))
        ("o" todo ""
         ((org-agenda-files '("~/personal/organizer.org"))))
        ("c" todo ""
         ((org-agenda-prefix-format "")
          (org-agenda-cmp-user-defined 'my/org-sort-agenda-items-todo)
          (org-agenda-view-columns-initially t)
          ))
        ;; Weekly review
        ("w" "Weekly review" agenda ""
         ((org-agenda-span 7)
          (org-agenda-log-mode 1)) "~/org_files/Weekly/this-week.html")
        ("W" "Weekly review sans routines" agenda ""
         ((org-agenda-span 7)
          (org-agenda-log-mode 1)
          (org-agenda-tag-filter-preset '("-routine"))) "~/org_files/Weekly/this-week-nonroutine.html")
        ("2" "Bi-weekly review" agenda "" ((org-agenda-span 14) (org-agenda-log-mode 1)))
        ("5" "Quick tasks" tags-todo "EFFORT>=\"0:05\"&EFFORT<=\"0:15\"")
        ("0" "Unestimated tasks" tags-todo "EFFORT=\"\"")
        ("gb" "Business" todo ""
         ((org-agenda-files '("~/personal/business.org"))
          (org-agenda-view-columns-initially t)))
        ("gc" "Coding" tags-todo "@coding"
         ((org-agenda-view-columns-initially t)))
        ("gw" "Writing" tags-todo "@writing"
         ((org-agenda-view-columns-initially t)))
        ("gp" "Phone" tags-todo "@phone"
         ((org-agenda-view-columns-initially t)))
        ("gd" "Drawing" tags-todo "@drawing"
         ((org-agenda-view-columns-initially t)))
        ("gh" "Home" tags-todo "@home"
         ((org-agenda-view-columns-initially t)))
        ("gk" "Kaizen" tags-todo "kaizen"
         ((org-agenda-view-columns-initially t))
         )
        ("ge" "Errands" tags-todo "@errands"
         ((org-agenda-view-columns-initially t))
         )
        ("0" "Top 3 by context"
         ,my/org-agenda-contexts
         ((org-agenda-sorting-strategy '(priority-up effort-down))
          (my/org-agenda-limit-items 3)))
        (")" "All by context"
         ,my/org-agenda-contexts
         ((org-agenda-sorting-strategy '(priority-down effort-down))
          (my/org-agenda-limit-items nil)))
        ("9" "Unscheduled top 3 by context"
         ,my/org-agenda-contexts
         ((org-agenda-skip-function 'my/org-agenda-skip-scheduled)
          (org-agenda-sorting-strategy '(priority-down effort-down))
          (my/org-agenda-limit-items 3)))
        ("(" "All unscheduled by context"
         ,my/org-agenda-contexts
         ((org-agenda-skip-function 'my/org-agenda-skip-scheduled)
          (org-agenda-sorting-strategy '(priority-down effort-down))
          ))
        ("d" "Timeline for today" ((agenda "" ))
         ((org-agenda-ndays 1)
          (org-agenda-show-log t)
          (org-agenda-log-mode-items '(clock closed))
          (org-agenda-clockreport-mode t)
          (org-agenda-entry-types '())))
        ("." "Waiting for" todo "WAITING")
        ("u" "Unscheduled tasks" tags-todo "-someday-TODO=\"SOMEDAY\"-TODO=\"DELEGATED\"-TODO=\"WAITING\"-project"
         ((org-agenda-skip-function 'my/org-agenda-skip-scheduled)
          (org-agenda-view-columns-initially t)
          (org-tags-exclude-from-inheritance '("project"))
          (org-agenda-overriding-header "Unscheduled TODO entries: ")
          (org-columns-default-format "%50ITEM %TODO %3PRIORITY %Effort{:} %TAGS")
          (org-agenda-sorting-strategy '(todo-state-up priority-down effort-up tag-up category-keep))))
        ("U" "Unscheduled tasks outside projects" tags-todo "-project"
         ((org-agenda-skip-function 'my/org-agenda-skip-scheduled)
          (org-tags-exclude-from-inheritance nil)
          (org-agenda-view-columns-initially t)
          (org-agenda-overriding-header "Unscheduled TODO entries outside projects: ")
          (org-agenda-sorting-strategy '(todo-state-up priority-down tag-up category-keep effort-down))))
        ("P" "By priority"
         ((tags-todo "+PRIORITY=\"A\"")
          (tags-todo "+PRIORITY=\"B\"")
          (tags-todo "+PRIORITY=\"\"")
          (tags-todo "+PRIORITY=\"C\""))
         ((org-agenda-prefix-format "%-10c %-10T %e ")
          (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))
        ("pp" tags "+project-someday-TODO=\"DONE\"-TODO=\"SOMEDAY\"-inactive"
         ((org-tags-exclude-from-inheritance '("project"))
          (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))
        ("p." tags "+project-TODO=\"DONE\""
         ((org-tags-exclude-from-inheritance '("project"))
          (org-agenda-sorting-strategy '(priority-down tag-up category-keep effort-down))))
        ("S" tags-todo "TODO=\"STARTED\"")
        ("C" "Cooking"
         ((tags "vegetables")
          (tags "chicken")
          (tags "beef")
          (tags "pork")
          (tags "other"))
         ((org-agenda-files '("~/personal/cooking.org"))
          (org-agenda-view-columns-initially t)
          (org-agenda-sorting-strategy '(scheduled-up time-down todo-state-up)))
         )
        ("2" "List projects with tasks" my/org-agenda-projects-and-tasks
         "+PROJECT"
         ((my/org-agenda-limit-items 3)))))
(bind-key "<apps> a" 'org-agenda)


;;;;;;;;;;;;;;;;;;Make it easy to mark a task as done
                                        ;Great for quickly going through the to-do list. Gets rid of one extra keystroke. ;)
(defun my/org-agenda-done (&optional arg)
  "Mark current TODO as done.
This changes the line at point, all other lines in the agenda referring to
the same tree node, and the headline of the tree node in the Org-mode file."
  (interactive "P")
  (org-agenda-todo "DONE"))
;; Override the key definition for org-exit
;(define-key org-agenda-mode-map "x" 'my/org-agenda-done)

                                        ;Make it easy to mark a task as done and create a follow-up task
(defun my/org-agenda-mark-done-and-add-followup ()
  "Mark the current TODO as done and add another task after it.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
  (interactive)
  (org-agenda-todo "DONE")
  (org-agenda-switch-to)
  (org-capture 0 "t"))
;; Override the key definition
;(define-key org-agenda-mode-map "X" 'my/org-agenda-mark-done-and-add-followup)

                                        ;Capture something based on the agenda
(defun my/org-agenda-new ()
  "Create a new note or task at the current agenda item.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
  (interactive)
  (org-agenda-switch-to)
  (org-capture 0))
;; New key assignment
;(define-key org-agenda-mode-map "N" 'my/org-agenda-new)

                                        ;Sorting by date and priority
(setq org-agenda-sorting-strategy
      '((agenda time-up priority-down tag-up category-keep effort-up)
        ;; (todo user-defined-up todo-state-up priority-down effort-up)
        (todo todo-state-up priority-down effort-up) 
        (tags user-defined-up)
        (search category-keep)))
(setq org-agenda-cmp-user-defined 'my/org-sort-agenda-items-user-defined)
(require 'cl)
(defun my/org-get-context (txt)
  "Find the context."
  (car (member-if
        (lambda (item) (string-match "@" item))
        (get-text-property 1 'tags txt))))

(defun my/org-compare-dates (a b)
  "Return 1 if A should go after B, -1 if B should go after A, or 0 if a = b."
  (cond
   ((and (= a 0) (= b 0)) nil)
   ((= a 0) 1)
   ((= b 0) -1)
   ((> a b) 1)
   ((< a b) -1)
   (t nil)))

(defun my/org-complete-cmp (a b)
  (let* ((state-a (or (get-text-property 1 'todo-state a) ""))
         (state-b (or (get-text-property 1 'todo-state b) "")))
    (or
     (if (member state-a org-done-keywords-for-agenda) 1)
     (if (member state-b org-done-keywords-for-agenda) -1))))

(defun my/org-date-cmp (a b)
  (let* ((sched-a (or (get-text-property 1 'org-scheduled a) 0))
         (sched-b (or (get-text-property 1 'org-scheduled b) 0))
         (deadline-a (or (get-text-property 1 'org-deadline a) 0))
         (deadline-b (or (get-text-property 1 'org-deadline b) 0)))
    (or
     (my/org-compare-dates
      (my/org-min-date sched-a deadline-a)
      (my/org-min-date sched-b deadline-b)))))

(defun my/org-min-date (a b)
  "Return the smaller of A or B, except for 0."
  (funcall (if (and (> a 0) (> b 0)) 'min 'max) a b))

(defun my/org-sort-agenda-items-user-defined (a b)
  ;; compare by deadline, then scheduled date; done tasks are listed at the very bottom
  (or
   (my/org-complete-cmp a b)
   (my/org-date-cmp a b)))

(defun my/org-context-cmp (a b)
  "Compare CONTEXT-A and CONTEXT-B."
  (let ((context-a (my/org-get-context a))
        (context-b (my/org-get-context b)))
    (cond
     ((null context-a) +1)
     ((null context-b) -1)
     ((string< context-a context-b) -1)
     ((string< context-b context-a) +1)
     (t nil))))

(defun my/org-sort-agenda-items-todo (a b)
  (or
   (org-cmp-time a b)
   (my/org-complete-cmp a b)
   (my/org-context-cmp a b)
   (my/org-date-cmp a b)
   (org-cmp-todo-state a b)
   (org-cmp-priority a b)
   (org-cmp-effort a b)))

                                        ;Preventing things from falling through the cracks
                                        ;This helps me keep track of unscheduled tasks, because I sometimes forget to assign tasks a date. I also want to keep track of stuck projects.

(defun my/org-agenda-list-unscheduled (&rest ignore)
  "Create agenda view for tasks that are unscheduled and not done."
  (let* ((org-agenda-todo-ignore-with-date t)
         (org-agenda-overriding-header "List of unscheduled tasks: "))
    (org-agenda-get-todos)))
(setq org-stuck-projects
      '("+PROJECT-MAYBE-DONE"
        ("TODO")
        nil
        "\\<IGNORE\\>"))

                                        ; ;;;;;;;;Synchronizing with Google Calendar
                                        ; (defun my/org-gcal-notify (title mes)
                                        ;   (message "%s - %s" title mes))
                                        ; (use-package org-gcal
                                        ;   :load-path "~/elisp/org-gcal.el"
                                        ;   :init (fset 'org-gcal-notify 'my/org-gcal-notify))

;;;;;;;;;;Projects
(defun my/org-show-active-projects ()
  "Show my current projects."
  (interactive)
  (org-tags-view nil "project-inactive-someday"))


;;;;;;;;;;;;;Reviews
;;Weekly review
;I regularly post weekly reviews to keep track of what I'm done, remind me to plan for the upcoming week, and list blog posts, sketches, and links. I want to try out grouping tasks by topic first, then breaking it down into previous/next week.

(defvar my/weekly-review-line-regexp
  "^  \\([^:]+\\): +\\(Sched[^:]+: +\\)?TODO \\(.*?\\)\\(?:[      ]+\\(:[[:alnum:]_@#%:]+:\\)\\)?[        ]*$"
  "Regular expression matching lines to include.")
(defvar my/weekly-done-line-regexp
  "^  \\([^:]+\\): +.*?\\(?:Clocked\\|Closed\\):.*?\\(TODO\\|DONE\\) \\(.*?\\)\\(?:[       ]+\\(:[[:alnum:]_@#%:]+:\\)\\)?[        ]*$"
  "Regular expression matching lines to include as completed tasks.")

(defun my/quantified-get-hours (category time-summary)
  "Return the number of hours based on the time summary."
  (if (stringp category)
      (if (assoc category time-summary) (/ (cdr (assoc category time-summary)) 3600.0) 0)
    (apply '+ (mapcar (lambda (x) (my/quantified-get-hours x time-summary)) category))))

(defun _my/extract-tasks-from-agenda (string matchers prefix line-re)
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (while (re-search-forward line-re nil t)
      (let ((temp-list matchers))
        (while temp-list
          (if (save-match-data
                (string-match (car (car temp-list)) (match-string 1)))
              (progn
                (add-to-list (cdr (car temp-list)) (concat prefix (match-string 3)) t)
                (setq temp-list nil)))
          (setq temp-list (cdr temp-list)))))))

(ert-deftest _my/extract-tasks-from-agenda ()
  (let (list-a list-b (line-re "\\([^:]+\\):\\( \\)\\(.*\\)"))
    (_my/extract-tasks-from-agenda
     "listA: Task 1\nother: Task 2\nlistA: Task 3"
     '(("listA" . list-a)
       ("." . list-b))
     "- [ ] "
     line-re)
    (should (equal list-a '("- [ ] Task 1" "- [ ] Task 3")))
    (should (equal list-b '("- [ ] Task 2")))))

(defun _my/get-upcoming-tasks ()
  (save-window-excursion
    (org-agenda nil "W")
    (_my/extract-tasks-from-agenda (buffer-string)
                                   '(("routines" . ignore)
                                     ("business" . business-next)
                                     ("people" . relationships-next)
                                     ("tasks" . emacs-next)
                                     ("." . life-next))
                                   "  - [ ] "
                                   my/weekly-review-line-regexp)))
(defun _my/get-previous-tasks ()
  (let (string)
    (save-window-excursion
      (org-agenda nil "W")
      (org-agenda-later -1)
      (org-agenda-log-mode 16)
      (setq string (buffer-string))
      ;; Get any completed tasks from the current week as well
      (org-agenda-later 1)
      (org-agenda-log-mode 16)
      (setq string (concat string "\n" (buffer-string)))
      (_my/extract-tasks-from-agenda string
                                     '(("routines" . ignore)
                                       ("business" . business)
                                       ("people" . relationships)
                                       ("tasks" . emacs)
                                       ("." . life))
                                     "  - [X] "
                                     my/weekly-done-line-regexp))))

(defun my/org-summarize-focus-areas (date)
  "Summarize previous and upcoming tasks as a list."
  (interactive (list (org-read-date-analyze (if current-prefix-arg (org-read-date) "-fri") nil '(0 0 0))))
  (let (business relationships life business-next relationships-next life-next string emacs emacs-next
                 start end time-summary biz-time ignore base-date)
    (setq base-date (apply 'encode-time date))
    (setq start (format-time-string "%Y-%m-%d" (days-to-time (- (time-to-number-of-days base-date) 6))))
    (setq end (format-time-string "%Y-%m-%d" (days-to-time (1+ (time-to-number-of-days base-date)))))
    (setq time-summary (quantified-summarize-time start end))
    (setq biz-time (my/quantified-get-hours "Business" time-summary))
    (_my/get-upcoming-tasks)
    (_my/get-previous-tasks)
    (setq string
          (concat
           (format "- *A- (Childcare)* (%.1fh - %d%% of total)\n"
                   (my/quantified-get-hours '("A-") time-summary)
                   (/ (my/quantified-get-hours '("A-") time-summary) 1.68))
           (format "- *Business* (%.1fh - %d%%)\n" biz-time (/ biz-time 1.68))
           (mapconcat 'identity business "\n") "\n"
           (mapconcat 'identity business-next "\n")
           "\n"
           (format "  - *Earn* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Earn" time-summary)
                   (/ (my/quantified-get-hours "Business - Earn" time-summary) (* 0.01 biz-time)))
           (format "  - *Build* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Build" time-summary)
                   (/ (my/quantified-get-hours "Business - Build" time-summary) (* 0.01 biz-time)))
           (format "  - *Connect* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Connect" time-summary)
                   (/ (my/quantified-get-hours "Business - Connect" time-summary) (* 0.01 biz-time)))
           (format "- *Relationships* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours '("Discretionary - Social"
                                              "Discretionary - Family") time-summary)
                   (/ (my/quantified-get-hours '("Discretionary - Social"
                                                 "Discretionary - Family") time-summary) 1.68))
           (mapconcat 'identity relationships "\n") "\n"
           (mapconcat 'identity relationships-next "\n") "\n"
           "\n"
           (format "- *Discretionary - Productive* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Discretionary - Productive" time-summary)
                   (/ (my/quantified-get-hours "Discretionary - Productive" time-summary) 1.68))
           (format "  - *Drawing* (%.1fh)\n"
                   (my/quantified-get-hours '("Discretionary - Productive - Drawing")  time-summary))
           (format "  - *Emacs* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Emacs" time-summary))
           (mapconcat 'identity emacs "\n") "\n"
           (mapconcat 'identity emacs-next "\n") "\n"
           (format "  - *Coding* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Coding" time-summary))
           (mapconcat 'identity life "\n") "\n"
           (mapconcat 'identity life-next "\n") "\n"
           (format "  - *Sewing* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Sewing" time-summary))
           (format "  - *Writing* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Writing" time-summary))
           (format "- *Discretionary - Play* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Discretionary - Play" time-summary)
                   (/ (my/quantified-get-hours "Discretionary - Play" time-summary) 1.68))
           (format "- *Personal routines* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Personal" time-summary)
                   (/ (my/quantified-get-hours "Personal" time-summary) 1.68))
           (format "- *Unpaid work* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Unpaid work" time-summary)
                   (/ (my/quantified-get-hours "Unpaid work" time-summary) 1.68))
           (format "- *Sleep* (%.1fh - %d%% - average of %.1f per day)\n"
                   (my/quantified-get-hours "Sleep" time-summary)
                   (/ (my/quantified-get-hours "Sleep" time-summary) 1.68)
                   (/ (my/quantified-get-hours "Sleep" time-summary) 7)
                   )))
    (if (called-interactively-p 'any)
        (insert string)
      string)))
                                        ;I use this to put together a quick summary of how I spent my time.
                                        ;The following code makes it easy to add a line:

(defun my/org-add-line-item-task (task)
  (interactive "MTask: ")
  (org-insert-heading)
  (insert "[ ] " task)
  (let ((org-capture-entry '("t" "Tasks" entry
                             (file+headline "~/personal/organizer.org" "Tasks")
                             "")))
    (org-capture nil "t")
    (insert "TODO " task "\nSCHEDULED: <" (org-read-date) ">")))
                                        ;(define-key org-mode-map (kbd "C-c t") 'my/org-add-line-item-task)
                                        ;Now we put it all together…

(defun my/org-prepare-weekly-review (&optional date skip-urls)
  "Prepare weekly review template."
  (interactive (list (org-read-date-analyze (if current-prefix-arg (org-read-date) "-fri") nil '(0 0 0))))
  (let ((base-date (apply 'encode-time date))
        start end links)
    (setq start (format-time-string "%Y-%m-%d" (days-to-time (- (time-to-number-of-days base-date) 6))))
    (setq end (format-time-string "%Y-%m-%d" (days-to-time (1+ (time-to-number-of-days base-date)))))
    (outline-next-heading)
    (insert
     "*** Weekly review: Week ending " (format-time-string "%B %e, %Y" base-date) "  :weekly:\n"
     ;"*Blog posts*\n\n"
     ;"*Sketches*\n\n"
     ;(my/sketches-export-and-extract start end) "\n"
     ;"\n\n*Focus areas and time review*\n\n"
     (my/org-summarize-focus-areas date)
     "\n")))

;;;      ;;;;Flickr extract
;;;        (defun _my/clean-up-flickr-list (list)
;;;          (setq list
;;;                (replace-regexp-in-string "\\[\"" "[" list))
;;;          (setq list
;;;                (replace-regexp-in-string "<a href=\"\"\\([^\"]+\\).*?>.*?</a>"
;;;                                          "[[\\1][\\2]]" list))
;;;          (setq list
;;;                (replace-regexp-in-string "\"
;;;      " "" (replace-regexp-in-string "\"\\]" "]" list))))
;;;      
;;;        (defun _my/format-flickr-link-for-org (x)
;;;          (let ((title (assoc-default "FileName" x)))
;;;            (format
;;;             "- [[%s][%s]] %s"
;;;             (assoc-default "URL" x)
;;;             title
;;;             (if (string= (assoc-default "Description" x) "")
;;;                 ""
;;;               (concat "- "
;;;                       (replace-regexp-in-string
;;;                        "<a href=\"\"\\(.*?\\)\"\".*?>\\(.*?\\)</a>"
;;;                        "[[\\1][\\2]]"
;;;                        (assoc-default "Description" x)))))))
;;;      
;;;      
;;;        (defun _my/parse-and-filter-flickr-csv-buffer (start end)
;;;          (sort
;;;           (delq nil
;;;                 (mapcar (lambda (x)
;;;                           (if (and (string< (assoc-default "FileName" x) end)
;;;                                    (org-string<= start (assoc-default "FileName" x)))
;;;                               x))
;;;                         (csv-parse-buffer t)))
;;;           (lambda (a b)
;;;             (string< (assoc-default "FileName" a)
;;;                      (assoc-default "FileName" b)))))
;;;      
;;;      
;;;        (defun my/sketches-export-and-extract (start end &optional do-insert update-db filter)
;;;          "Create a list of links to sketches."
;;;          (interactive (list (org-read-date) (org-read-date) t current-prefix-arg (read-string "Filter: ")))
;;;          (let ((value
;;;                 (cond
;;;                  ((eq system-type 'windows-nt)
;;;                   (when update-db (shell-command "c:/sacha/dropbox/bin/flickr.bat"))
;;;                   (my/flickr-extract-links-for-review "c:/sacha/dropbox/bin/flickr_metadata.csv" start end))
;;;                  ((eq system-type 'gnu/linux)  ; Flickr
;;;                   (shell-command-to-string
;;;                   (format "cd /home/sacha/code/node; nodejs flickr-list.js -b \"%s\" -e \"%s\" -f \"%s\"" 
;;;                    (or start "") (or end "") (or filter ""))))
;;;                  ;; below method not used at the moment, but useful if flickr is being weird
;;;                  ((and t (eq system-type 'gnu/linux)) ;; Create links to sketches.sachachua.com/URL-encoded; not used at the moment
;;;                   ;; because Org does weird things with escaped # links
;;;                   (mapconcat
;;;                    (lambda (filename)
;;;                      (format "- [[http://sketches.sachachua.com/%s][%s]]\n"
;;;                              (browse-url-url-encode-chars (file-name-nondirectory filename) "[ #]")
;;;                              (file-name-base filename)))
;;;                    (let ((my/sketch-directories '("~/sketches"))) (my/get-index-card-filenames-between-dates start end))
;;;                    ""))
;;;                  )
;;;                 ))
;;;            (if do-insert
;;;                (insert value)
;;;              value)))
;;;      
;;;      ;; (my/sketches-export-and-extract "2015-11-01" "2015-12-01")
;;;      
;;;        (defun my/flickr-extract-links-for-review (filename start end)
;;;        "Extract Flickr titles and URLs from FILENAME from START to END.
;;;        The file should be a CSV downloaded by the Flickr metadata downloader.
;;;               Start date and end date should be strings in the form yyyy-mm-dd."
;;;          (require 'csv)
;;;          (let (list)
;;;            (with-temp-buffer
;;;              (insert-file-contents filename)
;;;              (goto-char (point-min))
;;;              (setq list
;;;                    (mapconcat
;;;                     '_my/format-flickr-link-for-org
;;;                     (_my/parse-and-filter-flickr-csv-buffer start end)
;;;                     "\n"))
;;;              (setq list (_my/clean-up-flickr-list list))
;;;              (if (called-interactively-p 'any)
;;;                  (insert list)
;;;                list))))

;;;;;;;;;Link-related convenience functions
;;;      (defun kensanata/resolve-redirect (url)
;;;        "Resolve shortened URL by launching `curl --head' and parsing the result."
;;;        (let* ((curl (shell-command-to-string
;;;                      (format "curl --silent --head %s" url)))
;;;               (location (when (and (string-match "^HTTP/1\.1 301" curl)
;;;                                    (string-match "^Location: \\(.*\\)" curl))
;;;                           (match-string 1 curl))))
;;;          (or location url)))
;;;      
;;;      (defun my/resolve-urls-in-region (beg end)
;;;        "Expand URLs between BEG and END."
;;;        (interactive "r")
;;;        (save-excursion
;;;          (save-restriction
;;;            (narrow-to-region beg end)
;;;            (goto-char (point-min))
;;;            (while (re-search-forward org-bracket-link-regexp nil t)
;;;              (replace-match (save-match-data (kensanata/resolve-redirect
;;;                                               (match-string 1))) t t nil 1))
;;;            (goto-char (point-min))
;;;            (while (re-search-forward org-link-re-with-space nil t)
;;;              (replace-match (save-match-data (kensanata/resolve-redirect
;;;                                               (match-string 0))) t t nil)))))
;;;      
;;;      (defun my/open-urls-in-region (beg end)
;;;        "Open URLs between BEG and END.
;;;      TODO: Get better at detecting and opening all URLs"
;;;        (interactive "r")
;;;        (save-excursion
;;;          (save-restriction
;;;            (narrow-to-region beg end)
;;;            (goto-char (point-min))
;;;            (while (re-search-forward org-any-link-re nil t)
;;;              (save-excursion
;;;                (backward-char)
;;;                (org-open-at-point))))))

;;;Evernote-related extract
;;;(defun my/evernote-export-and-extract (start-date end-date)
;;;  "Extract notes created on or after START-DATE and before END-DATE."
;;;  (let ((filename "c:/sacha/tmp/Evernote.enex"))
;;;    (call-process
;;;     "c:/Program Files (x86)/Evernote/Evernote/enscript.exe"
;;;     nil t t
;;;     "exportNotes"
;;;     "/q" (concat
;;;           " tag:roundup"
;;;           " created:" (replace-regexp-in-string "-" "" start-date)
;;;           " -created:" (replace-regexp-in-string "-" "" end-date))
;;;     "/f" filename)
;;;    (my/evernote-extract-links-for-review filename)))
;;;
;;;(defun my/evernote-extract-links-for-review (filename)
;;;  "Extract note names and URLs from FILENAME.
;;;     The file should be an ENEX export."
;;;  (interactive (list (read-file-name "File: ")
;;;                     (org-read-date)
;;;                     (org-read-date)))
;;;  (let (list)
;;;    (with-temp-buffer
;;;      (insert-file-contents filename)
;;;      (goto-char (point-min))
;;;      (while (re-search-forward "<title>\\(.+?\\)</title>\\(.*?\n\\)*?via Diigo.*?href=\"\\(.*?\\)\"" nil t)
;;;        (setq list
;;;              (cons
;;;               (cons
;;;                (match-string-no-properties 1)
;;;                (match-string-no-properties 3)) list))))
;;;    (setq list
;;;          (mapconcat (lambda (x)
;;;                       (concat "- [["
;;;                               (kensanata/resolve-redirect (cdr x))
;;;                               "][" (car x) "]]: ")) list "\n"))
;;;          (if (called-interactively-p 'any)
;;;              (insert list)
;;;            list)))
;;; 
;;; For copying journal entries
;;; 
;;;   (defun my/evernote-export-and-extract-journal ()
;;;     "Extract and file journal entries."
;;;     (interactive)
;;;     (let ((filename "c:\\sacha\\tmp\\journal.enex")
;;;           (journal-file "~/personal/journal.org"))
;;;       (call-process
;;;        "c:/Program Files (x86)/Evernote/Evernote/enscript.exe"
;;;        nil t t
;;;        "exportNotes"
;;;        "/q" (concat
;;;              " notebook:!Inbox"
;;;              " intitle:Journal")
;;;        "/f" filename)
;;;       (my/evernote-process-journal-entries filename journal-file)))
;;; 
;;;   (defun my/evernote-process-journal-entries (filename journal-file)
;;;     "Insert all the journal entries if they do not yet exist."
;;;     (let ((data (car (xml-parse-file filename))))
;;;       (mapc (lambda (x)
;;;               (if (and  (listp x) (equal (car x) 'note))
;;;                   (my/evernote-create-journal-note x journal-file)))
;;;             data)))
;;; 
;;;   (defun my/evernote-get-creation-date (note)
;;;     "Return NOTE's created date as (month day year)."
;;;     (let ((created (cadr (assoc-default 'created note))))
;;;       (list (string-to-number (substring created 4 6)) ; month
;;;             (string-to-number (substring created 6 8)) ; day
;;;             (string-to-number (substring created 0 4))))) ; year
;;; 
;;; (defun my/evernote-create-journal-note (note journal-file)
;;;   "Save the given NOTE to the JOURNAL-FILE."
;;;   (with-current-buffer (find-file journal-file)
;;;     (org-datetree-find-date-create (my/evernote-get-creation-date note))
;;;     (forward-line 1)
;;;     (when (org-at-heading-p) (save-excursion (insert "\n")))
;;;     (let ((content (my/evernote-convert-content-to-org note)))
;;;       (unless (save-excursion
;;;                 (re-search-forward (regexp-quote content)
;;;                 (max (point) (save-excursion (org-end-of-subtree t))) t))
;;;         (insert content)))))
;;; 
;;; (defun my/evernote-convert-content-to-org (note)
;;;   "Convert Evernote content for NOTE to HTML"
;;;   (with-temp-buffer
;;;     (insert (cadr (assoc-default 'content note)))
;;;     (goto-char (point-min))
;;;     (while (re-search-forward "div>" nil t)
;;;       (replace-match "p>"))
;;;     (shell-command-on-region (point-min) (point-max) "pandoc -f html -t org" nil t)
;;;     (goto-char (point-min))
;;;     (while (re-search-forward "^\\\\+" nil t)
;;;      (replace-match ""))
;;;     (goto-char (point-min))
;;;     (while (re-search-forward "\\\\+$" nil t)
;;;      (replace-match ""))
;;;     (goto-char (point-min))
;;;     (while (re-search-forward "\n\n\n+" nil t)
;;;      (replace-match "\n\n"))
;;;     (s-trim (buffer-string))))



;;;;;;Monthly reviews
                                        ;I want to be able to see what I worked on in a month so that I can write my monthly reviews. This code makes it easy to display a month's clocked tasks and time. I haven't been particularly thorough in tracking time before, but now that I have a shortcut that logs in Quantified Awesome as well as in Org, I should end up clocking more.

(defun my/org-review-month (start-date)
  "Review the month's clocked tasks and time."
  (interactive (list (org-read-date)))
  ;; Set to the beginning of the month
  (setq start-date (concat (substring start-date 0 8) "01"))
  (let ((org-agenda-show-log t)
        (org-agenda-start-with-log-mode t)
        (org-agenda-start-with-clockreport-mode t)
        (org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3)))
    (org-agenda-list nil start-date 'month)))
;Here's a function like my/org-prepare-weekly-review:

(defun _my/extract-posts-from-webpage (url)
  (with-current-buffer (url-retrieve-synchronously url)
    (goto-char (point-min))
    (re-search-forward "<pre>")
    (buffer-substring
     (point)
     (progn (re-search-forward "</pre>") (match-beginning 0)))))
(defun my/org-get-last-week ()
  "Return dates for filtering last week."
  (if (string= (format-time-string "%u") "6") ;; my week starts on Saturday
      (cons (org-read-date nil nil "-1w") (org-read-date nil nil "."))
    (cons (org-read-date nil nil "-2sat") (org-read-date nil nil "-sat"))))
(defun my/org-get-month (&optional date-string)
  "Return start of month containing DATE and start of following month.
Result is (START . NEXT)."
  (let* ((date (decode-time (if (stringp date-string) (org-read-date nil t date-string) date-string)))
         (month (elt date 4))
         (year (elt date 5))
         start-date
         end-date)
    (calendar-increment-month month year 1)
    (cons 
     (format "%4d-%02d-01" (elt date 5) (elt date 4))
     (format "%4d-%02d-01" year month))))

(defun my/org-prepare-monthly-review ()
  (interactive)
  (let* ((date (decode-time))
         (month (elt date 4))
         (year (elt date 5))
         start-date
         end-date
         previous-date
         posts
         sketches
         org-date
         time)
    (calendar-increment-month month year -1)
    (setq start-date (format "%4d-%02d-01" year month)
          end-date (format "%4d-%02d-01" (elt date 5) (elt date 4))
          posts (_my/extract-posts-from-webpage
                 (format "http://sachachua.com/blog/%4d/%d?org=1"
                         year month))
          sketches (my/sketches-export-and-extract start-date nil nil t))
    (calendar-increment-month month year -1)
    (setq previous-date (format "%4d-%02d-01" year month))
    (setq time (my/quantified-compare previous-date start-date start-date end-date '("Business - Build" "Discretionary - Play" "Unpaid work" "A-" "Discretionary - Social" "Discretionary - Family" "Sleep" "Business - Connect" "Business - Earn" "Discretionary - Productive" "Personal") "Previous month %" "This month %"))
    (goto-char (line-end-position))
    (insert
     "\n\n** Monthly review: "
     (format-time-string "%B %Y" (encode-time 0 0 0 1 month year))
     "  :monthly:review:\n"
     "*Blog posts*\n"
     posts "\n\n"
     "*Sketches*\n\n"
     sketches
     "*Time*\n\n"
     (orgtbl-to-orgtbl time nil))))


;;;;;;;;;;;;;;;;;;;;Filing
;Moving lines around
;This makes it easier to reorganize lines in my weekly review.

    (defun my/org-move-line-to-destination ()
      "Moves the current list item to <<destination>> in the current buffer.
;If no <<destination>> is found, move it to the end of the list
;and indent it one level."
      (interactive)
      (save-window-excursion
        (save-excursion
          (let ((string
                 (buffer-substring-no-properties
                  (line-beginning-position) (line-end-position)))
                found)
            (delete-region (line-beginning-position) (1+ (line-end-position)))
            (save-excursion
              (goto-char (point-min))
              (when (re-search-forward "<<destination>>" nil t)
                (insert "\n" (make-string (- (match-beginning 0) (line-beginning-position)) ?\ ) (s-trim string))
                (setq found t)))
            (unless found
              (org-end-of-item-list)
              (insert string "\n"))))))

(defun my/org-move-line-to-end-of-list ()
  "Move the current list item to the end of the list."
  (interactive)
  (save-excursion
    (let ((string (buffer-substring-no-properties (line-beginning-position)
                                                  (line-end-position))))
      (delete-region (line-beginning-position) (1+ (line-end-position)))
      (org-end-of-item-list)
      (insert string))))

;Organizing my blog index
(defun my/org-file-blog-index-entries (beg end location)
  "Copy entries into blog.org."
  (interactive
   (list
    (if (region-active-p) (point) (line-beginning-position))
    (if (region-active-p) (mark) (1+ (line-end-position)))
    (let ((org-refile-targets
           '(("~/Dropbox/Public/sharing/blog.org" . (:maxlevel . 3)))))
      (save-excursion (org-refile-get-location "Location")))))
  (let ((s
         (replace-regexp-in-string
          "^[ \t]*- \\(\\[X\\] \\)?"
          "- [X] "
          (buffer-substring-no-properties beg end))))
    ;; if we're already in blog.org, delete the previous entry
    (if (string= buffer-file-name (expand-file-name "~/Dropbox/Public/sharing/blog.org"))
        (delete-region beg end))
    (save-window-excursion
      (save-excursion
        (find-file (nth 1 location))
        (save-excursion
          (save-restriction
            (widen)
            (goto-char (nth 3 location))
            (re-search-forward org-list-full-item-re nil t)
            (goto-char (line-beginning-position))
            (insert s)
            (org-update-statistics-cookies nil)))))))
;Quickly refiling Org Mode notes to headings in the same file
;I wanted a quick way to organize random notes from my inbox into an outline, organizing from the bottom up instead of starting with a top-down hierarchy. My old code for refiling to an Org heading in the current buffer didn't work any more, but helm-org-in-buffer-headings seems to be promising. I made it a speed command (see the value of org-use-speed-commands elsewhere in my config) so that I can easily refile.

(defvar my/org-last-refile-marker nil "Marker for last refile")
(defun my/org-refile-in-file (&optional prefix)
  "Refile to a target within the current file."
  (interactive)
  (let ((helm-org-headings-actions
         '(("Refile to this heading" . helm-org-heading-refile))))
    (save-excursion
      (helm-org-in-buffer-headings)
      (org-end-of-subtree t)
      (setq my/org-last-refile-marker (point-marker)))))

(defun my/org-refile-to-previous ()
  "Refile subtree to last position from `my/org-refile-in-file'."
  (interactive)
  (save-selected-window
    (when (eq major-mode 'org-agenda-mode)
      (org-agenda-switch-to))
    (org-cut-subtree)
    (save-excursion
      (let* ((marker my/org-last-refile-marker)
             (target-level
              (with-current-buffer (marker-buffer marker)
                (goto-char (marker-position marker))
                (org-current-level))))
        (helm-org-goto-marker marker)
        (org-end-of-subtree t t)
        (org-paste-subtree target-level)))))

(add-to-list 'org-speed-commands-user '("w" call-interactively 'my/org-refile-in-file))
(add-to-list 'org-speed-commands-user '("." call-interactively 'my/org-refile-to-previous))
;TODO: Figure out why I'm getting duplicates. Next step might be to fiddle with helm-org-in-buffer-headings so that it preselects the previous candidate, but that can happen later.

;Tech note: helm-org doesn't use the usual org-refile mechanism. Instead, it cuts the subtree, goes to the marker, and pastes it in at the appropriate level.

;Inserting code
(defun my/org-insert-defun (function)
  "Inserts an Org source block with the definition for FUNCTION."
  (interactive (find-function-read))
  (let* ((buffer-point (condition-case nil (find-definition-noselect function nil) (error nil)))
         (new-buf (car buffer-point))
         (new-point (cdr buffer-point))
         definition)
    (if buffer-point        
      (with-current-buffer new-buf ;; Try to get original definition
        (save-excursion
          (goto-char new-point)
          (setq definition (buffer-substring-no-properties (point) (save-excursion (end-of-defun) (point))))))
      ;; Fallback: Print function definition
      (setq definition (concat (prin1-to-string (symbol-function function)) "\n")))
    (insert "#+begin_src emacs-lisp\n" definition "#+end_src\n")))

;Publishing
;Timestamps and section numbers make my published files look more complicated than they are. Let's turn them off by default.
(setq org-export-with-section-numbers nil)
(setq org-html-include-timestamps nil)
(setq org-export-with-sub-superscripts nil)
(setq org-export-with-toc nil)
(setq org-html-toplevel-hlevel 2)
(setq org-export-htmlize-output-type 'css)
;Sometimes I have broken or local links, and that's okay.

(setq org-export-with-broken-links t)

;Don't wrap ASCII exports.
(setq org-ascii-text-width 10000)

;This makes it easier to publish my files:
;(if (string= system-name "webdev")
;    (setq my/emacs-notes-directory "~/code/dev/emacs-notes")
;  (setq my/emacs-notes-directory "c:/sacha/code/dev/emacs-notes"))
(setq org-publish-project-alist
      '(
        ;("public"
        ; :base-directory "c:/sacha/Dropbox/public"
        ; :publishing-directory "c:/sacha/Dropbox/public"
        ; :publishing-function my/org-html-publish-to-html-trustingly
        ; )
        ;("sharing"
        ; :base-directory "c:/sacha/Dropbox/public/sharing"
        ; :publishing-directory "c:/sacha/Dropbox/public/sharing"
        ; :publishing-function my/org-html-publish-to-html-trustingly
        ; )
        ("emacs-config"
         :base-directory "~/.emacs.d"
         :publishing-directory "~/.emacs.d"
         :publishing-function my/org-html-publish-to-html-trustingly
         )
        ;("book-notes"
        ; :base-directory "c:/sacha/Dropbox/books"
        ; :publishing-directory "c:/sacha/Dropbox/books/html"
        ; :publishing-function my/org-html-publish-to-html-trustingly
        ; :makeindex t)
        ))
;;;  (load "~/code/dev/emacs-chats/build-site.el" t)
;;;  (load "~/code/dev/emacs-notes/build-site.el" t)
;;;  ;If a file is in a publishing project, publish it.
;;;  
;;;  (defun my/org-publish-maybe ()
;;;    (require 'ox-publish)
;;;    (interactive)
;;;    (save-excursion
;;;      (if (org-publish-get-project-from-filename
;;;             (buffer-file-name (buffer-base-buffer)) 'up)
;;;             (org-publish-current-file t)
;;;             (my/org-html-export-trustingly))))
;;;  Make it easy to publish and browse a file.
;;;  
;;;  (defun my/org-publish-and-browse ()
;;;    (interactive)
;;;    (save-buffer)
;;;    (my/org-publish-maybe)
;;;    (browse-url (org-export-output-file-name ".html" nil default-directory)))
;;;  (bind-key "<apps> b" 'my/org-publish-and-browse)
;;;  Org2blog
;;;  I use org2blog to post to my blog, which is Wordpress-based. I used to use punchagan's org2blog, but there's a completely different one in ELPA, so I figured I'd give that a try. UPDATE 2014-10-29: Overriding it with the Git version (see the first section of this config) so that I can use thumbnail support for now…
;;;  
;;;  (use-package org2blog
;;;    :load-path "~/code/org2blog"
;;;    :commands 'org2blog/wp-post-subtree
;;;    :config
;;;     (progn
;;;      (setq org2blog/wp-track-posts nil)
;;;      (setq org2blog/wp-use-tags-as-categories t)
;;;      (defadvice org2blog/wp-post-buffer (around sacha activate)
;;;      (let ((org-confirm-babel-evaluate nil)
;;;            (org-html-toplevel-hlevel 3))
;;;        ad-do-it))))
;;;  
;;;  (defun my/org2blog-subtree ()
;;;    "Post to my blog and get files ready."
;;;    (interactive)
;;;    (org2blog/wp-post-subtree)
;;;    (my/org-stage-image-files-in-subtree)
;;;    (shell-command "start c:\\sacha\\dropbox\\inbox\\selection")
;;;    (browse-url "http://sachachua.com/blog/wp-admin/edit.php?page=cal"))

(use-package htmlize)
;Publish without prompting
;I want to be able to export without having to say yes to code blocks all the time.

(defun my/org-html-export-trustingly ()
  (interactive)
  (let ((org-confirm-babel-evaluate nil))
    (org-html-export-to-html)))

(defun my/org-html-publish-to-html-trustingly (plist filename pub-dir)
  (let ((org-confirm-babel-evaluate nil))
    (org-html-publish-to-html plist filename pub-dir)))

;Stylesheet / header
;Might as well take advantage of my stylesheet:
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\"
href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/foundation/css/foundation.min.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/org-export.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/style.css\"></link>
<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script>")
(setq org-html-htmlize-output-type 'css)
(setq org-src-fontify-natively t)

;Footer
;Make it easy to scroll to the top:

(setq org-html-preamble "<a name=\"top\" id=\"top\"></a>")
(setq org-html-postamble "
<style type=\"text/css\">
.back-to-top {
    position: fixed;
    bottom: 2em;
    right: 0px;
    text-decoration: none;
    color: #000000;
    background-color: rgba(235, 235, 235, 0.80);
    font-size: 12px;
    padding: 1em;
    display: none;
}

.back-to-top:hover {
    background-color: rgba(135, 135, 135, 0.50);
}
</style>
<!--
<div class=\"back-to-top\">
<a href=\"#top\">Back to top</a> | <a href=\"mailto:chidvi30@gmail.com\">E-mail me</a>
</div>
-->
<script type=\"text/javascript\">
    var offset = 220;
    var duration = 500;
    jQuery(window).scroll(function() {
        if (jQuery(this).scrollTop() > offset) {
            jQuery('.back-to-top').fadeIn(duration);
        } else {
            jQuery('.back-to-top').fadeOut(duration);
        }
    });
</script>")

;Copy region
;Sometimes I want a region's HTML in my kill-ring/clipboard without any of the extra fluff:

(defun my/org-copy-region-as-html (beg end &optional level)
  "Make it easier to copy code for Wordpress posts and other things."
  (interactive "r\np")
  (let ((org-export-html-preamble nil)
        (org-html-toplevel-hlevel (or level 3)))
    (kill-new
     (org-export-string-as (buffer-substring beg end) 'html t))))

;Sometimes I want a subtree:
(defun my/org-copy-subtree-as-html ()
  (interactive)
  (my/org-copy-region-as-html
   (org-back-to-heading)
   (org-end-of-subtree)))

;;; (defun my/org-share-emacs ()
;;;   "Share my Emacs configuration."
;;;   (interactive)
;;;   (let* ((destination-dir "~/Dropbox/Public/")
;;;          (destination-filename "sacha-emacs.org"))
;;;     (my/save-new-packages)
;;;     (with-current-buffer (find-file "~/.emacs.d/Sacha.org")
;;;       (save-restriction
;;;         (save-excursion
;;;           (widen)
;;;           (write-region (point-min) (point-max)
;;;                         (expand-file-name destination-filename destination-dir))
;;;           (with-current-buffer (find-file-noselect (expand-file-name
;;;                                                     destination-filename destination-dir))
;;;             (org-babel-tangle-file buffer-file-name
;;;                                    (expand-file-name
;;;                                     "sacha-emacs.el" destination-dir) "emacs-lisp")
;;;             (org-html-export-to-html)))))))

;;Beamer
(with-eval-after-load 'org
  (require 'ox-latex)
  (add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}"))))

;; Fix incompatible changes from Org 8 to Org 9
;; http://orgmode.org/cgit.cgi/org-mode.git/plain/etc/ORG-NEWS
(defun org-repair-export-blocks ()
  "Repair export blocks and INCLUDE keywords in current buffer."
  (when (eq major-mode 'org-mode)
    (let ((case-fold-search t)
          (back-end-re (regexp-opt
                        '("HTML" "ASCII" "LATEX" "ODT" "MARKDOWN" "MD" "ORG"
                          "MAN" "BEAMER" "TEXINFO" "GROFF" "KOMA-LETTER")
                        t)))
      (org-with-wide-buffer
       (goto-char (point-min))
       (let ((block-re (concat "^[ \t]*#\\+BEGIN_" back-end-re)))
         (save-excursion
           (while (re-search-forward block-re nil t)
             (let ((element (save-match-data (org-element-at-point))))
               (when (eq (org-element-type element) 'special-block)
                 (save-excursion
                   (goto-char (org-element-property :end element))
                   (save-match-data (search-backward "_"))
                   (forward-char)
                   (insert "EXPORT")
                   (delete-region (point) (line-end-position)))
                 (replace-match "EXPORT \\1" nil nil nil 1))))))
       (let ((include-re
              (format "^[ \t]*#\\+INCLUDE: .*?%s[ \t]*$" back-end-re)))
         (while (re-search-forward include-re nil t)
           (let ((element (save-match-data (org-element-at-point))))
             (when (and (eq (org-element-type element) 'keyword)
                        (string= (org-element-property :key element) "INCLUDE"))
               (replace-match "EXPORT \\1" nil nil nil 1)))))))))
(with-eval-after-load 'org
  (add-to-list 'org-mode-hook 'org-repair-export-blocks))
;; Links
;; Quick links
  (setq org-link-abbrev-alist
    '(("google" . "http://www.google.com/search?q=")
("gmap" . "http://maps.google.com/maps?q=%s")
("blog" . "http://sachachua.com/blog/p/")))
;; Custom links
;; From http://endlessparentheses.com/use-org-mode-links-for-absolutely-anything.html?source=rss

(org-add-link-type "tag" 'endless/follow-tag-link)

(defun endless/follow-tag-link (tag) "Display a list of TODO headlines with tag TAG. With prefix argument, also display headlines without a TODO keyword." (org-tags-view (null current-prefix-arg) tag))

;; Links from org-protocol
;; So that I can easily add links at point. Formatted as an Org list for now.

(defun my/org-protocol-insert-link (info) 
  "Store and insert the link at point based on INFO."
  (org-protocol-store-link info)
  (with-current-buffer (window-buffer (selected-window))
    (insert "- ")
    (org-insert-last-stored-link 1)
    (insert "\n")))
(eval-after-load 'org-protocol
 '(add-to-list 'org-protocol-protocol-alist
    '("insert-link" :protocol "insert-link" :function my/org-protocol-insert-link)))
; Dired
(defun my/org-get-links-in-region (beg end)
  (save-excursion
    (let (results)
      (goto-char (min beg end))
      (while (re-search-forward org-any-link-re (max beg end) t)
        (add-to-list 'results (org-element-context)))
      results)))

(defun my/org-dired-file-links-in-region (beg end)
  "Display a Dired buffer for the file links in the selected region."
  (interactive "r")
  (let ((files
         (-map
          (lambda (x)
            (expand-file-name (org-link-unescape (plist-get (cadr x) :path))))
          (-filter
           (lambda (x)
             (string= (plist-get (cadr x) :type) "file"))
           (my/org-get-links-in-region beg end)))))
    (with-current-buffer (get-buffer-create "*Files*")
      (let ((inhibit-read-only t))
        (erase-buffer)
        (apply 'call-process "ls" nil t nil "-lR" files))
      (dired-virtual "/")
      (switch-to-buffer (current-buffer)))))

;;;;; ;Journal from Memento Database
;;;;;   (defvar my/journal-category-map
;;;;;     '(("Gross" . "Gross motor")
;;;;;       ("Fine" . "Fine motor")
;;;;;       ("8 - Kaizen" . "Kaizen")
;;;;;       ("9 - Us" . "Us"))
;;;;;     "Alist of string replacements for journal categories.")
;;;;;   (defvar my/journal-categories
;;;;;     '("Field trip" "Gross motor" "Fine motor"
;;;;;       "Sensory" "Language" "Music" "Art"
;;;;;       "Self-care" "Eating" "Sleep" "Emotion"
;;;;;       "Household" "Social" "Pretend" "Other" "Kaizen" "Us" "Oops")
;;;;;     "List of categories to display. 
;;;;; Unknown categories will be added to the end.")
;;;;;   (defun my/org-summarize-journal-csv (filename from to highlight &optional category-map categories)
;;;;;     (interactive
;;;;;      (list (read-file-name "File: ") 
;;;;;            (org-read-date nil nil nil "From: ")
;;;;;            (org-read-date nil nil nil "To: ")
;;;;;            (let ((choice
;;;;;                   (read-char-choice "Highlight (m: month, w: week, a: all): " "mwa")))
;;;;;              (cond ((= choice ?m) "month")
;;;;;                    ((= choice ?w) "week")
;;;;;                    (t "all")))
;;;;;            my/journal-category-map
;;;;;            my/journal-categories))
;;;;;     (let* ((data (pcsv-parse-file filename))
;;;;;            (filtered
;;;;;             (-filter
;;;;;              (lambda (o)
;;;;;                (and (string< from (cadr o)) 
;;;;;                     (string< (cadr o) to)
;;;;;                     (string-equal
;;;;;                      "true"
;;;;;                      (cond
;;;;;                       ((string-equal highlight "month") (elt o 4))
;;;;;                       ((string-equal highlight "week") (elt o 2))
;;;;;                       (t "true")))))
;;;;;              data))
;;;;;            (grouped (-group-by
;;;;;                      (lambda (o) (elt o 3)) filtered))
;;;;;            (mapped-list
;;;;;             (mapcar 
;;;;;              (lambda (o)
;;;;;                (cons (or (assoc-default (car o) category-map) (car o))
;;;;;                      (cdr o)))
;;;;;              grouped))
;;;;;            (sorted-list
;;;;;             (delq nil
;;;;;                   (append
;;;;;                    (mapcar (lambda (cat)
;;;;;                              (when (assoc-default cat mapped-list)
;;;;;                                (cons cat (assoc-default cat mapped-list))))
;;;;;                            categories)
;;;;;                    (-remove (lambda (o) (member (car o) categories)) mapped-list))))
;;;;;            (list (mapconcat
;;;;;                   (lambda (o)
;;;;;                     (concat "- *" (car o) "*\n"
;;;;;                             (mapconcat (lambda (i) (concat "  - " (car i) "\n")) (reverse (cdr o)) "")))
;;;;;                   sorted-list "")))    
;;;;;       (if (called-interactively-p 'any) (insert list) list)))

;Attachments
;Org lets you attach files to an Org file. Haven't gotten the hang of this yet, but looks interesting.

(setq org-attach-store-link-p 'attached)
(setq org-attach-auto-tag nil)
;HTTP
;(use-package ob-http)
;Diagrams and graphics
;Ooooh. Graphviz and Ditaa make it easier to create diagrams from Emacs. See http://sachachua.com/evil-plans for examples and source.

;(setq org-ditaa-jar-path "c:/sacha/Dropbox/bin/ditaa.jar")
;(setq org-startup-with-inline-images t)
;(use-package org
; :config
; (progn
;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((dot . t)
;   (ditaa . t)
;   (shell . t)
;   (calc . t)
;   (sqlite . t)
;   (http . t)
;   (ledger . t)
;   (shell . t)
;   (R . t)))
;(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))))

;Counting
;Good way to remind myself that I have lots of STARTED tasks.

(defun my/org-summarize-task-status ()
  "Count number of tasks by status.
Probably should make this a dblock someday."
  (interactive)
  (let (result)
    (org-map-entries
     (lambda ()
       (let ((todo (elt (org-heading-components) 2)))
         (if todo
             (if (assoc todo result)
                 (setcdr (assoc todo result)
                         (1+ (cdr (assoc todo result))))
               (setq result (cons (cons todo 1) result)))))))
    (message "%s" (mapconcat (lambda (x) (format "%s: %d" (car x) (cdr x)))
                             result "\n"))))
;Spreadsheets
(defun my/org-days-between (start end)
  "Number of days between START and END (exclusive).
This includes START but not END."
  (- (calendar-absolute-from-gregorian (org-date-to-gregorian end))
     (calendar-absolute-from-gregorian (org-date-to-gregorian start))))
;Literate programming
;Editing source code
;I don't want to get distracted by the same code in the other window, so I want org src to use the current window.

(setq org-src-window-setup 'current-window)
;Copying and sharing code
(defun my/copy-code-as-org-block-and-gist (beg end)
  (interactive "r")
  (let ((filename (file-name-base))
        (mode (symbol-name major-mode))
        (contents
         (if (use-region-p) (buffer-substring beg end) (buffer-string)))
        (gist (if (use-region-p) (gist-region beg end) (gist-buffer))))
    (kill-new
     (format "\n[[%s][Gist: %s]]\n#+begin_src %s\n%s\n#+end_src\n"
             (oref (oref gist :data) :html-url) filename
             (replace-regexp-in-string "-mode$" "" mode)
             contents))))
;Invoices
(setq calendar-week-start-day 6) ;; My weeks start on Saturday

(defun my/org-get-invoice-range-based-on-date (date)
  (let* ((invoice-date (org-date-to-gregorian date))
         (start (list (1- (car invoice-date)) 1 (elt invoice-date 2)))
         (end (list (car invoice-date) 1 (elt invoice-date 2))))
    (mapcar (lambda (date)
              (format-time-string "%F" (encode-time 0 0 0 1 (elt date 0) (elt date 2))))
            (list start end))))

(defun my/org-quantified-get-hours-based-on-range (category start end)
  "Return the number of hours for the specified category."
  (/ (assoc-default category
                    (quantified-summarize-time start end)) 3600.0))

;; TODO: paginate
(defun my/org-quantified-get-detailed-hours-based-on-range (category start end)
  "Return a list of (date week-ending-date dow seconds) for CATEGORY from START to END."
  (let ((entries
         (gethash "entries"
                  (quantified-parse-json
                   (quantified-request (format "records.json?start=%s&end=%s&filter_string=%s&per_page=1000&split=split" start end (url-encode-url category))
                                       nil "GET")))))
    (mapcar
     (lambda (entry)
       (let ((time (date-to-time (gethash "timestamp" entry))))
         (list
          (format-time-string "%F" time)
          (format-time-string "%F" (my/get-week-end-for-time time))
          (format-time-string "%a" time)
          (gethash "duration" entry))))
     entries)))

(defun my/get-week-end-for-time (time &optional week-ends-on-day)
  "WEEK-ENDS-ON-DAY: 0 is Sunday"
  (let* ((decoded (decode-time time))
         (dow (elt decoded 6))
         (end-week (or week-ends-on-day (% (+ 6 calendar-week-start-day) 7))))
    (encode-time
     (elt decoded 0)
     (elt decoded 1)
     (elt decoded 2)
     (+ (elt decoded 3)
        (% (+ 7 (- end-week dow)) 7))
     (elt decoded 4)
     (elt decoded 5))))

(ert-deftest my/org-get-week-ending-date ()
  (let ((calendar-week-start-day 6)
        (tests '(
                 ("2015-09-03" . "2015-09-04")
                 ("2015-12-01" . "2015-12-04")
                 ("2015-12-03" . "2015-12-04")
                 ("2015-12-04" . "2015-12-04")
                 ("2015-12-05" . "2015-12-11"))))
    (dolist (test tests)
      (should (string=
               (format-time-string
                "%F"
                (my/get-week-end-for-time (org-time-string-to-time (car test))))
               (cdr test)))
      (should (string=
               (format-time-string
                "%F"
                (my/get-week-end-for-time (org-time-string-to-time (car test)) 5))
               (cdr test))))))



(defun my/org-quantified-format-detailed-hours-as-table (list)
  "Return a table with rows for LIST.
  | Week ending ____ | Sat | Sun | Mon | Tue | Wed | Thu | Fri | Total |
  LIST elements should be in the form (date week-end-date dow seconds).
  See `my/org-quantified-get-detailed-hours-based-on-range'."
  ;; Group by week ending date
  (let ((days '("Sat" "Sun" "Mon" "Tue" "Wed" "Thu" "Fri")))
    (append
     (list (append '("Week ending") days '("Total")))
     (mapcar
      (lambda (row)
        (let ((day-values (-group-by (lambda (x) (elt x 2)) (cdr row)))
              (week-total 0))
          (append
           (list (format "Week ending %s" (format-time-string "%b %-e" (org-time-string-to-time (car row)))))
           (mapcar (lambda (day)
                     (if (assoc-default day day-values)
                         (format "%.1f"
                                 (apply '+
                                        (mapcar
                                         (lambda (day-val) (/ (elt day-val 3) 3600.0))
                                         (assoc-default day day-values))))
                       ""))
                   days)
           (list (format "%.1f"
                         (apply '+ (mapcar (lambda (day-val) (/ (elt day-val 3) 3600.0)) (cdr row)))))
           ))
        )
      (-sort (lambda (a b) (string< (car a) (car b))) (-group-by (lambda (x) (elt x 1)) list))))))


(defun my/org-quantified-hours-table ()
  (my/org-quantified-format-detailed-hours-as-table
   (apply 'my/org-quantified-get-detailed-hours-based-on-range 
          (org-entry-get-with-inheritance "QUANTIFIED_CATEGORY")
          (my/org-get-invoice-range-based-on-date (org-entry-get-with-inheritance "INVOICE_DATE")))))

(ert-deftest my/org-get-invoice-range-based-on-date ()
  "Check if invoice range is sane."
  (should (equal (my/org-get-invoice-range-based-on-date "2015-12-05")
                 '("2015-11-01" "2015-12-01"))))
;Archiving
;From http://stackoverflow.com/questions/6997387/how-to-archive-all-the-done-tasks-using-a-single-command

(defun my/org-archive-done-tasks ()
  "Archive finished or cancelled tasks."
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "TODO=\"DONE\"|TODO=\"CANCELLED\"" (if (org-before-first-heading-p) 'file 'tree)))
;Also, don't ask me for confirmation:

(add-to-list 'org-speed-commands-user '("a" call-interactively 'org-archive-subtree-default))
;Filesystem
(use-package org-fstree
  :commands (org-fstree-apply-maybe org-fstree-show-entry-maybe)
  :config
  (progn (add-hook 'org-ctrl-c-ctrl-c-hook 'org-fstree-apply-maybe)
         (add-hook 'org-pre-cycle-hook 'org-fstree-show-entry-maybe)))

;TODO check out org-fstree
;Presentations
(use-package ox-reveal :disabled t)
;Allow dashes in tags
(defun my/org-add-dashes-to-tag-regexps ()
  (setq org-complex-heading-regexp
        (concat "^\\(\\*+\\)"
                "\\(?: +" org-todo-regexp "\\)?"
                "\\(?: +\\(\\[#.\\]\\)\\)?"
                "\\(?: +\\(.*?\\)\\)??"
                (org-re "\\(?:[ \t]+\\(:[-[:alnum:]_@#%:]+:\\)\\)?")
                "[ \t]*$")
        org-complex-heading-regexp-format
        (concat "^\\(\\*+\\)"
                "\\(?: +" org-todo-regexp "\\)?"
                "\\(?: +\\(\\[#.\\]\\)\\)?"
                "\\(?: +"
                ;; Stats cookies can be stuck to body.
                "\\(?:\\[[0-9%%/]+\\] *\\)*"
                "\\(%s\\)"
                "\\(?: *\\[[0-9%%/]+\\]\\)*"
                "\\)"
                (org-re "\\(?:[ \t]+\\(:[-[:alnum:]_@#%%:]+:\\)\\)?")
                "[ \t]*$")
        org-todo-line-tags-regexp
        (concat "^\\(\\*+\\)"
                "\\(?: +" org-todo-regexp "\\)?"
                "\\(?: +\\(.*?\\)\\)??"
                (org-re "\\(?:[ \t]+\\(:[-[:alnum:]:_@#%]+:\\)\\)?")
                "[ \t]*$")))
(add-hook 'org-mode-hook 'my/org-add-dashes-to-tag-regexps)
;Copying information from my phone
;I have a tiny Tasker script that makes it easy to log timestamped entries as files in a directory that I synchronize with Dropbox. This code pulls that information into my ~/Dropbox/tasker/

(defun my/read-phone-entries ()
  "Copy phone data to a summary Org file."
  (interactive)
  (mapc
   (lambda (filename)
     (let ((base (file-name-base filename)) contents timestamp category encoded-time date)
       (when (string-match "^[^ ]+ [^ ]+ \\([^ ]+\\) - \\(.*\\)" base)
         (setq time (seconds-to-time (/ (string-to-number (match-string 1 base)) 1000))
               encoded-time (decode-time time)
               date (list (elt encoded-time 4) (elt encoded-time 3) (elt encoded-time 5))
               category (match-string 2 base))
         (with-temp-buffer
           (insert-file-contents filename)
           (setq contents (s-trim (buffer-string))))
         (with-current-buffer
             (find-file "~/dropbox/tasker/summary.txt")
           (org-datetree-find-date-create date)
           (unless (save-excursion (re-search-forward (regexp-quote base) nil t))
             (goto-char (line-end-position))
             (insert "\n")
             (insert "**** " contents "  :" category ":\n" base "\n")
             (insert (format-time-string "[%Y-%m-%d %a %H:%M]\n" time))

             (if (member category '("Think" "Do"))
                 (save-excursion
                   (org-back-to-heading t)
                   (if (looking-at org-outline-regexp) (goto-char (1- (match-end 0))))
                   (unless (looking-at org-todo-regexp)
                     (org-todo "TODO"))))
             (if (string-match "^Energy \\([0-9]\\)" contents)
                 (org-set-property "ENERGY" (match-string 1 contents)))))
         (delete-file filename))))
   (directory-files "~/dropbox/tasker/data" t "\\.txt$")))
;Emacs packages, other settings for easy Emacs News generation
;Package links
(defun my/org-package-open (package-name)
  (interactive "MPackage name: ")
  (describe-package (intern package-name)))

(ert-deftest my/org-package-export ()
  (should
   (string=
    (my/org-package-export "transcribe" "transcribe" 'html)
    "<a target=\"_blank\" href=\"https://elpa.gnu.org/packages/transcribe.html\">transcribe</a>"
    ))
  (should
   (string=
    (my/org-package-export "fireplace" "fireplace" 'html)
    "<a target=\"_blank\" href=\"http://melpa.org/#/fireplace\">fireplace</a>"
    )))
(defun my/org-package-export (link description format)
  (let* ((package-info (car (assoc-default (intern link) package-archive-contents)))
         (package-source (package-desc-archive package-info))
         (path (format
                (cond
                 ((string= package-source "gnu") "https://elpa.gnu.org/packages/%s.html")
                 ((string= package-source "melpa") "http://melpa.org/#/%s")
                 (t (throw 'unknown-source)))
                link))
         (desc (or description link)))
    (cond
     ((eq format 'html) (format "<a target=\"_blank\" href=\"%s\">%s</a>" path desc))
     ((eq format 'wp) (format "<a target=\"_blank\" href=\"%s\">%s</a>" path desc))
     ((eq format 'latex) (format "\\href{%s}{%s}" path desc))
     ((eq format 'texinfo) (format "@uref{%s,%s}" path desc))
     ((eq format 'ascii) (format "%s <%s>" desc path))
     (t path))))

;(org-link-set-parameters "package" :follow 'my/org-package-open :export 'my/org-package-export)

;ASCII export
;This setting puts Org ASCII export links right after the text instead of in a separate section:
;
(setq org-ascii-links-to-notes nil)

; Reddit
; This one exports links from my secret my/reddit-upvoted-json. You can get your Reddit upvoted JSON URL at https://www.reddit.com/prefs/feeds/ .
; 
; (defun my/reddit-list-upvoted (date)
;   (interactive (list (org-read-date)))
;   (let ((threshold (org-read-date nil t date)))
;     (with-current-buffer (url-retrieve-synchronously my/reddit-upvoted-json)      
;       (goto-char (point-min))
;       (re-search-forward "^$")
;       (let* ((data (json-read))
;              (items (assoc-default 'children (assoc-default 'data data)))
;              (result
;               (mapconcat
;                (lambda (item)
;                  (let* ((o (assoc-default 'data item))
;                         (title (assoc-default 'title o))
;                         (url (assoc-default 'url o))
;                         (date (seconds-to-time (assoc-default 'created_utc o)))
;                         (permalink (concat "https://reddit.com" (assoc-default 'permalink o)))
;                         (num-comments (assoc-default 'num_comments o 'eq 0)))
;                    (when (time-less-p threshold date)
;                      (if (and (> num-comments 0) (not (string-match "reddit\\.com" url)))
;                          (format "- [[%s][%s]] ([[%s][Reddit]])\n" url title permalink)
;                        (format "- [[%s][%s]]\n" url title)))))
;                items "")))
;         (if (called-interactively-p)
;             (message "%s" result)
;           result)))))



;;;;;;;;;;;Other functions
(defun my/org-list-from-rss (url date)
  "Convert URL to an Org list"
  (with-current-buffer (url-retrieve-synchronously url)
    (re-search-forward "<\\?xml")
    (goto-char (match-beginning 0))
    (let ((feed (xml-parse-region (point) (point-max))))
      (mapconcat (lambda (entry)
                   (format "- [[%s][%s]]" 
                           (xml-get-attribute (car (xml-get-children entry 'link)) 'href)
                           (elt (car (xml-get-children entry 'title)) 2)))
                 (-filter (lambda (entry)
                            (org-string<= date (elt (car (xml-get-children entry 'updated)) 2)))
                          (xml-get-children (car feed) 'entry)) "\n"))))

(defun my/describe-packages (list)
  "Return an Org list of package descriptions for LIST."
  (mapconcat
   (lambda (symbol)
     (let ((package-desc (assoc symbol package-archive-contents)))
       (if package-desc
           (format "  - [[package:%s][%s]]: %s"
                   (symbol-name symbol)
                   (symbol-name symbol)
                   (package-desc-summary (cadr package-desc)))
         "")))
   list
   "\n"))

(defun my/list-new-packages ()
  (interactive)
  (let ((packages
         (with-temp-buffer
           (insert-file-contents "~/.emacs.d/.package-list")
           (goto-char (point-min))
           (my/describe-packages
            (-difference (mapcar 'car package-archive-contents)
                         (read (current-buffer)))))))
    (if (called-interactively-p 'any)
        (insert packages)
      packages)))

(defun my/save-new-packages ()
  (interactive)
  (require 'dash)
  (when package-archive-contents
    (with-temp-buffer
      (find-file "~/.emacs.d/.package-list")
      (let ((old-list (read (current-buffer))))
        (erase-buffer)
        (prin1 (-union old-list (mapcar 'car package-archive-contents)) (current-buffer))
        (save-buffer)
        )
      nil)))



;;;Autosave
;;;Could be handy, especially when synchronizing with Orgzly. From https://www.reddit.com/r/orgmode/comments/7ke3hv/orgzly_best_practice/
(run-with-idle-timer 30 t 'org-save-all-org-buffers)


;;;;;;Converting from Markdown
(defun my/org-convert-from-markdown (beg end)
  (interactive "r")
  (shell-command-on-region beg end "pandoc -f markdown -t org" nil t))
(defun my/org-convert-to-markdown (beg end)
  (interactive "r")
  (shell-command-on-region beg end "pandoc -t markdown -f org" nil t))


;;;Saving new attachments to point
(setq org-image-actual-width 300)

  (defun my/org-add-new-file-as-attachment (event)
    "Function for file-notify-add-watch."
    (message "Event %S" event)
    (when (eq (cadr event) 'created)
      (let ((org-attach-store-link 'attached)
            (filename (elt event 2)))
        (unless (string-match  my/org-watch-ignore-regexps filename)
          (org-attach-attach filename nil 'mv)
          (insert "[[" (caar org-stored-links) "]]\n")
          (org-display-inline-images)))))

  (defvar my/org-watch-ignore-regexps "\\.crdownload\\|\\.com\\.google\\.Chrome\\|\\_sync\\_")
  (defvar my/org-watch-directory-descriptor nil "file-notify watch for watching a directory.")
  (defvar my/org-watch-directory "~/Downloads" "Directory to watch for new files.")
  (defun my/org-toggle-watching-directory (&optional path)
    "Watch the specified directory and add links to POINT."
    (interactive (list (unless my/org-watch-directory-descriptor (read-file-name "Directory to watch: " my/org-watch-directory))))
    (require 'org-attach)
    (if my/org-watch-directory-descriptor
        (progn
          (file-notify-rm-watch my/org-watch-directory-descriptor)
          (setq my/org-watch-directory-descriptor nil)
          (message "Stopped."))
      (when path (setq my/org-watch-directory path))
      (setq my/org-watch-directory-descriptor
            (file-notify-add-watch my/org-watch-directory '(change) 'my/org-add-new-file-as-attachment))
      (message "Started.")))
; clocktable settings
(setq org-duration-format (quote h:mm))
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
