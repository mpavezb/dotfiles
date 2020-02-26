;; IDO mode
;; Interactively Do Things
;; https://www.emacswiki.org/emacs/InteractivelyDoThings

(use-package ido 
  :defer 5 
  :config ;;
  (ido-mode t) 
  (setq ido-enable-flex-matching t) 
  (setq ido-everywhere t))
