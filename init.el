(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)


(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; Emacs backup control
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacsBkups"))
      delete-old-versions t
      kept-new-versions 5
      version-control t)

;; abbrev mode
(setq abbrev-file-name  "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(setq-default abbrev-mode t)


(defalias 'yes-or-no-p 'y-or-n-p)

(defconst necessary-packages
  '(auctex
    anzu
    cmake-mode
    company
    company-jedi
    company-quickhelp
    duplicate-thing
    ess
    groovy-mode
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    jedi
    julia-mode
    magit
    make-mode
    markdown-mode
    protobuf-mode
    ;; function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    smartparens
    projectile
    volatile-highlights
    undo-tree
    zygospore))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package necessary-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/setup")

(require 'setup-auctex)
(require 'setup-dired)
(require 'setup-eshell)
(require 'setup-ess)
(require 'setup-faces)
(require 'setup-jedi)
(require 'setup-julia)
(require 'setup-magit)
(require 'setup-make)
(require 'setup-markdown)
(require 'setup-org)
(require 'setup-protobuf)
(require 'setup-games) ;; emacs games (e.g., snake and tetris)
(require 'setup-whitespace)

(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-cedet)
(require 'setup-editing)


(windmove-default-keybindings)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; company
(require 'company)
(if (display-graphic-p)
    (company-quickhelp-mode 1)
  (company-quickhelp-mode 0))
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map  [(control tab)] 'company-complete)
(define-key c++-mode-map  [(control tab)] 'company-complete)
(define-key c-mode-map  (kbd "C-TAB") 'company-complete)
(define-key c++-mode-map  (kbd "C-TAB") 'company-complete)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
;; (add-to-list 'company-backends 'company-c-headers)

;; hs-minor-mode for folding source code
;; (add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
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

;; automatically indent when press RET
(global-set-key (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

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

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)


;; customization
(setq custom-file "~/.emacs.d/customization.el")
(load custom-file)


;; get rid of mouse while typing
(setq mouse-avoidance-mode 'banish)

;; cleanup interface
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode)
(setq column-number-mode t)


;; (add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; customization for current machine
(if (file-exists-p "~/.emacs.d/machineCustom.el")
    (load "~/.emacs.d/machineCustom.el")
  )
