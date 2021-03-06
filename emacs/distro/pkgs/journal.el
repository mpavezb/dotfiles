;; -----------------------------------------------------------------------------
;; org-journal
;; Allows maintaining a simple personal journal in Emacs
;; https://github.com/bastibe/org-journal
;; -----------------------------------------------------------------------------
(use-package org-journal
  :disabled
  :commands (org-journal-new-entry)
  :config ;;
  (setq org-journal-dir "~/documents/journal/") 
  (setq org-journal-file-type 'monthly))
