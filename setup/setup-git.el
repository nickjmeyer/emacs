(provide 'setup-git)


(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-diff-refine-hunk t)
  ;; Spell check commit messages
  (setq auto-mode-alist (append '(("COMMIT_EDITMSG$" . text-mode)
                                  ) auto-mode-alist))
  (add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
  :config
  ;; Unbind the magit-mode-burry-buffer function
  (define-key magit-mode-map (kbd "<escape>") nil)
  (setq magit-completing-read-function 'ivy-completing-read)
  ;; (remove-hook 'magit-refs-sections-hook 'magit-insert-remote-branches)
  ;; (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
  )

;; (use-package evil-magit
;;   :ensure t
;;   :config
;;   (message "disabling escape in evil!")
;;   ;; Unbind the magit-mode-burry-buffer function
;;   (define-key magit-mode-map (kbd "<normal-state> <escape>") nil)
;;   (setq magit-refresh-status-buffer nil))

;; (use-package git-gutter-fringe
;;   :ensure
;;   :diminish git-gutter-mode
;;   :config
;;   (global-git-gutter-mode 1)
;;   (setq git-gutter-fr:side 'right-fringe))
