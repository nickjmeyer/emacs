;; Setup general editing features
(provide 'setup-editing)

(setq global-mark-ring-max 5000) ;; increase mark ring to contains 5000 entries
(setq mark-ring-max 5000) ;; increase mark ring to contains 5000 entries
(setq mode-require-final-newline t)      ;; add a newline to end of file
(setq-default tab-width 2) ;; default to 2 visible spaces to display a tab
(setq kill-ring-max 5000) ;; increase kill-ring capacity
(setq kill-whole-line t)  ;; if NIL, kill whole line and move the next line up

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(volatile-highlights-mode t)

(global-undo-tree-mode)

(yas-global-mode 1)

;; Jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)
