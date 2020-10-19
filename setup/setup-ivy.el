(use-package ivy
  :ensure t
  :config
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus)
          (t . ivy--regex-ignore-order)))
  )
(use-package counsel
  :ensure t)
(use-package swiper
  :ensure t)
(use-package flx
  :ensure t)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)
(setq ivy-display-style 'fancy)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x d") 'counsel-dired)
(global-set-key (kbd "C-x d") 'counsel-dired)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(custom-set-faces
 '(ivy-current-match
   ((((class color) (background light))
     :background "blue" :foreground "white")
    (((class color) (background dark))
     :background "blue" :foreground "black"))))

(provide 'setup-ivy)
