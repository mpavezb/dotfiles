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
;; remember opened buffers
(desktop-save-mode 1)

;; Restore at most 30 buffers on startup
(setq desktop-restore-eager 20)

;; buffers not to save
(setq desktop-buffers-not-to-save (concat "\\(\\.log\\|^tags\\|^TAGS\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; Buffers not to clear (regex)
(add-to-list 'desktop-clear-preserve-buffers "README.md")
