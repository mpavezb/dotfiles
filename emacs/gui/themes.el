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
