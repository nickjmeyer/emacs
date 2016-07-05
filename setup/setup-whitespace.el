(require 'whitespace)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (whitspace-mode 1)))

;; show whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

;; highlight lines over 80 characters
(setq whitespace-line-column 80)
(setq whitespace-style '(lines face trailing))

(provide 'setup-whitespace)