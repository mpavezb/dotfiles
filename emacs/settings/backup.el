
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; ===============================================================
;; Configuration
;; ===============================================================





;; hippie-expand
;; Allows expansion for autocompletion (given an interesting source)
;; https://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)



;; REGEX search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


;; misc
; force newline at EOF
(setq require-final-newline t)

; prefer spaces over tabs
(setq-default indent-tabs-mode nil)

;; ===============================================================
;; cmake-ide
;; ===============================================================

;; Company (Code Completion)
;; ---------------------------------------------------------------
;; (require 'company)
;; (progn
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
;;   (setq company-idle-delay 0)
;; )

;; Flycheck
;; ---------------------------------------------------------------
;; (require 'flycheck)
;; (progn
;;   (global-flycheck-mode)
;; )

;; Irony
;; ---------------------------------------------------------------
;; (require 'irony)
;; (progn
;;   ; If irony server was never installed, install it.
;;   (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

;;   ; C/C++ hooks
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)

;;   (defun my-irony-mode-hook ()
;;     (define-key irony-mode-map [remap completion-at-point]
;;       'irony-completion-at-point-async)
;;     (define-key irony-mode-map [remap complete-symbol]
;;       'irony-completion-at-point-async))
;;   (add-hook 'irony-mode-hook 'my-irony-mode-hook)

;;   ;; Use compilation database first, clang_complete as fallback.
;;   (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
;;                                                   irony-cdb-clang-complete))

;;   ; autosetup
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; )

;; (company-irony integration): Code completion.
;; including C++ headers integration.
;; (require 'company-irony)
;; (require 'company-irony-c-headers)
;; (progn
;;   (eval-after-load 'company
;;     '(add-to-list
;;       'company-backends '(company-irony-c-headers company-irony)))
;; )

;; ;; (flycheck-irony integration): Syntax Checking
;; (require 'flycheck-irony)
;; (progn
;;   (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; )

;; (eldoc-irony integration): Display fn args in echo area.
;; obs: Located in melpa repository (not in melpa-stable).
;(require 'irony-eldoc)
;(progn
;  (add-hook 'irony-mode-hook #'irony-eldoc)
;)

;; RTags
;; ---------------------------------------------------------------
;; (require 'rtags)
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
;; (require 'helm-rtags)
;; (progn
;;   (setq rtags-display-result-backend 'helm)
;; )

;; ;; (company-rtags integration): Auto-completion.
;; ;(require 'company-rtags)
;; ;(progn
;; ;  (setq rtags-autostart-diagnostics t)
;; ;  (rtags-diagnostics)
;; ;  (setq rtags-completions-enabled t)
;; ;  (push 'company-rtags company-backends)
;; ;  ;(rtags-enable-standard-keybindings)
;; ;)

;; ;; Live code checking.
;; (require 'flycheck-rtags)
;; (progn
;;   ;; ensure that we use only rtags checking
;;   ;; https://github.com/Andersbakken/rtags#optional-1
;;   (defun setup-flycheck-rtags ()
;;     (flycheck-select-checker 'rtags)
;;     (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;     (setq-local flycheck-check-syntax-automatically nil)
;;     (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;   )
;;   (add-hook 'c-mode-hook #'setup-flycheck-rtags)
;;   (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
;; )


;; ;; Helm
;; ;; ---------------------------------------------------------------
;; ;; Helm makes searching for anything nicer. It works on top of
;; ;; many other commands / packages and gives them nice, flexible UI.
;; (require 'helm)
;; (progn
;;   (require 'helm-config)

;;   ;; Use C-c h instead of default C-x c, it makes more sense.
;;   (global-set-key (kbd "C-c h") 'helm-command-prefix)
;;   (global-unset-key (kbd "C-x c"))

;;   (setq
;;    ;; move to end or beginning of source when reaching top or bottom of source.
;;    helm-move-to-line-cycle-in-source t
;;    ;; search for library in `require' and `declare-function' sexp.
;;    helm-ff-search-library-in-sexp t
;;    ;; scroll 8 lines other window using M-<next>/M-<prior>
;;    helm-scroll-amount 8
;;    helm-ff-file-name-history-use-recentf t
;;    helm-echo-input-in-header-line t
;;   )

;;   ;; Command M-x : Command list and fuzzy completion.
;;   (global-set-key (kbd "M-x") 'helm-M-x)
;;   (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;;   ;; Command C-x C-f : Improved navigation.
;;   (global-set-key (kbd "C-x C-f") 'helm-find-files)

;;   ;; Command: M-y : Displays kill ring.
;;   (global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;   ;; Command C-x b : Buffer list.
;;   (global-set-key (kbd "C-x b") 'helm-mini)
;;   (setq helm-buffers-fuzzy-matching t
;;         helm-recentf-fuzzy-match t)

;;   ;; TOOD: helm-semantic has not syntax coloring! How can I fix that?
;;   (setq helm-semantic-fuzzy-match t
;;         helm-imenu-fuzzy-match t)
  
;;   ;; Lists all occurences of a pattern in buffer.
;;   (global-set-key (kbd "C-c h o") 'helm-occur)
  
;;   (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  
;;   ;; open helm buffer inside current window, not occupy whole other window
;;   (setq helm-split-window-inside-p t
;;         helm-autoresize-max-height 50
;;         helm-autoresize-min-height 30)
;;   (helm-autoresize-mode 1)
  
;;   (helm-mode 1)
;; )

;; ;; Use Helm in Projectile.
;; (require 'helm-projectile)
;; (progn
;;   (setq projectile-completion-system 'helm)
;;   (helm-projectile-on)
;; )


;; ;(require 'levenshtein)1
;; ;(cmake-ide-setup)



