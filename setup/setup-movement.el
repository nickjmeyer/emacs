(use-package hydra
  :ensure t)

;; A hydra to improve window navigation.  Acts as a mini evil mode like thing.
(defhydra hydra-move-window (global-map "C-x m")
  "move-window"
  ("h" windmove-left "left")
  ("j" windmove-down "down")
  ("k" windmove-up "up")
  ("l" windmove-right "right")
  ("<return>" nil "exit")
  )

;; A hydra to resize windows.
(defhydra hydra-resize-window (global-map "C-x r")
  "resize-window"
  ("h" evil-window-decrease-width "decrease width")
  ("j" evil-window-decrease-height "decrease height")
  ("k" evil-window-increase-height "increase height")
  ("l" evil-window-increase-width "increase width")
  ("<return>" nil "exit")
  )

(provide 'setup-movement)
