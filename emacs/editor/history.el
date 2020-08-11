;; -----------------------------------------------------------------------------
;; savehist
;; -----------------------------------------------------------------------------
(use-package savehist
  :init
  (setq savehist-file "~/.emacs.d/var/savehist.el")
  :config ;;
  (setq history-length 1000)
  (setq savehist-save-minibuffer-history t)
  (add-to-list 'savehist-additional-variables 'kill-ring)
  (add-to-list 'savehist-additional-variables 'search-ring)
  (add-to-list 'savehist-additional-variables 'regexp-search-ring)
  (add-to-list 'savehist-additional-variables 'last-kbd-macro)
  (add-to-list 'savehist-additional-variables 'kmacro-ring)
  (add-to-list 'savehist-additional-variables 'shell-command-history)
  (add-to-list 'savehist-additional-variables 'Info-history-list)
  (add-to-list 'savehist-additional-variables 'register-alist)
  (add-to-list 'savehist-additional-variables 'compilation-command)
  (add-to-list 'savehist-additional-variables 'kmacro-ring)
  (savehist-mode t)
  )

;; -----------------------------------------------------------------------------
;; saveplace
;; -----------------------------------------------------------------------------
;; remember point position when reopening/revisiting each buffer
(use-package saveplace 
  :config (setq-default save-place t))

;; -----------------------------------------------------------------------------
;; desktop.el
;; http://wikemacs.org/wiki/Desktop.el
;; -----------------------------------------------------------------------------
;; ;; remember opened buffers
;; (desktop-save-mode nil)

;; ;; Restore at most 30 buffers on startup
;; (setq desktop-restore-eager 20)

;; ;; buffers not to save
;; (setq desktop-buffers-not-to-save (concat "\\(\\.log\\|^tags\\|^TAGS\\)$"))
;; (add-to-list 'desktop-modes-not-to-save 'dired-mode)
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; ;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; ;; Buffers not to clear (regex)
;; (add-to-list 'desktop-clear-preserve-buffers "README.md")


;; -----------------------------------------------------------------------------
;; perspective
;; Perspectives for Emacs.
;; https://github.com/nex3/perspective-el
;; Whishlist: Restore eager.
;; Whishlist: Show perspectives in dashboard.
;; -----------------------------------------------------------------------------
;; Provides helm advice for buffer list.
(use-package perspective
  :config
  ;; enable mode
  (persp-mode t)

  ;; load session
  (setq persp-state-default-file (no-littering-expand-etc-file-name "perspective.el")) 
  (persp-state-load persp-state-default-file)

  ;; save on exit
  (add-hook 'kill-emacs-hook 'persp-state-save)
  ;;
  )

;; -----------------------------------------------------------------------------
;; persp-projectile
;; Projectile integration for perspective.el
;; https://github.com/bbatsov/persp-projectile
;; -----------------------------------------------------------------------------
(use-package persp-projectile 
  :after (perspective projectile))
