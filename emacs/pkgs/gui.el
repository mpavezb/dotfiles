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

  ;; Do not set this to something like 0.1, because it will
  ;; interfere with every command you type!.
  (setq which-key-idle-delay 1) 
  (setq which-key-idle-secondary-delay 0.05))

;; (use-package switch-window
;;   :commands (switch-window))

;; -----------------------------------------------------------------------------
;; minions
;; A minor-mode menu for the mode line
;; https://github.com/tarsius/minions
;; -----------------------------------------------------------------------------
(use-package minions 
  :config (minions-mode 1))

;; -----------------------------------------------------------------------------
;; sublimity
;; Smooth-scrolling and minimap like sublime editor
;; https://github.com/zk-phi/sublimity
;; -----------------------------------------------------------------------------
(use-package sublimity
  :disabled
  :config ;;
  (require 'sublimity-map)
  (setq sublimity-map-size 20)
  (setq sublimity-map-fraction 0.3)
  (setq sublimity-map-text-scale -8)
  (sublimity-map-set-delay 0.1)

  ;; sublimity attractive (disable!)
  (setq sublimity-attractive-centering-width nil)
  (sublimity-mode 0))
