;; -----------------------------------------------------------------------------
;; org-journal
;; Allows maintaining a simple personal journal in Emacs
;; https://github.com/bastibe/org-journal
;; -----------------------------------------------------------------------------
(use-package org-journal 
  :init (add-to-list 'package-pinned-packages '(org-journal . "melpa-stable") t) 
  :bind (("C-c j" . org-journal-new-entry)) 
  :config ;;
  (setq org-journal-dir "~/documents/journal/") 
  (setq org-journal-file-type 'monthly))
