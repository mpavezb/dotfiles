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
;; only applied to files
(defun mp/lisp-mode-before-save-hook () 
  (if (string-prefix-p (expand-file-name (concat user-emacs-directory "var/")) 
		       (expand-file-name (or (buffer-file-name) 
					     ""))) 
      (message (concat "elisp-format: File is in .emacs.d/var/ directory. Will not apply hook: " (or
												  (buffer-file-name) 
												  "<buffer is not a file>"))) 
    (when (eq major-mode 'emacs-lisp-mode) 
      (elisp-format-buffer))))

(add-hook  'before-save-hook 'mp/lisp-mode-before-save-hook)

;; use this to disable the format hook
;; (remove-hook  'before-save-hook 'mp/lisp-mode-before-save-hook)
