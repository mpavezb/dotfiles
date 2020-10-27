(use-package yaml-mode 
  :config ;;
  (add-to-list 'auto-mode-alist (cons (concat "\\." (regexp-opt '("yml" "yaml" ) t) "\\'")
				      'yaml-mode))

  ;; Allow using ENTER for newline and indent
  (add-hook 'yaml-mode-hook '(lambda () 
			       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  ;;
  )

