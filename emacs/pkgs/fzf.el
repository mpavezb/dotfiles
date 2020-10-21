;; -----------------------------------------------------------------------------
;; fzf
;; Emacs frontend to FZF
;; https://github.com/bling/fzf.el
;; https://github.com/mpavezb/fzf.el (fork)
;; https://github.com/junegunn/fzf
;; -----------------------------------------------------------------------------
(load-file (expand-file-name (concat user-emacs-directory "third_party/" "fzf.el/fzf.el")))
(use-package fzf 
  :bind (("C-c f f" . fzf) 
	 ("C-c f p" . fzf-projectile) 
	 ("C-c f d" . fzf-directory)) 
  :config ;;
  (setq fzf/args "-x --no-hscroll --margin=0,1,1,0 --print-query")
  (setq projectile-enable-caching t)
  (let ((path (concat (file-name-as-directory (getenv "HOME")) ".opt/fzf/bin"))) 
    (when (file-directory-p path) 
      (setenv "PATH" (concat (getenv "PATH") ":" path)))))
