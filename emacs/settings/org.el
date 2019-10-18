;; org mode
(use-package org)

;; automatic org-mode for org files.
(add-to-list 'auto-mode-alist '("\\.org$ . org-mode"))

(setq org-todo-keywords '((sequence "TODO" "WIP" "BLOCKED" "DONE" "CLOSED")))
(setq org-log-done t)

;; keymaps

(setq org-agenda-files (list "~/documents/org/"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)


