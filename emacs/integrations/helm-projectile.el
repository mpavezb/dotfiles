;; Use Helm in Projectile.
(use-package helm-projectile 
  :defer t)
(progn 
  (setq projectile-completion-system 'helm) 
  (helm-projectile-on))
