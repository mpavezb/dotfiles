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

  ;; Do not set this to something like 0.1, because it will
  ;; interfere with every command you type!.
  (setq which-key-idle-delay 1) 
  (setq which-key-idle-secondary-delay 0.05))

;; (use-package switch-window
;;   :bind (("C-x o" . switch-window)))

;; -----------------------------------------------------------------------------
;; dashboard
;; An extensible emacs dashboard
;; https://github.com/emacs-dashboard/emacs-dashboard
;; -----------------------------------------------------------------------------
(defun mp/dashboard-banner ()
  """Set a dashboard banner including information on package initialization
   time and garbage collections."""
  (setq dashboard-banner-logo-title
        (format "Emacs ready in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)))

(use-package dashboard
  :init ;;
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'mp/dashboard-banner)
  :config ;;
  ;; Banner
  (setq dashboard-startup-banner 2)

  ;; Footer
  ;; (setq dashboard-footer-messages '("Dashboard is pretty cool!"))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (setq dashboard-set-footer t)

  ;; General
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-init-info t)
  ;; (setq dashboard-init-info "This is an init message!")

  ;; Sections
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

  ;; Icons
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))

  ;; Navigator
  ;; TODO: show link to emacs updates and News
  ;; TODO: show link to emacs profiling
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
	`(((,(all-the-icons-octicon "mark-github" :height 1.0 :v-adjust -0.1) "dotfiles" "" (lambda (&rest _) (browse-url "https://github.com/mpavezb/dotfiles")) error)
	   (,(all-the-icons-faicon "trello" :height 1.0 :v-adjust -0.1) "trello" "" (lambda (&rest _) (browse-url "https://trello.com/b/ZlHGhGUZ/tasks")) warning))))

  ;; Load it!
  (dashboard-setup-startup-hook))


;; -----------------------------------------------------------------------------
;; minions
;; A minor-mode menu for the mode line
;; https://github.com/tarsius/minions
;; -----------------------------------------------------------------------------
(use-package minions 
  :config (minions-mode 1))


