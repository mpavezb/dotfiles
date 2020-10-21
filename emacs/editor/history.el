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
