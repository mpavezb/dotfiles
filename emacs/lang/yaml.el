(use-package yaml-mode 
  :config ;;
  (add-to-list 'auto-mode-alist (cons (concat "\\." (regexp-opt '("yml" "yaml" ) t) "\\'")
				      'yaml-mode))

  ;; Allow using ENTER for newline and indent
  (add-hook 'yaml-mode-hook '(lambda () 
			       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

  ;; Enable line numbers
  (add-hook 'yaml-mode-hook 'linum-mode)
  ;;
  )

;; -----------------------------------------------------------------------------
;; indent-tools
;; Indent,  move around  and  act  on code  based  on indentation.
;; https://gitlab.com/emacs-stuff/indent-tools/
;; -----------------------------------------------------------------------------
(use-package indent-tools 
  :after yaml-mode 
  :config ;;
  (global-set-key (kbd "C-c >") 'indent-tools-hydra/body)
  ;;
  )
