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
  (global-set-key (kbd "C-<tab>") 'company-complete-common-or-cycle)
  ;;
  )

(use-package company-capf
  :straight nil
  :after company)

;; -----------------------------------------------------------------------------
;; hippie-expand
;; Allows expansion for autocompletion (given an interesting source)
;; https://www.emacswiki.org/emacs/HippieExpand
;; -----------------------------------------------------------------------------
;; Use hippie-expand as fallback
(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers
							    try-expand-dabbrev-from-kill
							    try-complete-file-name-partially
							    try-complete-file-name
							    try-expand-all-abbrevs
							    try-complete-lisp-symbol-partially
							    try-complete-lisp-symbol))
(global-set-key (kbd "M-/") 'hippie-expand)

;; -----------------------------------------------------------------------------
;; company-quickhelp
;; Documentation popup for Company
;; https://github.com/company-mode/company-quickhelp
;; -----------------------------------------------------------------------------
(use-package company-quickhelp
  :after company 
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
;; yasnippet
;; A template system for Emacs
;; https://github.com/joaotavora/yasnippet
;; -----------------------------------------------------------------------------
(use-package yasnippet
  :hook (prog-mode . yas-minor-mode) 
  :config (yas-reload-all))

;; -----------------------------------------------------------------------------
;; yasnippet-snippets
;; A collection of yasnippet snippets for many languages
;; https://github.com/AndreaCrotti/yasnippet-snippets
;; -----------------------------------------------------------------------------
(use-package yasnippet-snippets
  :after yasnippet)

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

  ;; Performance
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500)
  )


;; -----------------------------------------------------------------------------
;; lsp-ui
;; UI integrations for lsp-mode
;; https://github.com/emacs-lsp/lsp-ui
;; -----------------------------------------------------------------------------
(use-package lsp-ui
  :after lsp-mode 
  :commands lsp-ui-mode)


;; -----------------------------------------------------------------------------
;; helm-lsp
;; Helm / LSP integration
;; https://github.com/emacs-lsp/helm-lsp
;; -----------------------------------------------------------------------------
(use-package helm-lsp
  :after lsp-mode 
  :commands helm-lsp-workspace-symbol 
  :init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

;; -----------------------------------------------------------------------------
;; lsp-treemacs
;; LSP / Treemacs integration
;; https://github.com/emacs-lsp/lsp-treemacs
;; -----------------------------------------------------------------------------
(use-package lsp-treemacs
  :after lsp-mode 
  :commands lsp-treemacs-errors-list)

;; -----------------------------------------------------------------------------
;; dap-mode
;; Emacs Debug Adapter Protocol
;; https://github.com/emacs-lsp/dap-mode
;; -----------------------------------------------------------------------------
(use-package dap-mode
  :disabled)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
