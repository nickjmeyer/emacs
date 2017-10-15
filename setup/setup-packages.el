;; Setup packages
(provide 'setup-packages)

;; Add package repositories
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Update packages
(package-initialize)
(package-refresh-contents)

;; Install use-package package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Install all remaining packages
(use-package tex
  :ensure auctex)
(use-package cl
  :ensure t)
(use-package cmake-mode
  :ensure t)
(use-package company
  :ensure t)
(use-package company-jedi
  :ensure t)
(use-package company-quickhelp
  :ensure t)
(use-package diminish
  :ensure t)
(use-package ess
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package evil
  :ensure t)
(use-package flycheck-irony
  :ensure t)
(use-package git-gutter-fringe
  :ensure t)
(use-package groovy-mode
  :ensure t)
(use-package helm
  :ensure t)
(use-package helm-company
  :ensure t)
(use-package helm-gtags
  :ensure t)
(use-package helm-projectile
  :ensure t)
(use-package htmlize
  :ensure t)
(use-package irony
  :ensure t)
(use-package jedi
  :ensure t)
(use-package julia-mode
  :ensure t)
(use-package magit
  :ensure t)
(use-package evil-magit
  :ensure t)
(use-package make-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package ox-reveal
  :ensure t)
(use-package org-ref
  :ensure t)
(use-package pdf-tools
  :ensure t)
(use-package protobuf-mode
  :ensure t)
(use-package powerline
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package smart-mode-line
  :ensure t)
(use-package tide
  :ensure t)
(use-package typescript-mode
  :ensure t)
(use-package comment-dwim-2
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package projectile
  :ensure t)
(use-package volatile-highlights
  :ensure t)
(use-package undo-tree
  :ensure t)
(use-package rtags
  :if (file-exists-p "~/rtags/install/")
  :init
  (setq rtags-path "~/rtags/install/bin/")
  (setq rtags-install-path "~/rtags/install/")
  (add-to-list 'load-path (concat rtags-install-path "share/emacs/site-lisp/rtags"))
  )
