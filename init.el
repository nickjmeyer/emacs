(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst necessary-packages
  '(auctex
    anzu
    cl
    ;; cmake-ide
    cmake-mode
    company
    company-irony
    company-irony-c-headers
    company-jedi
    company-quickhelp
    duplicate-thing
    ess
    exec-path-from-shell
    flycheck-irony
    git-gutter-fringe
    groovy-mode
    helm
    helm-company
    helm-gtags
    helm-projectile
    helm-swoop
    irony
    jedi
    julia-mode
    magit
    make-mode
    markdown-mode
    protobuf-mode
    ;; function-args
    rtags
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

;; get path from shell environment
(exec-path-from-shell-initialize)


;; fix for max osx
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

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


;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/setup")

(require 'setup-auctex)
(require 'setup-dired)
(require 'setup-eshell)
(require 'setup-ess)
(require 'setup-faces)
(require 'setup-company)
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
(require 'setup-editing)


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

;; use ssh config in tramnp
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))


;; customization
(setq custom-file "~/.emacs.d/customization.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; get rid of mouse while typing
(setq mouse-avoidance-mode 'banish)

;; turn off system bell
(setq ring-bell-function 'ignore)

;; cleanup interface
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode)
(setq column-number-mode t)

;; setup cmake ide
;; (cmake-ide-setup)
;; (defun cmake-ide/c-c++-hook ()
;;   (with-eval-after-load 'projectile
;;     (setq cmake-ide-project-dir (projectile-project-root))
;;     (setq cmake-ide-build-dir (concat cmake-ide-project-dir "build"))))

;; (add-hook 'c-mode-hook (lambda ()
;;                          (local-set-key (kbd "C-c C-c") 'cmake-ide-compile)))
;; (add-hook 'c++-mode-hook (lambda ()
;;                            (local-set-key (kbd "C-c C-c") 'cmake-ide-compile)))

;; (add-hook 'c++-mode-hook #'cmake-ide/c-c++-hook)


;; (add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(require 'git-gutter-fringe)

;; customization for current machine
(if (file-exists-p "~/.emacs.d/machineCustom.el")
    (load "~/.emacs.d/machineCustom.el")
  )
(put 'downcase-region 'disabled nil)
