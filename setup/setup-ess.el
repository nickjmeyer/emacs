(require 'ess-site)

(ess-toggle-underscore nil)
(setq ess-history-file nil)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq ess-swv-toggle-plug-into-AUCTeX t)
(add-hook 'ess-mode-hook (lambda () (setq ess-arg-function-offset nil)))
(add-hook 'ess-mode-hook (lambda () (setq ess-indent-level 2) ) )

(message "Loading ess-site")

(provide 'setup-ess)
