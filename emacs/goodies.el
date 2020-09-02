
;; -----------------------------------------------------------------------------
;; zone
;; Chooses random modes to obfuscate the current buffer.
;; https://github.com/seagle0128/doom-modeline
;; -----------------------------------------------------------------------------
(use-package zone 
  :config (zone-when-idle 60))

;; -----------------------------------------------------------------------------
;; zone-select
;; Emacs "zone.el" program selection tool
;; https://github.com/kawabata/zone-select
;; -----------------------------------------------------------------------------
(use-package zone-select
  :config ;;
  (require 'zone)
  (zone-select-add-program 'zone-pgm-putz-with-case)
  (zone-select-add-program 'zone-pgm-paragraph-spaz)
  (zone-select-add-program 'zone-pgm-random-life)
  (zone-select-remove-program 'zone-pgm-jitter)
  (zone-select-remove-program 'zone-pgm-dissolve)
  (zone-select-remove-program 'zone-pgm-whack-chars)
  (zone-select-remove-program 'zone-pgm-rotate)
  (zone-select-remove-program 'zone-pgm-rotate-LR-lockstep)
  (zone-select-remove-program 'zone-pgm-rotate-RL-lockstep)
  (zone-select-remove-program 'zone-pgm-rotate-LR-variable)
  (zone-select-remove-program 'zone-pgm-rotate-RL-variable)
  (zone-select-remove-program 'zone-pgm-drip)
  (zone-select-remove-program 'zone-pgm-drip-fretfully)
  (zone-select-remove-program 'zone-pgm-five-oclock-swan-dive)
  (zone-select-remove-program 'zone-pgm-martini-swan-dive)
  (zone-select-remove-program 'zone-pgm-rat-race)
  (zone-select-remove-program 'zone-pgm-stress)
  (zone-select-remove-program 'zone-pgm-stress-destress)

  ;; ;;
  ;; (require 'zone-rainbow)
  ;; (zone-select-add-program 'zone-pgm-rainbow)

  ;; ;;
  ;; (add-to-list 'load-path (no-littering-expand-etc-file-name "zone-matrix"))
  ;; (require 'zone-matrix)
  ;; (require 'zone-matrix-settings)
  ;; ;;(require 'zone-settings)
  ;; (zone-select-add-program 'zone-matrix)

  ;;
  )

;; -----------------------------------------------------------------------------
;; fireplace
;; Displays a virtual fireplace
;; https://github.com/johanvts/emacs-fireplace
;; -----------------------------------------------------------------------------
(use-package fireplace 
  :commands fireplace)

;; -----------------------------------------------------------------------------
;; xkcd
;; xkcd reader for GNU Emacs.
;; https://github.com/vibhavp/emacs-xkcd
;; -----------------------------------------------------------------------------
(use-package xkcd 
  :commands xkcd)

;; -----------------------------------------------------------------------------
;; wttrin
;; Weather from wttr.in
;; https://github.com/bcbcarl/emacs-wttrin
;; -----------------------------------------------------------------------------
(use-package wttrin 
  :commands wttrin 
  :init (setq wttrin-default-cities '("Unterschleissheim")))

;; -----------------------------------------------------------------------------
;; google-this (C-c /)
;; Google search under point
;; https://github.com/Malabarba/emacs-google-this
;; -----------------------------------------------------------------------------
(use-package google-this
  :defer 60 
  :diminish google-this-mode 
  :config (google-this-mode t))

;; google-translate
;; Translate using google services
;; https://github.com/atykhonov/google-translate
(use-package google-translate
  ;; not used, installation problems
  :disabled 
  :init (use-package google-translate-smooth-ui 
	  :defer) 
  :bind ("C-c t" . google-translate-smooth-translate) 
  :config ;;

  ;; desired translations
  (setq google-translate-translation-directions-alist '(("de" . "en") 
							("en" . "ru")))

  ;; where to display the results
  ;; nil (other buffer), 'popup, 'kill-ring, 'echo-area, 'current-buffer
  (setq google-translate-output-destination 'popup)

  ;; show phonetics
  (setq google-translate-show-phonetic t)

  ;; focus on translation buffer when used
  (setq google-translate-pop-up-buffer-set-focus t)

  ;; automatic input methods
  (setq google-translate-preferable-input-methods-alist '((nil . ("en")) 
							  (ukrainian-programmer-dvorak . ("ru")) 
							  (german-prefix . ("de")))) 
  (setq google-translate-input-method-auto-toggling t))
