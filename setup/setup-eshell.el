(setq shell-file-name "bash")

(setq eshell-prompt-function
      (lambda()
        (concat
         (propertize (system-name) 'face `(:foreground "#00ee00"))
         (propertize " @ " 'face `(:foreground "#dedede"))
         (propertize (replace-regexp-in-string "^.*/" "" (eshell/pwd))
                     'face `(:foreground "#1e90ff"))
         (propertize " $" `face `(:foreground "#dedede"))
         (propertize " " `face `(:foreground default-frame-foreground-color))
         )))


(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))
(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))

(provide 'setup-eshell)
