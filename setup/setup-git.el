(provide 'setup-git)

(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-diff-refine-hunk t))

(use-package evil-magit
  :if (bound-and-true-p evil-mode))

(use-package git-gutter-fringe
  :ensure
  :config
  (global-git-gutter-mode 1)
  (setq git-gutter-fr:side 'right-fringe))
