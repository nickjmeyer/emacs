(require 'markdown-mode)

(add-hook 'markdown-mode-hook '(lambda ()
                                 (auto-fill-mode 1)))
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.readme\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.README\\'" . gfm-mode))

(provide 'setup-markdown)
