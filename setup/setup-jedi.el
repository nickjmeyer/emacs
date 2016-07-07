(require 'company-jedi)

(jedi:install-server)

(add-hook 'python-mode-hook '(lambda()
                               (add-to-list 'company-backends 'company-jedi)
                               )
          )

(setq jedi:complete-on-dot t)

(provide 'setup-jedi)
