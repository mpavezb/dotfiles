;; bazel-mode
;; https://melpa.org/#/bazel-mode
(use-package bazel-mode 
  :init ;;
  (autoload 'bazel-mode "bazel" "Associates bazel BUILD files with bazel-mode." t)
  ;; Use this mode for bazel BUILD files
  (add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
  :config ;;
  ;; Formatting Bazel files automatically before saving
  (add-hook 'bazel-mode-hook (lambda () 
			       (add-hook 'before-save-hook #'bazel-format nil t))))
