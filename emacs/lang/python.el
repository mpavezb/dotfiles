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

;; -----------------------------------------------------------------------------
;; anaconda mode
;; Code navigation, documentation lookup and completion for Python.
;; https://github.com/pythonic-emacs/anaconda-mode
;; -----------------------------------------------------------------------------
(use-package anaconda-mode 
  :hook ((python-mode . anaconda-mode) 
	 (python-mode . anaconda-eldoc-mode)))

;; -----------------------------------------------------------------------------
;; elpy
;; Emacs Python Dvelopment Environment
;; https://elpy.readthedocs.io/
;; -----------------------------------------------------------------------------
;; Not able to install it at the moment.


;; -----------------------------------------------------------------------------
;; blacken
;; The Uncompromising Code Formatter
;; https://github.com/psf/black
;; -----------------------------------------------------------------------------
(use-package blacken 
  :hook (python-mode . blacken-mode))
