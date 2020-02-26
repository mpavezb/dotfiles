;; IDO mode
;; Interactively Do Things
;; https://www.emacswiki.org/emacs/InteractivelyDoThings

(use-package ido 
  :config ;;
  (ido-mode t) 
  (setq ido-enable-flex-matching t) 
  (setq ido-everywhere t))
