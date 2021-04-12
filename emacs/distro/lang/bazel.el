;; bazel-mode
;; https://github.com/codesuki/bazel-mode
(use-package bazel-mode 
  :config ;;

  ;; Disable autoformatting:
  ;; This is applying different rules than the real formatter.
  ;; Formatting Bazel files automatically before saving
  ;;(add-hook 'bazel-mode-hook (lambda ()
  ;;			       (add-hook 'before-save-hook #'bazel-format nil t)))

  ;; disable conflicting Python modes
  (add-hook 'bazel-mode-hook (lambda () 
			       (set (make-local-variable 'blacken-mode) nil))) 
  (add-hook 'bazel-mode-hook (lambda () 
			       (set (make-local-variable 'anaconda-mode) nil))) 
  (add-hook 'bazel-mode-hook (lambda () 
			       (set (make-local-variable 'eldoc-mode) nil)))
  ;;
  )
