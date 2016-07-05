(setq shell-file-name "bash")

(setq eshell-prompt-function
      (lambda()
        (concat
         (propertize (system-name) 'face `(:foreground "green"))
         (propertize " @ " 'face `(:foreground "gray"))
         (propertize (replace-regexp-in-string "^.*/" "" (eshell/pwd))
                     'face `(:foreground "blue"))
         (propertize " $ " `face `(:foreground "gray"))
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
