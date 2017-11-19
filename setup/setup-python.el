(use-package company-jedi
  :ensure t
  :config
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/bin/python3")))
  (add-to-list 'company-backends 'company-jedi))

(setq python-shell-interpreter "python3")

(provide 'setup-python)
