;;; package --- Summary
;;; Commentary:
;;; Code:

;; -----------------------------------------------------------------------------
;; company-mode
;; Modular in-buffer completion framework for Emacs
;; https://github.com/company-mode/company-mode
;; -----------------------------------------------------------------------------
(use-package company-mode 
  :hook (after-init . global-company-mode) 
  :config ;;
  (setq company-minimum-prefix-length 1) 
  (setq company-idle-delay 0.0) ;; default is 0.2
  ;;   (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
  )

;; -----------------------------------------------------------------------------
;; flycheck
;; On the fly syntax checking for GNU Emacs
;; https://github.com/flycheck/flycheck
;; -----------------------------------------------------------------------------
(use-package flycheck 
  :hook (prog-mode . global-flycheck-mode) 
  :config ;;

  ;;
  )

;; -----------------------------------------------------------------------------
;; lsp-mode
;; Emacs client/library for the Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode
;; -----------------------------------------------------------------------------
(use-package lsp-mode 
  :hook (
	 ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 ;;(XXX-mode . lsp-deferred)
	 ;; if you want which-key integration
	 (c++-mode . lsp-deferred) 
	 (lsp-mode . lsp-enable-which-key-integration)) 
  :commands (lsp lsp-deferred) 
  :config ;;

  ;; if you want to change prefix for lsp-mode keybindings.
  ''(setq lsp-keymap-prefix "s-l")

  ;; prog-mode-hook, c++, java, ...
  ;;(add-hook 'XXX-mode-hook #'lsp)
  ;;(add-hook 'XXX-mode-hook #'lsp-deferred)
  ;;

  ;; Formatting
  ;; TAB SIZE: c-basic-offset (for cc-mode derived), tab-width
  ;; indent-tabs-mode: tabs vs. spaces
  )

;; use this to disable the format hook
;; (remove-hook  'before-save-hook 'mp/lisp-mode-before-save-hook)


;; TODO
;; lsp-ui
;; lsp-treemacs
;; helm-lsp
;; dap-mode
;; optionally

(use-package lsp-ui 
  :commands lsp-ui-mode)
(use-package helm-lsp 
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs 
  :commands lsp-treemacs-errors-list)
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;;
