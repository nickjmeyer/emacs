(exwm-input-set-key (kbd "s-&")
                      (lambda (command)
                        (interactive (list (read-shell-command "$ ")))
                        (start-process-shell-command command nil command)))

(add-hook 'exwm-manage-finish-hook
          (lambda ()
            (rename-buffer (generate-new-buffer-name exwm-class-name))
            )
          )

(exwm-input-set-key (kbd "C-x m") 'hydra-move-window/body)

(provide 'setup-exwm)
