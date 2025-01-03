(require 'package)
(setq package-signature-check nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/setup")
(add-to-list 'custom-theme-load-path "~/.emacs.d/steup")

;; No idea if we should keep this or not.
;; (use-package gnu-elpa-keyring-update
;;   :ensure t)

(require 'setup-basic-emacs)

(use-package lua-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

;; Evil mode because my pinky gets tired...
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init))

;; Better undo
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree)
  (setq undo-tree-auto-save-history nil))

;; Trim down the mode line
(use-package diminish
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 15)
  (setq doom-modeline-icon nil)
  )

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-molokai t))

(use-package flycheck
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package flycheck-yamllint
  :ensure t)

(use-package markdown-mode
  :ensure t
  )

(use-package adoc-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package bazel
  :ensure t
  :config
  (setq auto-mode-alist
        (append
         '(("BUILD.*\\'" . bazel-mode))
         auto-mode-alist))
  )

;; Formatting stuff
(setq mode-require-final-newline t)      ;; add a newline to end of file
(setq-default tab-width 2) ;; default to 2 visible spaces to display a tab
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; Trying out Ivy
(require 'setup-ivy)

(use-package rg
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq compilation-read-command t)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-compilation-cmd ""))

;; Set up for C and C++ languages
(require 'setup-c-cpp)

;; Set up git
(require 'setup-git)

(use-package transient
  :ensure t)

(require 'setup-movement)

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

(setq compilation-scroll-output t)

(put 'downcase-region 'disabled nil)

(njm/set-font-size 95)
(put 'dired-find-alternate-file 'disabled nil)
(put 'magit-clean 'disabled nil)
