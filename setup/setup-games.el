;; Setup game configurations
(provide 'setup-games)

(if (and (file-exists-p "~/Dropbox") (file-writable-p "~/Dropbox"))
    (progn
      (unless (file-exists-p "~/Dropbox/.emacs-games")
        (make-directory "~/Dropbox/.emacs-games"))
      (setq tetris-score-file "~/Dropbox/.emacs-games/tetris-scores")
      (setq snake-score-file "~/Dropbox/.emacs-games/snake-scores")
      )
  (unless (file-exists-p "~/.emacs-games")
    (make-directory "~/.emacs-games"))
  (setq tetris-score-file "~/.emacs-games/tetris-scores")
  (setq snake-score-file "~/.emacs-games/snake-scores")
  )

