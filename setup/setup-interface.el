;; Setup emacs interface
(provide 'setup-interface)

;; Get rid of mouse while typing
(setq mouse-avoidance-mode 'banish)

;; Turn off system bell
(setq ring-bell-function 'ignore)

;; Cleanup interface
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode)
(setq column-number-mode t)

;; Make mode line more appealing
(require 'smart-mode-line)
(require 'powerline)
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)

(add-hook 'after-init-hook 'sml/setup)
