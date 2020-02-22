;; -----------------------------------------------------------------------------
;; neotree
;; Project Navigation Sidebar
;; https://www.emacswiki.org/emacs/NeoTree
;; -----------------------------------------------------------------------------
(use-package neotree 
  :defer t 
  :init (add-to-list 'package-pinned-packages '(neotree . "melpa-stable") t) 
  :bind ([f8] . neotree-toggle) 
  :config
  ;; Open neotree at current file
  (setq neo-smart-open t)

  ;; neotree theme
  (setq neo-theme (if (display-graphic-p) 'ascii)))
