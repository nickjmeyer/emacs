(load "auctex.el" nil t t)
(require 'tex-site)


(add-hook 'LaTeX-mode-hook '(lambda ()
                              (auto-fill-mode 1)))
(add-hook 'LaTeX-mode-hook '(lambda()
                              (flyspell-mode t)))
(add-hook 'LaTeX-mode-hook '(lambda ()
                              (setq auto-fill-function
                                    'LaTeX-fill-paragraph)))

(setq TeX-newline-function 'reindent-then-newline-and-indent)

(setq LaTeX-item-indent 0)

(setq LaTeX-break-at-separators '(\\\( \\\) \\\[ \\\] \\\{
                                  \\\} "$"))

(setq reftex-file-extensions
      '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)

(provide 'setup-auctex)
