;; Treat all themes as safe; no query before use.
(setf custom-safe-themes t)

;; Nice looking themes ^_^
(use-package solarized-theme :demand t)
(use-package doom-themes  :demand t)
;; (use-package spacemacs-theme)
;; this gives me an error for some reason

(defun my/disable-all-themes ()
  (dolist (th custom-enabled-themes)
          (disable-theme th))
)

(defun my/load-dark-theme ()
  ;;   (load-theme 'spacemacs-dark)   ;; orginally
  (my/disable-all-themes)
  (load-theme 'doom-vibrant)
)

(defun my/load-light-theme ()
  ;;   (load-theme 'spacemacs-light)   ;; orginally
  ;; Recently I'm liking this ordered mixture.
  (load-theme 'solarized-light) (load-theme 'doom-solarized-light)
)

;; “C-x t” to toggle between light and dark themes.
(defun my/toggle-theme () "Toggle between dark and light themes."
  (interactive)
  ;; Load dark if light is top-most enabled theme, else load light.
  (if (equal (car custom-enabled-themes) 'doom-vibrant)
      (my/load-light-theme)
      (my/load-dark-theme)
  )

  ;; The dark theme's modeline separator is ugly.
  ;; Keep reading below regarding “powerline”.
  ;; (setq powerline-default-separator 'arrow)
  ;; (spaceline-spacemacs-theme)
)


(global-set-key (kbd "C-x t") 'my/toggle-theme)

;; Initially begin with the light theme.
;(load-theme 'spacemacs-light t)
