(require 'org)
(require 'ox-html)
(require 'ob-sh)
(require 'ox-reveal)
(require 'htmlize)

(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "# This is a scratch Org buffer")

(add-hook 'org-mode-hook '(lambda ()
                            (auto-fill-mode 1)))
(add-hook 'org-mode-hook 'turn-on-flyspell)

(setq org-reveal-mathjax t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-html-postamble nil)
(setf org-highlight-latex-and-related '(latex))
(setf org-highlight-latex-fragments-and-specials t)
(setq org-export-latex-table-caption-above nil)
(setq org-export-html-table-caption-above nil)
;; (setq org-latex-listings t)
;; (add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(add-to-list 'org-latex-packages-alist '("" "amsmath"))
(add-to-list 'org-latex-packages-alist '("" "amssymb"))
(add-to-list 'org-latex-packages-alist '("" "dsfont"))
(add-to-list 'org-src-lang-modes
             '("html" . web))
(defun org-custom-link-img-follow (path &rest args)
  (org-open-file-with-emacs
   (format "../images/%s" path)))
(defun org-custom-link-img-export (path desc format &rest args)
  (message "hello")
  (message args)
  (cond
   ((eq format 'html)
    (format "<img src=\"/images/%s\" alt=\"%s\"/>" path desc))))
(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)

(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe class=\"youtube\""
          " width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat "https://www.youtube.com/embed/"
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (julia . t)
   (latex . t)
   (sh . t)
   ))

(setq org-publish-project-alist
      '(("webpage-org"
         :base-directory "~/nickjmeyer.github.io/_org/"
         :base-extension "org"
         :publishing-directory "~/nickjmeyer.github.io/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         :with-toc nil
         :section-numbers nil
         )
        ("webpage-static"
         :base-directory "~/nickjmeyer.github.io/_org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/nickjmeyer.github.io/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("webpage" :components ("webpage-org" "webpage-static"))
        ))
(setq org-babel-default-header-args
      (cons '(:exports . "both")
            (assq-delete-all :exports org-babel-default-header-args)))
(setq org-babel-default-header-args
      (cons '(:results . "output")
            (assq-delete-all :results org-babel-default-header-args)))

(provide 'setup-org)
