;; Setup magit
(provide 'setup-magit)

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-diff-refine-hunk t)

(if (bound-and-true-p evil-mode)
    (require 'evil-magit))
