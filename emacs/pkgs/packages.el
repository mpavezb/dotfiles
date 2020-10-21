;; ===============================================================
;; Elisp Compilation
;; ===============================================================

;; Native Compile Files Asyncronously
(setq comp-deferred-compilation t)

;; prevents stale elisp bytecode from shadowing more up-to-date source files.
(setq load-prefer-newer t)

;; ===============================================================
;; Proxies
;; ===============================================================

;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;; 	("http" . "proxy.com:8080")
;; 	("https" . "proxy.com:8080")))


;; ===============================================================
;; Package system
;; ===============================================================

;; -----------------------------------------------------------------------------
;; straight
;; Next-generation, purely functional package manager for the Emacs hacker
;; https://github.com/raxod502/straight.el
;; -----------------------------------------------------------------------------
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; -----------------------------------------------------------------------------
;; use-package
;; straight and use-package integration
;; https://github.com/jwiegley/use-package
;; -----------------------------------------------------------------------------
;; Make sure not to use ':ensure' or 'use-package-always-ensure'
(straight-use-package 'use-package)

;; gather info on loaded packages
;; M-x use-package-report
(setq use-package-compute-statistics t)

;; Information is dumped into *Messsages* and *Warnings* buffers.
(setq use-package-verbose t)

;; Auto install packages
(setq straight-use-package-by-default t)

;; -----------------------------------------------------------------------------
;; ENV variables
;; -----------------------------------------------------------------------------
;; Add $HOME/.local/bin to exec-path
(let ((path (concat (file-name-as-directory (getenv "HOME")) ".local/bin")))
  (when (file-directory-p path)
    (add-to-list 'exec-path path)))

;; -----------------------------------------------------------------------------
;; benchmark-init
;; -----------------------------------------------------------------------------
(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))