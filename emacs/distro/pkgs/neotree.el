;; -----------------------------------------------------------------------------
;; neotree
;; Project Navigation Sidebar
;; https://www.emacswiki.org/emacs/NeoTree
;; https://github.com/jaypei/emacs-neotree
;; -----------------------------------------------------------------------------
(use-package neotree 
  :commands (neotree-toggle)
  :config
  ;; Open neotree at current file
  (setq neo-smart-open t)

  ;; neotree theme: classic(default) ascii arrow icons nerd
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;
  )

;; -----------------------------------------------------------------------------
;; Neotree - Projectile integration
;; -----------------------------------------------------------------------------
;; Open neotree at project root.
(defun mp/neotree-project-dir () 
  "Open NeoTree using the git root." 
  (interactive) 
  (let ((project-dir (projectile-project-root)) 
	(file-name (buffer-file-name))) 
    (neotree-toggle) 
    (if project-dir (if (neo-global--window-exists-p) 
			(progn (neotree-dir project-dir) 
			       (neotree-find file-name))) 
      (message "Could not find git project root."))))

;; Reload neotree when projectile changes project
;; (setq projectile-switch-project-action 'neotree-projectile-action)
