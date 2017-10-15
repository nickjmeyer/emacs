(require 'ansi-color)
(require 'eshell)

(setq shell-file-name "bash")

(defun eshell-hostname ()
  (if (string-match "^/[a-z]+:\\([a-z0-9]+\\):/.*" (eshell/pwd))
      (match-string 1 (eshell/pwd))
    (system-name)
    )
  )


(setq eshell-prompt-function
      (lambda()
        (concat
         (propertize (eshell-hostname) 'face `(:foreground "#00ee00"))
         (propertize " @ " 'face `(:foreground "#dedede"))
         (propertize (replace-regexp-in-string "^.*/" "" (eshell/pwd))
                     'face `(:foreground "#1e90ff"))
         (propertize " $" `face `(:foreground "#dedede"))
         (propertize " " `face `(:foreground "#eedc82"))
         )))


(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))
(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))


(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

(provide 'setup-eshell)
