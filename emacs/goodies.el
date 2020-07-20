;; fireplace
;; Displays a virtual fireplace
;; https://github.com/johanvts/emacs-fireplace
(use-package fireplace 
  :commands fireplace)

;; xkcd
;; xkcd reader for GNU Emacs.
;; https://github.com/vibhavp/emacs-xkcd
(use-package xkcd 
  :commands xkcd)

;; wttrin
;; Weather from wttr.in
;; https://github.com/bcbcarl/emacs-wttrin
(use-package wttrin 
  :commands wttrin 
  :init (setq wttrin-default-cities '("Unterschleissheim")))

;; google-this
;; Google search under point
;; https://github.com/Malabarba/emacs-google-this
;; See: C-c / C-h
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