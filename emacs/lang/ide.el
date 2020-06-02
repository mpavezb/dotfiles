;; -----------------------------------------------------------------------------
;; company-mode
;; Modular in-buffer completion framework for Emacs
;; https://github.com/company-mode/company-mode
;; -----------------------------------------------------------------------------
(use-package company 
  :hook (after-init . global-company-mode) 
  :config ;;
  (setq company-minimum-prefix-length 1) 
  (setq company-idle-delay 0.0) 
  (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
  ;;
  )

;; -----------------------------------------------------------------------------
;; company-quickhelp
;; Documentation popup for Company
;; https://github.com/company-mode/company-quickhelp
;; -----------------------------------------------------------------------------
(use-package company-quickhelp 
  :after company-mode 
  :init (company-quickhelp-mode))

;; -----------------------------------------------------------------------------
;; flycheck
;; On the fly syntax checking for GNU Emacs
;; https://github.com/flycheck/flycheck
;; -----------------------------------------------------------------------------
(use-package flycheck 
  :hook (prog-mode . global-flycheck-mode) 
  :config ;;
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)) 
  (setq flycheck-emacs-lisp-load-path 'inherit)
  ;;
  ;; C++
  (add-hook 'c++-mode-hook (lambda () 
			     (setq flycheck-gcc-language-standard "c++11"))))


;; -----------------------------------------------------------------------------
;; lsp-mode
;; Emacs client/library for the Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode
;; -----------------------------------------------------------------------------
(use-package lsp-mode 
  :hook (
	 (c++-mode . lsp-deferred)
	 (python-mode . lsp-deferred) 
	 (lsp-mode . lsp-enable-which-key-integration))
  :init
  ;; if you want to change prefix for lsp-mode keybindings.
  (setq lsp-keymap-prefix "C-c l")
  :commands (lsp lsp-deferred) 
  :config ;;
  ;; Formatting
  ;; TAB SIZE: c-basic-offset (for cc-mode derived), tab-width
  ;; indent-tabs-mode: tabs vs. spaces
  )

(use-package lsp-ui 
  :commands lsp-ui-mode)
(use-package helm-lsp 
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs 
  :commands lsp-treemacs-errors-list)
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
