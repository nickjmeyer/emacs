(require 'julia-mode)
(setq inferior-julia-program-name
      (executable-find "julia")
      )
(message "Loading julia-mode")
(provide 'setup-julia)
