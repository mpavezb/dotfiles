;; ===============================================================
;; Package system
;; ===============================================================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives nil)
(add-to-list 'package-archives '("GNU ELPA" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; prevents stale elisp bytecode from shadowing more up-to-date source files.
(setq load-prefer-newer t)

;; do not check package signatures
(setq package-check-signature nil)


;; -----------------------------------------------------------------------------
;; use-package
;; https://github.com/jwiegley/use-package
;; -----------------------------------------------------------------------------
;; Important Keywords:
;; `:load-path'   : extends load path required by the package.
;; `:init'        : expressions to evaluate before loading. Is always executed.
;; `:config'      : expressions to evaluate after loading. Might not be executed.
;; `:defer'       : defers loading by N[s] or until an autoload is triggered.
;; `:commands'    : creates autoloads for some commands and defers loading.
;; `:bind'        : registers key bindings (and extends `:commands').
;; `:bind-keymap' : same, but for keymaps.
;; `:mode'        : sets defered binding within `auto-mode-alist'.
;; `:interpreter' : sets defered binding within `interpreter-mode-alist'
;; `:magic'       : runs functions based on filename regex.
;; `:hook'        : extends package hooks.
;; `:delight'     : hides/replace minor/major mode information in mode line display.
;; `:diminish'    : hides/replace minor       mode information in mode line display.

;; More Keywords
;; `:after'       : waits for other packages to be loaded first.
;; `:catch'       : allows to catch errors at load time.
;; `:custom'      : allows modification of `custom' variables.
;; `:custom-face' : allows modification of custom faces.
;; `:defines'     : allows declaration of requires (missing) variables at compile time.
;; `:demand'      : demands package loading, even if defers are declared.
;; `:disabled'    : completely disable the package and inits.
;; `:functions'   : allows declaration of requires (missing) functons at compile time.
;; `:if'          : allows predicating init and loading of modules.
;; `:no-require'  : do not require this package at compile time.
;; `:requires'    : package wont be loaded if declared packages are not present.
;; `:pin'         : declares where (archive) to get the package from.
;; `:ensure'      : installs this or another package.

;; This is only needed once, near the top of the file
(eval-when-compile 
  (require 'use-package))

;; gather info on loaded packages
;; M-x use-package-report
(setq use-package-compute-statistics t)

;; Information is dumped into *Messsages* and *Warnings* buffers.
(setq use-package-verbose t)

;; Auto install used packages (slows down emacs init)
;; Uncomment to install missing packages.
;; (setq use-package-always-ensure t)


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
