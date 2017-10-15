;; Setup company completion framework
(provide 'setup-company)

(global-company-mode)

;; Setup rtags
(if (package-installed-p 'rtags)
    (progn
      (require 'rtags)
      (require 'company-rtags)
      )
  )

;; Use helm when using manual completion
(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-;") 'helm-company)
     (define-key company-active-map (kbd "C-;") 'helm-company)))

;; (setq company-backends (delete 'company-clang company-backends))

(if (executable-find "global")
    (progn
      (require 'company-gtags)
      (require 'helm-gtags)
      )
  )
