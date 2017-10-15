(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
      (package-install use-package))


(add-to-list 'load-path "~/.emacs.d/setup")
(require 'setup-packages)
(require 'setup-basic-emacs)
(require 'setup-evil)
(require 'setup-interface)
(require 'setup-games)
(require 'setup-magit)
(require 'setup-helm)
(require 'setup-editing)
(require 'setup-company)
;; (require 'setup-auctex)
;; (require 'setup-dired)
;; (require 'setup-eshell)
;; (require 'setup-ess)
;; (require 'setup-faces)
;; (require 'setup-company)
;; (require 'setup-jedi)
;; (require 'setup-julia)
;; (require 'setup-make)
;; (require 'setup-markdown)
;; (require 'setup-org)
;; (require 'setup-protobuf)
;; (require 'setup-whitespace)
;; (require 'setup-typescript)

;; (require 'setup-helm)
;; (require 'setup-helm-gtags)


;; (require 'dired+)


;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")



(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defconst my-cc-style
  '("linux"
    (c-basic-offset . 4)
    (c-offsets-alist . ((innamespace . [0])
                        (arglist-intro . ++)
                        (arglist-close . ++)
                        (arglist-cont . 0)
                        (arglist-cont-nonempty . ++)))
    (c-block-comment-prefix . "* ")
    ))
(c-add-style "my-cc-style" my-cc-style)

(setq c-default-style "my-cc-style")

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; use ssh config in tramnp
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))


;; customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))


(require 'git-gutter-fringe)
(global-git-gutter-mode 1)
(setq git-gutter-fr:side 'right-fringe)


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

(require 'groovy-mode)


;; customization for current machine
(if (file-exists-p "~/.emacs.d/machineCustom.el")
    (load "~/.emacs.d/machineCustom.el")
  )
(put 'downcase-region 'disabled nil)
