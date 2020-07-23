;; -----------------------------------------------------------------------------
;; neotree
;; Project Navigation Sidebar
;; https://www.emacswiki.org/emacs/NeoTree
;; https://github.com/jaypei/emacs-neotree
;; -----------------------------------------------------------------------------
(use-package neotree 
  :bind ([f8] . neotree-toggle) 
  :config
  ;; Open neotree at current file
  (setq neo-smart-open t)

  ;; neotree theme: classic(default) ascii arrow icons nerd
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;
  )
