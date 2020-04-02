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

(defhydra hydra-change-desktop (global-map "C-x n")
  "move-window"
  ("c" eyebrowse-create-window-config "create")
  ("x" eyebrowse-close-window-config "close")
  ("l" eyebrowse-next-window-config "next")
  ("h" eyebrowse-prev-window-config "prev")
  ("<return>" nil "exit")
  )

;; For EXWM.  Figure out later how to fix this.
;; A hydra to improve window navigation.  Acts as a mini evil mode like thing.
;; (defhydra hydra-move-window (:pre (setq exwm-input-line-mode-passthrough t)
;;                                   :post (setq exwm-input-line-mode-passthrough nil)
;;                                   global-map "C-x m")
;;   "move-window"
;;   ("h" windmove-left "left")
;;   ("j" windmove-down "down")
;;   ("k" windmove-up "up")
;;   ("l" windmove-right "right")
;;   )

;; ;; A hydra to resize windows.
;; (defhydra hydra-resize-window (:pre (setq exwm-input-line-mode-passthrough t)
;;                                   :post (setq exwm-input-line-mode-passthrough nil)
;;                                   global-map "C-x r")
;;   "resize-window"
;;   ("h" evil-window-decrease-width "decrease width")
;;   ("j" evil-window-decrease-height "decrease height")
;;   ("k" evil-window-increase-height "increase height")
;;   ("l" evil-window-increase-width "increase width")
;;   )

(provide 'setup-movement)
