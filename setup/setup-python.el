(use-package company-jedi
  :ensure t
  :config
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/bin/python3")))
  (add-to-list 'company-backends 'company-jedi))

(use-package python-docstring
  :ensure t)

(setq python-shell-interpreter "python3")

(provide 'setup-python)
