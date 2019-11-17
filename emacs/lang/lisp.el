;; -----------------------------------------------------------------------------
;; elisp-format
;; Format elisp code
;; https://www.emacswiki.org/emacs/ElispFormat
;; -----------------------------------------------------------------------------
(use-package elisp-format 
  :config ;;
  ;; do not split use-package with newlines
  (add-to-list 'elisp-format-split-subexp-keyword-except-list '"use-package"))

;; format on save
(defun mp/lisp-mode-before-save-hook () 
  (when (eq major-mode 'emacs-lisp-mode) 
    (elisp-format-buffer)))
(add-hook  'before-save-hook 'mp/lisp-mode-before-save-hook)

;; use this to disable the format hook
;; (remove-hook  'before-save-hook 'mp/lisp-mode-before-save-hook)
