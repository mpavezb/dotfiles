;; -----------------------------------------------------------------------------
;; projectile
;; Project integration library for emacs
;; https://github.com/bbatsov/projectile
;; -----------------------------------------------------------------------------
(use-package projectile 
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map) 
	      ("C-c p" . projectile-command-map)) 
  :config ;;
  (projectile-mode t)
  ;; cleaner modeline
  (setq projectile-mode-line-function '(lambda () 
					 (format " [%s]" (projectile-project-name)))))
