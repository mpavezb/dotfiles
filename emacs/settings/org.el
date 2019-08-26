;; org mode
(require 'org)

;; (add-to-list 'auto-mode-alist '("\\.org$ . org-mode"))

(setq org-todo-keywords '((sequence "TODO" "WIP" "WAITING" "DONE" "CLOSED")))
(setq org-log-done t)

;; keymaps
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)


