(require 'google-c-style)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defconst my-cc-style
  '("google-c-style"
    ;; Use google style as base.  Add extra stuff below
    ))
(c-add-style "my-cc-style" my-cc-style)

(setq c-default-style "my-cc-style")

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

(provide 'setup-c-cpp)
