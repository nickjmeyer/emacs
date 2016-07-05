(setq default-frame-background-color "#404040")
(setq default-frame-foreground-color "#eedc82")

(setq default-frame-alist
      '((background-color . default-frame-background-color)
        (foreground-color . default-frame-foreground-color)
        )
      )

(set-face-attribute 'default nil :height 90)

(provide 'setup-faces)
