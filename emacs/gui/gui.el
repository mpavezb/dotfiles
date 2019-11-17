(tool-bar-mode -1)
(menu-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq server-mode t)

					; Display buffername in the title bar
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
  :diminish which-key-mode 
  :init (which-key-mode) 
  :config (which-key-setup-side-window-bottom) 
  (setq which-key-idle-delay 3.0))


;; -----------------------------------------------------------------------------
;; misc
;; -----------------------------------------------------------------------------

;; fireplace
;; Displays a virtual fireplace
;; https://github.com/johanvts/emacs-fireplace
(use-package fireplace)

;; xkcd
;; xkcd reader for GNU Emacs.
;; https://github.com/vibhavp/emacs-xkcd
(use-package xkcd)

;; wttrin
;; Weather from wttr.in
;; https://github.com/bcbcarl/emacs-wttrin
(use-package wttrin 
  :commands (wttrin) 
  :init (setq wttrin-default-cities '("Unterschleissheim")))

;; -----------------------------------------------------------------------------
;; misc
;; Waiting for emacs26
;; -----------------------------------------------------------------------------
;; (use-package dashboard
;;   :config (dashboard-setup-startup-hook))
