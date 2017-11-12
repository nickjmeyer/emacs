(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
      (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/setup")

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

;; Make mode line more appealing
(use-package powerline
  :ensure t
  :init
  (setq powerline-default-separator-dir '(right . left)))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/name-width 40)
  (setq sml/mode-width 'full))

(use-package smart-mode-line-powerline-theme
  :ensure t
  :after powerline
  :after smart-mode-line
  :config
  (sml/apply-theme 'powerline)
  (sml/setup)
  )

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

;; Formatting stuff
(setq mode-require-final-newline t)      ;; add a newline to end of file
(setq-default tab-width 2) ;; default to 2 visible spaces to display a tab
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; use space to indent by default
(setq-default indent-tabs-mode nil)
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :config
  (global-aggressive-indent-mode 1))

;; Evil mode because my pinky gets tired...
;; (use-package evil
;;   :ensure t
;;   :config
;;   (evil-mode 1))

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
  (helm-mode 1)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x b") #'helm-buffers-list)
  (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
  ;; Fuzzy matching
  (setq helm-buffers-fuzzy-matching t)
  ;; Open helm buffer inside current window to not disturb other windows
  (setq helm-split-window-in-side-p t))

;; Complete Anything
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-backends nil))
(use-package helm-company
  :ensure t)

;; Set up for C and C++ languages
(require 'setup-c-cpp)

;; Set up git
(require 'setup-git)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))

;; use ssh config in tramnp
(require 'tramp)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))


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
   (+ (face-attribute 'default (selected-frame) :height) 10)
   (selected-frame))
  )

(defun njm/decrease-font-size ()
  (interactive)
  (njm/set-font-size
   (- (face-attribute 'default (selected-frame) :height) 10)
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

(use-package groovy-mode
  :ensure t)

;; customization for current machine
(if (file-exists-p "~/.emacs.d/machineCustom.el")
    (load "~/.emacs.d/machineCustom.el")
  )
(put 'downcase-region 'disabled nil)
