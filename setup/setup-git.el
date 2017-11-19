(provide 'setup-git)

(setq auto-mode-alist (append '(("COMMIT_EDITMSG$" . text-mode)
                                ) auto-mode-alist))

(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-diff-refine-hunk t)
  ;; Spell check commit messages
  (setq auto-mode-alist (append '(("COMMIT_EDITMSG$" . text-mode)
                                  ) auto-mode-alist))
  (add-hook 'text-mode-hook (lambda () (flyspell-mode 1))))

(use-package evil-magit
  :ensure t
  :config
  (setq magit-refresh-status-buffer nil))

(use-package git-gutter-fringe
  :ensure
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 1)
  (setq git-gutter-fr:side 'right-fringe))
