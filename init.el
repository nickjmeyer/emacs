(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
      (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/cc-mode-5.33")
(add-to-list 'load-path "~/.emacs.d/setup")

(require 'setup-basic-emacs)

;; (use-package exwm
;;   :config
;;   (exwm-enable)
;;   (require 'setup-exwm))

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

;; Make mode line more appealing
(use-package powerline-evil
  :ensure t)
(use-package powerline
  :ensure t
  :config
  (powerline-evil-vim-theme))

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

;; Evil mode because my pinky gets tired...
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

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

;; Helm is a necessity
(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (require 'setup-helm))

(use-package ggtags
  :ensure t
  :config
  ;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
  (eval-after-load 'ggtags
    '(progn
       (evil-make-overriding-map ggtags-mode-map 'normal)
       ;; force update evil keymaps after ggtags-mode loaded
       (add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)))
  )
(use-package helm-gtags
  :ensure t)

;; Complete Anything
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-backends nil)
  (add-to-list 'company-backends 'company-elisp))
(use-package helm-company
  :ensure t)


(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map))

;; Set up for C and C++ languages
(require 'setup-c-cpp)

;; Set up for python
(require 'setup-python)

;; Set up git
(require 'setup-git)

(use-package ess
  :ensure t)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))

(use-package hydra
  :ensure t)


(require 'setup-movement)

;; use ssh config in tramnp
(require 'tramp)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))

(require 'setup-org)

;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp
;;   )

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp
;;   )
;; (use-package ccls
;;   :ensure t
;;   :config
;;   (setq ccls-executable "ccls.sh")
;;   (setq ccls-initialization-options '(:compilationDatabaseDirectory "/home/nmeyer/repos/av/.build.release.gnu/"))
;;   (add-hook 'c++-mode-hook (lambda ()
;;                             (lsp)))
;;   )

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
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

(setq compilation-scroll-output t)

;; (use-package groovy-mode
;;   :ensure t)

;; customization for current machine
(if (file-exists-p "~/.emacs.d/machineCustom.el")
    (load "~/.emacs.d/machineCustom.el")
  )
(put 'downcase-region 'disabled nil)

(njm/set-font-size 95)
(put 'dired-find-alternate-file 'disabled nil)
(put 'magit-clean 'disabled nil)
