(use-package python-docstring
  :ensure t)

(setq python-shell-interpreter "python3")

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(provide 'setup-python)
