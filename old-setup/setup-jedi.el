(require 'company-jedi)

(add-hook 'python-mode-hook 'jedi:setup)

(add-hook 'python-mode-hook '(lambda()
                               (add-to-list 'company-backends 'company-jedi)
                               )
          )

(setq jedi:complete-on-dot t)

(provide 'setup-jedi)
