(if (and (file-exists-p "~/Dropbox") (file-writable-p "~/Dropbox"))
    (progn
      (unless (file-exists-p "~/Dropbox/Emacs")
        (make-directory "~/Dropbox/Emacs"))
      (setq tetris-score-file "~/Dropbox/Emacs/tetris-scores")
      (setq snake-score-file "~/Dropbox/Emacs/snake-scores")
      )
  (unless (file-exists-p "~/Emacs")
    (make-directory "~/Emacs"))
  (setq tetris-score-file "~/Emacs/tetris-scores")
  (setq snake-score-file "~/Emacs/snake-scores")
  )

(provide 'setup-games)
