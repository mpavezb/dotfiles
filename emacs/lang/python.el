;; silence indent warnings
(setq python-indent-guess-indent-offset-verbose nil)

;; -----------------------------------------------------------------------------
;; indent-tools
;; Indent,  move around  and  act  on code  based  on indentation.
;; https://gitlab.com/emacs-stuff/indent-tools/
;; -----------------------------------------------------------------------------
(add-hook 'python-mode-hook ;;
	  (lambda () 
	    (define-key python-mode-map (kbd "C-c >") 'indent-tools-hydra/body)))

