(tool-bar-mode -1)
(menu-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq server-mode t)

;; Display buffername in the title bar
(setq frame-title-format 
      '((:eval (if (buffer-file-name) 
		   (abbreviate-file-name (buffer-file-name)) "%b (•̀ᴗ•́)و"))))


(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; C-x C-0 restores the default font size

(add-hook 'text-mode-hook '(lambda () 
			     (visual-line-mode 1) 
			     (diminish 'visual-line-mode)))


;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Provides only the command “restart-emacs”.
(use-package restart-emacs 
  :commands restart-emacs)

;; Making it easier to discover Emacs key presses.
;; Emacs shows available key shortcuts while typing some command.
(use-package which-key 
  :defer 10 
  :diminish which-key-mode 
  :init (which-key-mode) 
  :config (which-key-setup-side-window-bottom) 
  (setq which-key-idle-delay 3.0))


(use-package switch-window 
  :bind (("C-x o" . switch-window)))

;; -----------------------------------------------------------------------------
;; misc
;; -----------------------------------------------------------------------------

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

;; -----------------------------------------------------------------------------
;; misc
;; Waiting for emacs26
;; -----------------------------------------------------------------------------
;; (use-package dashboard
;;   :config (dashboard-setup-startup-hook))
