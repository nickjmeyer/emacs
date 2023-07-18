(message "Loading customization file")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-noise-macro-names '("constexpr"))
 '(ivy-count-format "(%d/%d) ")
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t)
 '(package-selected-packages
   '(elpy cl yaml-mode use-package undo-tree rust-mode python-docstring multi-term modern-cpp-font-lock markdown-mode json-mode hydra groovy-mode gnu-elpa-keyring-update git-gutter-fringe flycheck-yamllint flx eyebrowse exec-path-from-shell evil-mc evil-magit evil-collection ess doom-themes doom-modeline docker-tramp diminish counsel-projectile company cmake-mode bazel-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "color-234" :foreground "#dfdfdf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(ivy-current-match ((((class color) (background light)) :background "blue" :foreground "white") (((class color) (background dark)) :background "blue" :foreground "black")))
 '(ivy-cursor ((t (:box (:line-width 2 :color "lime green")))))
 '(magit-diff-added ((t (:extend t :background "color-22" :foreground "color-41"))))
 '(magit-diff-added-highlight ((t (:extend t :background "color-22" :foreground "color-41" :weight bold))))
 '(vertical-border ((t (:background "color-238" :foreground "color-232")))))
