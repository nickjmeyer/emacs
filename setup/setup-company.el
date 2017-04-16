(require 'company)
;; (require 'company-rtags)

(global-company-mode)


;; (require 'helm-rtags)
;; (setq rtags-use-helm t)

;; (setq rtags-completions-enabled t)
;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)

;; (rtags-start-process-unless-running)

;; Enable semantics mode for auto-completion
(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

;; Increase the delay before activation
(setq semantic-idle-scheduler-idle-time 10)
;; Don't reparse really big buffers.
(setq semantic-idle-scheduler-max-buffer-size 100000)
;; Increase the delay before doing slow work to 2 minutes.
(setq semantic-idle-scheduler-work-idle-time 120)


;; Setup irony-mode to load in c-modes
(require 'irony)
(require 'company-irony-c-headers)
(require 'cl)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


(defun company-diag ()
        (interactive)
        (let* ((bb company-backends)
                backend
                (prefix (cl-loop for b in bb
                        thereis (let ((company-backend b))
                                (setq backend b)
                                (company-call-backend 'prefix))))
         cc)
    (when (stringp prefix)
      (setq cc (let ((company-backend backend))
                 (company-call-backend 'candidates prefix))))
                (pop-to-buffer (get-buffer-create "*company-diag*"))
                (setq buffer-read-only nil)
                (erase-buffer)
                (insert "company-backends: " (pp-to-string bb))
                (insert "\n")
                (insert "Used backend: " (pp-to-string backend))
                (insert "\n")
                (insert "Prefix: " (pp-to-string prefix))
                (insert "\n")
                (insert (message  "Candidates number: %i" (length cc)))
                (special-mode)))


;; irony-mode hook that is called when irony is triggered
(defun my-irony-mode-hook ()
  "Custom irony mode hook to remap keys."
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony setup, c-header completions
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; Remove company-semantic because it has higher precedance than company-clang
;; Using RTags completion is also faster than semantic, it seems. Semantic
;; also provides a bunch of technically irrelevant completions sometimes.
;; All in all, RTags just seems to do a better job.
(setq company-backends (delete 'company-semantic company-backends))
;; Enable company-irony and several other useful auto-completion modes
;; We don't use rtags since we've found that for large projects this can cause
;; async timeouts. company-semantic (after company-clang!) works quite well
;; but some knowledge some knowledge of when best to trigger is still necessary.
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony company-irony-c-headers company-clang
                                      ;; company-rtags company-semantic
                                      )
    )
  )



;; (defun my-disable-semantic ()
;;   "Disable the company-semantic backend."
;;   (interactive)
;;   (setq company-backends (delete '(company-irony-c-headers
;;                                    company-irony company-yasnippet
;;                                    company-clang company-rtags
;;                                    company-semantic) company-backends))
;;   (add-to-list
;;    'company-backends '(company-irony-c-headers
;;                        company-irony company-yasnippet
;;                        company-clang company-rtags))
;;   )
;; (defun my-enable-semantic ()
;;   "Enable the company-semantic backend."
;;   (interactive)
;;   (setq company-backends (delete '(company-irony-c-headers
;;                                    company-irony company-yasnippet
;;                                    company-clang) company-backends))
;;   (add-to-list
;;    'company-backends '(company-irony-c-headers
;;                        company-irony company-yasnippet company-clang))
;;   )

;; Zero delay when pressing tab
(setq company-idle-delay 0)
(define-key c-mode-map [(S-tab)] 'company-complete)
(define-key c++-mode-map [(S-tab)] 'company-complete)
;; Delay when idle because I want to be able to think
(setq company-idle-delay 0.2)

;; Prohibit semantic from searching through system headers. We want
;; company-clang to do that for us.
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(local project unloaded recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(local project unloaded recursive))


(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;; (require 'flycheck-rtags)

;; (defun my-flycheck-rtags-setup ()
;;   (flycheck-select-checker 'rtags)
;;   ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-highlighting-mode nil)
;;   (setq-local flycheck-check-syntax-automatically nil))
;; ;; c-mode-common-hook is also called by c++-mode
;; (add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
;; (add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


(provide 'setup-company)
