;; IDO mode
;; Interactively Do Things
;; https://www.emacswiki.org/emacs/InteractivelyDoThings

(use-package ido 
  :defer t)
(ido-mode t)

(setq ido-enable-flex-matching t)

;; Everyrywhere?? TODO
(setq ido-everywhere t)
