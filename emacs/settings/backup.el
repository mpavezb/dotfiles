
;; ===============================================================
;; cmake-ide
;; ===============================================================

;; Company (Code Completion)
;; ---------------------------------------------------------------
;; (use-package company)
;; (progn
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
;;   (setq company-idle-delay 0)
;; )

;; Flycheck
;; ---------------------------------------------------------------
;; (use-package flycheck)
;; (progn
;;   (global-flycheck-mode)
;; )

;; Irony
;; ---------------------------------------------------------------
;; (use-package irony)
;; (progn
;;   ; If irony server was never installed, install it.
;;   (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

;;   ; C/C++ hooks
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)

;;   (defun mp/my-irony-mode-hook ()
;;     (define-key irony-mode-map [remap completion-at-point]
;;       'irony-completion-at-point-async)
;;     (define-key irony-mode-map [remap complete-symbol]
;;       'irony-completion-at-point-async))
;;   (add-hook 'irony-mode-hook 'mp/my-irony-mode-hook)

;;   ;; Use compilation database first, clang_complete as fallback.
;;   (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
;;                                                   irony-cdb-clang-complete))

;;   ; autosetup
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; )

;; (company-irony integration): Code completion.
;; including C++ headers integration.
;; (use-package company-irony)
;; (use-package company-irony-c-headers)
;; (progn
;;   (eval-after-load 'company
;;     '(add-to-list
;;       'company-backends '(company-irony-c-headers company-irony)))
;; )

;; ;; (flycheck-irony integration): Syntax Checking
;; (use-package flycheck-irony)
;; (progn
;;   (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; )

;; (eldoc-irony integration): Display fn args in echo area.
;; obs: Located in melpa repository (not in melpa-stable).
;(use-package irony-eldoc)
;(progn
;  (add-hook 'irony-mode-hook #'irony-eldoc)
;)

;; RTags
;; ---------------------------------------------------------------
;; (use-package rtags)
;; (progn
;;   (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
;;   (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))
  
;;   (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
;;   (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
;;   (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
;;   (rtags-enable-standard-keybindings)

;;   ;; Shutdown rdm when leaving emacs.
;;   (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
;; )

;; ;; (helm-rtags integration):
;; ;; TODO: Has no coloring! How can I get coloring?
;; (use-package helm-rtags)
;; (progn
;;   (setq rtags-display-result-backend 'helm)
;; )

;; ;; (company-rtags integration): Auto-completion.
;; ;(use-package company-rtags)
;; ;(progn
;; ;  (setq rtags-autostart-diagnostics t)
;; ;  (rtags-diagnostics)
;; ;  (setq rtags-completions-enabled t)
;; ;  (push 'company-rtags company-backends)
;; ;  ;(rtags-enable-standard-keybindings)
;; ;)

;; ;; Live code checking.
;; (use-package flycheck-rtags)
;; (progn
;;   ;; ensure that we use only rtags checking
;;   ;; https://github.com/Andersbakken/rtags#optional-1
;;   (defun mp/setup-flycheck-rtags ()
;;     (flycheck-select-checker 'rtags)
;;     (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;     (setq-local flycheck-check-syntax-automatically nil)
;;     (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;   )
;;   (add-hook 'c-mode-hook #'mp/setup-flycheck-rtags)
;;   (add-hook 'c++-mode-hook #'mp/setup-flycheck-rtags)
;; )






;; ;(use-package levenshtein)1
;; ;(cmake-ide-setup)



