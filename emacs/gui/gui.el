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

;; Open Shell (f1) and Term (C-f1)
(global-set-key (kbd "<f1>") 'shell)
(setq explicit-shell-file-name "/bin/bash")
(define-key global-map (kbd "C-<f1>") 
  (lambda () 
    (interactive) 
    (ansi-term explicit-shell-file-name)))

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
  :config ;;
  (which-key-setup-side-window-bottom) 
  (setq which-key-idle-delay 0.1)
  (setq which-key-idle-secondary-delay 0.05))

;; (use-package switch-window
;;   :bind (("C-x o" . switch-window)))

;; -----------------------------------------------------------------------------
;; misc
;; Waiting for emacs26
;; -----------------------------------------------------------------------------
(use-package dashboard 
  :config (dashboard-setup-startup-hook))
