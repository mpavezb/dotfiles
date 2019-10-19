;; Treat all themes as safe; no query before use.
(setf custom-safe-themes t)

;; Nice looking themes ^_^
(use-package 
  solarized-theme 
  :demand t)
(use-package 
  doom-themes  
  :demand t)

(defun mp/disable-all-themes () 
  (dolist (th custom-enabled-themes) 
    (disable-theme th)))

(defun mp/load-dark-theme () 
  (mp/disable-all-themes) 
  (load-theme 'doom-vibrant))

(defun mp/load-light-theme () 
  (load-theme 'solarized-light) 
  (load-theme 'doom-solarized-light))

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
(load-theme 'doom-vibrant t)
