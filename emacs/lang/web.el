;; -----------------------------------------------------------------------------
;; web-mode
;; major-mode for editing web-templates
;; https://github.com/psf/black
;; -----------------------------------------------------------------------------
(use-package web-mode 
  :defer t 
  :config ;;
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)) 
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package json-mode 
  :defer t)
