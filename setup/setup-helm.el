(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; Fuzzy matching
(setq helm-buffers-fuzzy-matching t)
;; Open helm buffer inside current window to not disturb other windows
(setq helm-split-window-in-side-p t)

(provide 'setup-helm)
