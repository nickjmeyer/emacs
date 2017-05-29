(load "auctex.el" nil t t)
(require 'tex-site)

;; to use pdfview with auctex
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;       TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
;;       TeX-source-correlate-start-server t) ;; not sure if last line is
;;                                            ;; neccessary

;; to have the buffer refresh after compilation
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

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
