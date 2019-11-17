;; Use Helm in Projectile.
(use-package helm-projectile)
(progn 
  (setq projectile-completion-system 'helm) 
  (helm-projectile-on))
