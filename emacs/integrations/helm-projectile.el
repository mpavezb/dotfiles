;; Use Helm in Projectile.
(use-package helm-projectile 
  :defer 10 
  :config ;;
  (setq projectile-completion-system 'helm) 
  (helm-projectile-on))
