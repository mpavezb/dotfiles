;; Treat all themes as safe; no query before use.
(setf custom-safe-themes t)


;; -----------------------------------------------------------------------------
;; All the Icons
;; https://github.com/domtronn/all-the-icons.el
;; -----------------------------------------------------------------------------
(use-package all-the-icons)

;; -----------------------------------------------------------------------------
;; Doom Themes
;; https://github.com/hlissner/emacs-doom-themes
;; -----------------------------------------------------------------------------
(use-package doom-themes 
  :demand t 
  :config			  ;;
  (setq doom-themes-enable-bold t ;; if nil, bold is universally disabled
        doom-themes-enable-italic t) ;; if nil, italics is universally disabled

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;;
  )

;; -----------------------------------------------------------------------------
;; doom-modeline
;; A fancy and fast mode-line inspired by minimalism design.
;; https://github.com/seagle0128/doom-modeline
;; -----------------------------------------------------------------------------
(use-package doom-modeline 
  :ensure t 
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
  (setq doom-modeline-minor-modes nil)

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
  (setq doom-modeline-vcs-max-length 12) 
  (setq doom-modeline-github nil)  ; TODO: Use this
  (setq doom-modeline-github-interval (* 30 60))

  ;; misc
  (setq doom-modeline-unicode-fallback nil) 
  (setq doom-modeline-mu4e nil)		; email ; TODO: Try this
  (setq doom-modeline-gnus nil)		; news  ; TODO: Try this
  (setq doom-modeline-irc nil)		; irc   ; TODO: Trythis

  ;; perspective ; TODO: Use this
  (setq doom-modeline-persp-name nil) 
  (setq doom-modeline-display-default-persp-name nil) 
  (setq doom-modeline-persp-icon t)


  ;;
  )

(defun mp/disable-all-themes () 
  (dolist (th custom-enabled-themes) 
    (disable-theme th)))

(defun mp/load-dark-theme () 
  (mp/disable-all-themes) 
  (load-theme 'doom-vibrant))

(defun mp/load-light-theme () 
  (mp/disable-all-themes) 
  (load-theme 'doom-one-light))

;; “C-x t” to toggle between light and dark themes.
(defun mp/toggle-theme () 
  "Toggle between dark and light themes." 
  (interactive)
  ;; Load dark if light is top-most enabled theme, else load light.
  (if (equal (car custom-enabled-themes) 'doom-vibrant) 
      (mp/load-light-theme) 
    (mp/load-dark-theme)))
(global-set-key (kbd "C-x t") 'mp/toggle-theme)

;; Initially begin with the light theme.
(mp/load-dark-theme)
