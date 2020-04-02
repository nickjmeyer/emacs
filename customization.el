(message "Loading customization file")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-noise-macro-names (quote ("constexpr")))
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(package-selected-packages
   (quote
    (tramp lsp-mode eyebrowse gnu-elpa-keyring-update rust-mode docker-tramp docker-tamp python-docstring evil-collection ztree yaml-mode use-package powerline-evil ox-reveal org-ref org-plus-contrib multi-term modern-cpp-font-lock magit-popup lsp-ui json-mode helm-rg helm-projectile helm-gtags helm-company helm-ag groovy-mode git-gutter-fringe ghub ggtags flycheck-yamllint flycheck-demjsonlint exec-path-from-shell evil-mc evil-magit ess doom-themes doom-modeline diminish company-lsp company-jedi cmake-mode ccls bazel-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(counsel--mark-ring-highlight ((t (:inherit highlight))))
 '(font-lock-comment-face ((t (:foreground "slate gray"))))
 '(font-lock-keyword-face ((t (:foreground "maroon2"))))
 '(ivy-current-match ((t (:inherit highlight :underline t))))
 '(show-paren-match ((t (:background "dark red" :foreground "gray" :weight ultra-bold)))))
