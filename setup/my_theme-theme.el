(deftheme my_theme
  "Created 2019-04-25.")

(custom-theme-set-variables
 'my_theme
 '(c++-mode-hook nil)
 '(c-noise-macro-names (quote ("constexpr")))
 '(custom-safe-themes (quote ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(evil-shift-width 1))

(custom-theme-set-faces
 'my_theme
 '(default ((t (:inherit nil :stipple nil :background "gray20" :foreground "#eedc82" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil"))))
 '(company-scrollbar-bg ((t (:background "alternateSelectedControlColor"))))
 '(company-scrollbar-fg ((t (:background "dark slate blue"))))
 '(company-tooltip ((t (:background "MediumPurple4" :foreground "gray60"))))
 '(company-tooltip-annotation ((t (:foreground "DeepSkyBlue2"))))
 '(company-tooltip-common ((t (:foreground "chartreuse4"))))
 '(company-tooltip-selection ((t (:background "tomato4"))))
 '(font-lock-comment-face ((t (:foreground "red1"))))
 '(font-lock-constant-face ((t (:foreground "yellow1"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "IndianRed1"))))
 '(font-lock-function-name-face ((t (:foreground "cyan3"))))
 '(font-lock-keyword-face ((t (:foreground "chartreuse2"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "MediumPurple1"))))
 '(font-lock-string-face ((t (:foreground "HotPink1"))))
 '(font-lock-type-face ((t (:foreground "orange2"))))
 '(font-lock-variable-name-face ((t (:foreground "chocolate"))))
 '(magit-branch-local ((t (:foreground "light green"))))
 '(magit-branch-remote ((t (:foreground "deep sky blue"))))
 '(magit-hash ((t (:foreground "red3"))))
 '(magit-log-author ((t (:foreground "orange1"))))
 '(magit-section-heading ((t (:foreground "DarkGoldenrod1" :weight bold))))
 '(magit-section-heading-selection ((t (:background "gray32"))))
 '(magit-section-highlight ((t (:background "gray32"))))
 '(minibuffer-prompt ((t (:foreground "DarkOrange1"))))
 '(region ((t (:background "gray32"))))
 '(term-color-blue ((t (:background "dodger blue" :foreground "dodger blue"))))
 '(fringe ((t (:inherit default :foreground "gray10")))))

(provide-theme 'my_theme)
