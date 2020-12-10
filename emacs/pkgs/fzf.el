;; -----------------------------------------------------------------------------
;; fzf
;; Emacs frontend to FZF
;; https://github.com/bling/fzf.el (original)
;; https://github.com/mpavezb/fzf.el (fork)
;; https://github.com/junegunn/fzf (tool)
;; -----------------------------------------------------------------------------
(use-package fzf
   :straight (fzf :type git :host github :repo "bling/fzf.el"
                      :fork (:host github
				   :repo "mpavezb/fzf.el"))
  :commands (fzf fzf-projectile fzf-directory)
  :config ;;
  (setq fzf/args "-x --no-hscroll --margin=0,1,1,0 --print-query")
  (setq projectile-enable-caching t)
  (let ((path (concat (file-name-as-directory (getenv "HOME")) ".opt/fzf/bin"))) 
    (when (file-directory-p path) 
      (setenv "PATH" (concat (getenv "PATH") ":" path)))))
