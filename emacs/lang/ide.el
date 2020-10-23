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
;; lsp-mode
;; Emacs client/library for the Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode
;; -----------------------------------------------------------------------------
;; See: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(use-package lsp-mode 
  :hook (
	 ;; (python-mode . lsp-deferred)
	 (c-mode . lsp-deferred) 
	 (c++-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)) 
  :init
  ;; if you want to change prefix for lsp-mode keybindings.
  (setq lsp-keymap-prefix "C-c l")

  ;; C/C++
  ;; Debug: "-log=verbose" "-query-driver=/usr/bin/c++"
  ;; See:
  ;; - https://clangd.llvm.org/
  ;; - man clangd
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
  :commands (lsp lsp-deferred) 
  :config ;;

  ;; Formatting
  ;; (setq indent-tabs-mode t) ;; use tabs
  ;; (setq c-basic-offset )    ;; control tab size in cc-mode derived modes.
  ;; (setq tab-width 4)        ;; control tab size in other modes.
  (add-hook 'before-save-hook 'lsp-format-buffer)

  ;; Completion
  (setq lsp-completion-provider 
	:none) 
  (setq lsp-completion-show-detail t) 
  (setq lsp-completion-show-kind t)

  ;; Syntax Checking
  (setq lsp-diagnostics-provider 
	:capf)

  ;; Documentation
  (setq lsp-eldoc-enable-hover t)	      ;; Minibuffer
  (setq lsp-signature-auto-activate t)	      ;; Signature help
  (setq lsp-signature-render-documentation t) ;; Signature help documentation

  ;; Lenses
  (setq lsp-lens-enable t)

  ;; Symbol Highlighting
  (setq lsp-enable-symbol-highlighting t)

  ;; Diagnostics
  (setq lsp-modeline-diagnostics-enable t) 
  (setq lsp-modeline-diagnostics-scope 
	:project)

  ;; Code Actions
  (setq lsp-modeline-code-actions-enable t) 
  (setq lsp-modeline-code-actions-segments '(count icon name))

  ;; Headerline
  (setq lsp-headerline-breadcrumb-enable t) 
  (setq lsp-headerline-breadcrumb-segments '(project file symbols)) 
  (setq lsp-headerline-breadcrumb-enable-symbol-numbers nil)

  ;; Performance
  (setq gc-cons-threshold (* 100 1024 1024)) 
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-prefer-capf t) 
  (setq lsp-idle-delay 0.1) ;; clangd is fast
  ;; (setq lsp-enable-file-watchers nil) ;; is this needed?

  ;;
  )


;; -----------------------------------------------------------------------------
;; lsp-ui
;; UI integrations for lsp-mode
;; https://github.com/emacs-lsp/lsp-ui
;; -----------------------------------------------------------------------------
;; TODO: restrict some UI features.
(use-package lsp-ui 
  :after lsp-mode 
  :config ;;
  ;; Documentation Popup
  (setq lsp-ui-doc-enable nil) 
  (setq lsp-ui-doc-show-with-cursor nil) 
  (setq lsp-ui-doc-show-with-mouse nil)

  ;; Sideline
  (setq lsp-ui-sideline-enable t) 
  (setq lsp-ui-sideline-show-hover t) 
  (setq lsp-ui-sideline-show-diagnostics t)
  ;;
  )

;; -----------------------------------------------------------------------------
;; helm-lsp
;; Helm / LSP integration
;; https://github.com/emacs-lsp/helm-lsp
;; -----------------------------------------------------------------------------
;; TODO: is this working?
(use-package helm-lsp 
  :after lsp-mode 
  :init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

;; -----------------------------------------------------------------------------
;; lsp-treemacs
;; LSP / Treemacs integration
;; https://github.com/emacs-lsp/lsp-treemacs
;; -----------------------------------------------------------------------------
(use-package lsp-treemacs 
  :after lsp-mode 
  :config ;;
  (setq lsp-treemacs-sync-mode t) 
  (setq treemacs-space-between-root-nodes nil))

;; -----------------------------------------------------------------------------
;; dap-mode
;; Emacs Debug Adapter Protocol
;; https://github.com/emacs-lsp/dap-mode
;; -----------------------------------------------------------------------------
(use-package dap-mode 
  :after lsp-mode 
  :config ;;
  (require 'dap-cpptools))

;; (use-package dap-cpptools
;;   :after dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; -----------------------------------------------------------------------------
;; yasnippet
;; A template system for Emacs
;; https://github.com/joaotavora/yasnippet
;; -----------------------------------------------------------------------------
(use-package yasnippet 
  :hook (prog-mode . yas-minor-mode) 
  :config ;;
  (define-key yas-minor-mode-map (kbd "C-c C-y") #'yas-insert-snippet) 
  (yas-reload-all))

;; -----------------------------------------------------------------------------
;; yasnippet-snippets
;; A collection of yasnippet snippets for many languages
;; https://github.com/AndreaCrotti/yasnippet-snippets
;; -----------------------------------------------------------------------------
(use-package yasnippet-snippets 
  :after yasnippet)
