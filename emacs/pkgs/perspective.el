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
