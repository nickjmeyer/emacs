;; Setup basic emacs configurations
(provide 'setup-basic-emacs)

;; Get rid of mouse while typing
(setq mouse-avoidance-mode 'banish)

;; Turn off system bell
(setq ring-bell-function 'ignore)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; Cleanup interface
(if (display-graphic-p)
    (scroll-bar-mode -1))
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode)
;;(setq column-number-mode t)

;; Turn off scroll bar for each graphical frame
(defun njm/turn-off-scroll-bar (frame)
  (if (display-graphic-p frame)
      (scroll-bar-mode -1)))
(add-hook 'after-make-frame-functions 'njm/turn-off-scroll-bar)


;; Turn on auto-revert mode for dired
(add-hook 'dired-mode-hook (lambda() (auto-revert-mode)))

;; Kill ring stuff
(setq global-mark-ring-max 5000) ;; increase mark ring to contains 5000 entries
(setq mark-ring-max 5000) ;; increase mark ring to contains 5000 entries
(setq kill-ring-max 5000) ;; increase kill-ring capacity
(setq kill-whole-line t)  ;; if NIL, kill whole line and move the next line up

;; Shorten prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; Get path from shell environment
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
  (exec-path-from-shell-copy-env "PYTHONPATH"))

(setq inhibit-startup-message t)

;; Emacs backup control
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Abbrev mode
(setq save-abbrevs nil)
(setq-default abbrev-mode nil)

;; Fix garbage collection
(setq gc-cons-threshold (eval-when-compile (* 256 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

;; Fix for max osx
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; Prevent accidental closes of emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Get path on remote machine when using tramp
;; use ssh config in tramnp
(require 'tramp)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; Get rid of the question marks in the line count.
(setq line-number-display-limit-width 2000000)
