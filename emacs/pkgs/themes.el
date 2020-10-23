;; Treat all themes as safe; no query before use.
(setf custom-safe-themes t)

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
;; Theme picker
;; -----------------------------------------------------------------------------
;; TODO: minor mode/package

;; Doom Themes
(defvar mp/theme-list 
  '(doom-one doom-one-light doom-vibrant doom-acario-dark doom-acario-light doom-city-lights
	     doom-challenger-deep doom-dark+ doom-dracula doom-ephemeral doom-fairy-floss
	     doom-flatwhite doom-gruvbox doom-gruvbox-light doom-henna doom-horizon doom-Iosvkem
	     doom-laserwave doom-material doom-manegarm doom-miramare doom-molokai
	     doom-monokai-classic doom-monokai-pro doom-moonlight doom-nord doom-nord-light
	     doom-nova doom-oceanic-next doom-old-hope doom-opera doom-opera-light
	     doom-outrun-electric doom-palenight doom-plain doom-peacock doom-rouge doom-snazzy
	     doom-solarized-dark doom-solarized-light doom-sourcerer doom-spacegrey
	     doom-tomorrow-day doom-tomorrow-night doom-wilmersdorf))
(defvar mp/theme-list-banned '(doom-zenburn doom-mono-dark doom-tron))

(defun mp/theme-disable-all () 
  "Disable all currently enabled themes." 
  (interactive) 
  (mapc 'disable-theme custom-enabled-themes))

(defun mp/theme-select (theme-str) 
  "Select theme given the string name."
  (mp/theme-disable-all) 
  (load-theme (intern theme-str)))

(defun mp/theme-picker-completing-read () 
  "Allows selecting a theme using completing-read." 
  (interactive) 
  (mp/theme-select (completing-read "" mp/theme-list nil t)))

(defun mp/theme-picker--get-current-theme () 
  "Returns current theme name as a string, 'default otherwise."
  (if custom-enabled-themes (symbol-name (car custom-enabled-themes)) "default"))

(defun mp/theme-picker--prompt () 
  (format "(Initial Theme: %s) Pattern: " (mp/theme-picker--get-current-theme)))

(with-eval-after-load 'helm
  (defvar mp/theme-picker--helm-source 
    (helm-build-sync-source "Theme List" 
      :candidates 'mp/theme-list 
      :action 'mp/theme-select 
      :persistent-action 'mp/theme-select 
      :fuzzy-match t) 
    "Helm source for themes selection.")

  (defun mp/theme-picker-helm () 
    "Theme picker using Helm interface." 
    (interactive) 
    (helm :prompt (mp/theme-picker--prompt) 
	  :preselect (format "%s$" (mp/theme-picker--get-current-theme)) 
	  :sources mp/theme-picker--helm-source 
	  :buffer "*helm-themes*")))

;; -----------------------------------------------------------------------------
;; Toggle theme between Dark and Light
;; -----------------------------------------------------------------------------
;; TODO: toggle between light/dark themes.
;; TODO: define default dark and light themes.
;; TODO: avoid using strings

(defun mp/theme-load-dark () 
  (mp/theme-select "doom-dracula"))

(defun mp/theme-load-light () 
  (mp/theme-select "doom-one-light"))

(defun mp/theme-toggle () 
  "Toggle between dark and light themes." 
  (interactive)
  ;; Load dark if light is top-most enabled theme, else load light.
  (if (equal (car custom-enabled-themes) 'doom-dracula)
      (mp/theme-load-light) 
    (mp/theme-load-dark)))

;; Keybindings
(global-set-key (kbd "C-x M-t") 'mp/theme-toggle)
(global-set-key (kbd "C-x M-p") 'mp/theme-picker-helm)

;; Initially begin with the dark theme.
(mp/theme-load-dark)
