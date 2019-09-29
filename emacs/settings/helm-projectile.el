;; Use Helm in Projectile.
(require 'helm-projectile)
(progn
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
)
