(require 'google-c-style)

;; Use c++ mode instead of c mode for *.h files.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Add google style to the list of c styles."
(c-add-style "google-c-style" google-c-style)

(defconst my-cc-style
  '("google-c-style"
    ;; Use google style as base.
    (c-set-offset 'access-label -2)
    (c-set-offset 'member-init-intro 2)
    (c-set-offset 'arglist-intro 2)
    ;; (c-set-offset 'arglist-cont-nonempty 2)
    ;; FIXME (c-set-offset 'statement-cont 2)
    ))
(c-add-style "my-cc-style" my-cc-style)

(setq c-default-style "my-cc-style")

;; Modify extensions for switching between source and header
(if (assoc "hh" projectile-other-file-alist)
    (setcdr (assoc "hh" projectile-other-file-alist) '("inl" "cpp" "cc"))
  (add-to-list 'projectile-other-file-alist '("hh" "inl" "cpp" "cc"))
  )
(if (assoc "inl" projectile-other-file-alist)
    (setcdr (assoc "inl" projectile-other-file-alist) '("hh" "hpp" "h"))
  (add-to-list 'projectile-other-file-alist '("inl" "hh" "hpp" "h"))
  )

(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))


;; Cuda mode
(autoload 'cuda-mode "cuda-mode.el")
(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

;; Cmake mode
(use-package cmake-mode
             :ensure t
             :config
             (setq auto-mode-alist
                   (append
                    '(("CMakeLists\\.txt\\'" . cmake-mode))
                    '(("\\.cmake\\'" . cmake-mode))
                    auto-mode-alist))
             (add-hook 'cmake-mode-hook (lambda () (setq indent-tabs-mode nil)))
             )

(require 'cc-mode)

;; Generic doxygen formatting
(defconst custom-font-lock-doc-comments
  (let ((symbol "[a-zA-Z0-9_]+"))
    `((,(concat "</?\\sw"           ; HTML tags.
                "\\("
                (concat "\\sw\\|\\s \\|[=\n\r*.:]\\|"
                        "\"[^\"]*\"\\|'[^']*'")
                "\\)*>")
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat "\'" symbol "\'") ; 'symbol'
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat "\`" symbol "\`") ; `symbol`
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat "\`\`" symbol "\`\`") ``symbol``
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat "[\\@][^[:space:]]+") ; \doxy OR @doxy
       0 ,c-doc-markup-face-name prepend nil)
      (,(concat "#" symbol) ; #some_c_synbol
       0 ,c-doc-markup-face-name prepend nil)
      )
    ))
;; Matches across multiple lines:
;;   /** doxy comments */
;;   /*! doxy comments */
;;   /// doxy comments
;; Doesn't match:
;;   /*******/
(defconst custom-font-lock-keywords
  `((,(lambda (limit)
        (c-font-lock-doc-comments "/\\(//\\|\\*[\\*!][^\\*!]\\)"
            limit custom-font-lock-doc-comments)))))

(use-package modern-cpp-font-lock
  :ensure t
  :config
  (add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
  )

;; Fix indentation around ~if constepxr~.  This is fixed in Emacs26.
(custom-set-variables '(c-noise-macro-names '("constexpr")))

(provide 'setup-c-cpp)
