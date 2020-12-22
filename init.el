(require 'package)
(setq package-signature-check nil)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
      (package-install 'use-package))

;; (add-to-list 'load-path "~/.emacs.d/cc-mode-5.33")
(add-to-list 'load-path "~/.emacs.d/setup")
(add-to-list 'custom-theme-load-path "~/.emacs.d/steup")


(use-package gnu-elpa-keyring-update
  :ensure t)

(require 'setup-basic-emacs)

;; Better undo
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1))

;; Trim down the mode line
(use-package diminish
  :ensure t)

(use-package cl
  :ensure t)

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode)
      :config (setq doom-modeline-height 15)
)

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-molokai t))

(use-package flycheck
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package flycheck-demjsonlint
  :ensure t
  :pin melpa)

(use-package yaml-mode
  :ensure t)

(use-package flycheck-yamllint
  :ensure t)

(use-package markdown-mode
  :ensure t
)

(use-package bazel-mode
  :ensure t
  :config
  (setq auto-mode-alist
        (append
         '(("BUILD\\'" . bazel-mode))
         auto-mode-alist))
  )

(add-to-list 'auto-mode-alist '("\\.asl\\'" . python-mode))

;; Formatting stuff
(setq mode-require-final-newline t)      ;; add a newline to end of file
(setq-default tab-width 2) ;; default to 2 visible spaces to display a tab
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; (use-package aggressive-indent
;;   :ensure t
;;   :diminish aggressive-indent-mode
;;   :config
;;   (global-aggressive-indent-mode 1))

;; Trying out Ivy
(require 'setup-ivy)

;; Evil mode because my pinky gets tired...
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init)
  (require 'evil-collection-ivy))



(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode 1))

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/bin/bash")
  (global-set-key (kbd "C-x t") #'multi-term-dedicated-toggle))

;; Games are fun...
(unless (file-exists-p "~/.emacs-games")
  (make-directory "~/.emacs-games"))
(setq tetris-score-file "~/.emacs-games/tetris-scores")
(setq snake-score-file "~/.emacs-games/snake-scores")

;; Complete Anything
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-backends nil)
  (add-to-list 'company-backends 'company-elisp))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-compilation-cmd ""))

;; Set up for C and C++ languages
(require 'setup-c-cpp)

;; Set up for python
(require 'setup-python)

;; Set up git
(require 'setup-git)

(use-package transient
  :ensure t)

(use-package ess
  :ensure t)

(defun counsel-projectile-ag-noaffinity (orig-fun &rest options)
  (interactive)
  (message "called with args %s" options)
  (apply orig-fun (push "--noaffinity" options))
  )

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode)
  (advice-add 'counsel-projectile-ag :around #'counsel-projectile-ag-noaffinity)
  )


(use-package hydra
  :ensure t)

(use-package docker-tramp
  :ensure t)

(use-package eyebrowse
  :ensure t
  :config
  (eyebrowse-mode)
  (setq eyebrowse-new-workspace t)
   )

(require 'setup-movement)

;; use ssh config in tramnp
(require 'tramp)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))

(require 'setup-org)

;; (use-package spinner
;;   :ensure t)

;; (use-package lsp-mode
;;   :ensure t
;;   :hook (c++-mode . lsp)
;;   :commands lsp)

;; ;; optionally
;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)


(use-package rust-mode
  :ensure t)

;; customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))

(defun njm/show-font-size ()
  (interactive)
  (message (format "Font size: %d"
                   (face-attribute 'default :height)))
  )

(defun njm/set-font-size (height &optional frame)
  (interactive
   (list
    (read-number "Enter font size: ")))
  (set-face-attribute 'default frame :height height)
  (njm/show-font-size)
  )

(defun njm/increase-font-size ()
  (interactive)
  (njm/set-font-size
   (+ (face-attribute 'default :height) 5)
   (selected-frame))
  )

(defun njm/decrease-font-size ()
  (interactive)
  (njm/set-font-size
   (- (face-attribute 'default :height) 5)
   (selected-frame))
  )

(defun njm/laptop-setup ()
  (interactive)
  (message "Begin setup for laptop")
  (njm/set-font-size 120 (selected-frame))
  (message "Laptop setup complete")
  )

(defun njm/external-setup ()
  (interactive)
  (message "Begin setup for external")
  (njm/set-font-size 160 (selected-frame))
  (message "External setup complete")
  )

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point-max))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)


(defun njm/kill-file-path ()
  "Copy file path to kill ring."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name)
                    )
                  )
        )
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename)
      )
    )
  )
(global-set-key (kbd "C-c f") #'njm/kill-file-path)


;; (defun colorize-entire-compilation (buffer desc)
;;   "Colorize from `compilation-filter-start' to `point'."
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region (point-min) (point-max))))

;; (add-hook 'compilation-finish-functions
;;           #'colorize-entire-compilation)

(setq compilation-scroll-output t)

(defun plain-pipe-for-process () (progn
                                   (setq-local process-connection-type nil)
                                   (setq-local tramp-process-connection-type nil)))
(add-hook 'compilation-mode-hook 'plain-pipe-for-process)

(use-package groovy-mode
  :ensure t)

(put 'downcase-region 'disabled nil)

(njm/set-font-size 95)
(put 'dired-find-alternate-file 'disabled nil)
(put 'magit-clean 'disabled nil)
