;; Neotree
;; Project Navigation Sidebar
;; https://www.emacswiki.org/emacs/NeoTree
(use-package neotree)
(add-to-list 'package-pinned-packages '(neotree . "melpa-stable") t)

;; Use F8 to toggle neotree
(global-set-key [f8] 'neotree-toggle)

;; Open neotree at current file
(setq neo-smart-open t)

;; neotree theme
;; classic(default) ascii arrow icons nerd
;;
;; icons theme requires all-the-icons package
;; https://github.com/domtronn/all-the-icons.el
;; M-x all-the-icons-install-fonts
;; (use-package all-the-icons)
(setq neo-theme (if (display-graphic-p) 'ascii))

