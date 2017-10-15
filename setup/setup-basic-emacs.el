;; Setup basic emacs configurations
(provide 'setup-basic-emacs)

;; Shorten prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; Get path from shell environment
(exec-path-from-shell-initialize)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; Emacs backup control
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Abbrev mode
(setq save-abbrevs t)
(setq-default abbrev-mode t)

;; Fix garbage collection
(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

;; Fix for max osx
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; Prevent accidental closes of emacs
(setq confirm-kill-emacs 'y-or-n-p)
