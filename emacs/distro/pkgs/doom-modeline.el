;; -----------------------------------------------------------------------------
;; All the Icons
;; https://github.com/domtronn/all-the-icons.el
;; -----------------------------------------------------------------------------
(use-package all-the-icons)

;; -----------------------------------------------------------------------------
;; doom-modeline
;; A fancy and fast mode-line inspired by minimalism design.
;; https://github.com/seagle0128/doom-modeline
;; -----------------------------------------------------------------------------
(use-package doom-modeline 
  :init (doom-modeline-mode 1) 
  :config ;;
  ;; size
  (setq doom-modeline-height 25) 
  (setq doom-modeline-bar-width 3)

  ;; buffername
  (setq doom-modeline-buffer-file-name-style 'auto)

  ;; icons only on GUI
  (setq doom-modeline-icon (display-graphic-p))

  ;; modes
  (setq doom-modeline-major-mode-icon t) 
  (setq doom-modeline-major-mode-color-icon nil) 
  (setq doom-modeline-minor-modes t)

  ;; buffer state
  (setq doom-modeline-buffer-state-icon t) 
  (setq doom-modeline-buffer-modification-icon nil)

  ;; word count
  (setq doom-modeline-enable-word-count t)
  ;; Major modes in which to display word count continuously.
  ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
  ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
  ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

  ;; checks
  (setq doom-modeline-checker-simple-format nil) 
  (setq doom-modeline-number-limit 99) 
  (setq doom-modeline-buffer-encoding t) 
  (setq doom-modeline-indent-info t)

  ;; languages
  (setq doom-modeline-lsp t) 
  (setq doom-modeline-env-version nil)

  ;; Repository
  ;; github requires `ghub' package.
  (setq doom-modeline-vcs-max-length 50) 
  (setq doom-modeline-github nil) ;; TODO: Use this
  (setq doom-modeline-github-interval (* 30 60))

  ;; misc
  (setq doom-modeline-unicode-fallback nil) 
  (setq doom-modeline-mu4e nil)	;; email ; TODO: Try this
  (setq doom-modeline-gnus nil)	;; news  ; TODO: Try this
  (setq doom-modeline-irc nil)	;; irc   ; TODO: Trythis

  ;; perspective ; TODO: Use this
  (setq doom-modeline-persp-name nil) 
  (setq doom-modeline-display-default-persp-name nil) 
  (setq doom-modeline-persp-icon t)
  ;;
  )
