;; Install all remaining packages
(use-package tex
  :ensure auctex)
(use-package cmake-mode
  :ensure t)
(use-package company
  :ensure t)
(use-package company-jedi
  :ensure t)
(use-package company-quickhelp
  :ensure t)
(use-package ess
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
(use-package rtags
  :if (file-exists-p "~/rtags/install/")
  :init
  (setq rtags-path "~/rtags/install/bin/")
  (setq rtags-install-path "~/rtags/install/")
  (add-to-list 'load-path (concat rtags-install-path "share/emacs/site-lisp/rtags"))
  )
