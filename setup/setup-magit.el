(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-diff-refine-hunk t)

(message "Loading magit")

(provide 'setup-magit)
