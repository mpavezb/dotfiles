;; -----------------------------------------------------------------------------
;; org
;; ORG Mode
;; https://orgmode.org/
;; -----------------------------------------------------------------------------
(use-package org 
  :init (add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t) 
  :bind (("C-c a" . org-agenda) 
	 ("C-c l" . org-store-link)) 
  :config
  ;; -------------------------------------
  ;; setup
  ;; -------------------------------------
  ;; automatic org-mode for org files.
  (add-to-list 'auto-mode-alist '("\\.org$ . org-mode"))

  ;; agenda files
  (setq org-agenda-files (list "~/documents/org/"))

  ;; -------------------------------------
  ;; Edition
  ;; -------------------------------------
  ;; Fold all source blocks on startup.
  (setq org-hide-block-startup t)

  ;; Avoid accidentally editing folded regions, say by adding text after an Org “⋯”.
  (setq org-catch-invisible-edits 'show)

  ;; Give quote and verse blocks a nice look.
  (setq org-fontify-quote-and-verse-blocks t)

  ;; Pressing ENTER on a link should follow it.
  (setq org-return-follows-link t)

  ;; -------------------------------------
  ;; TODO and Priority Keywords
  ;; -------------------------------------
  ;; @: pop-up to note why the state changed
  ;; !: generate timestamp
  (setq org-todo-keywords ;;
	(quote ((sequence "TODO(t)" "STARTED(s@/!)" "|" "DONE(d/!)")
		(sequence "WAITING(w@/!)" "ON_HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
  (setq org-todo-keyword-faces ;;
	(quote (("TODO" :foreground "red" :weight bold)
		("STARTED" :foreground "blue" :weight bold)
		("DONE" :foreground "forest green" :weight bold)
		("WAITING" :foreground "orange" :weight bold)
		("ON_HOLD" :foreground "magenta" :weight bold)
		("CANCELLED" :foreground "forest green" :weight bold))))

  ;; set priority range from A to C with default A
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?C)
  (setq org-default-priority ?A)

  ;;set colours for priorities
  (setq org-priority-faces ;;
	(quote ((?A . (:foreground "#F0DFAF" :weight bold))
		(?B . (:foreground "LightSteelBlue"))
		(?C . (:foreground "OliveDrab"))))))

;; -----------------------------------------------------------------------------
;; TOC
;; https://github.com/snosov1/toc-org
;; -----------------------------------------------------------------------------
(use-package toc-org 
  :hook (org-mode . toc-org-mode))

;; -----------------------------------------------------------------------------
;; Code Blocks
;; -----------------------------------------------------------------------------
;; TO DO

;; -----------------------------------------------------------------------------
;; CHECK LATER
;; -----------------------------------------------------------------------------
;; (add-hook 'org-mode-hook '(lambda ()
;;   (local-set-key (kbd "<return>") 'org-return-indent))
;;   (local-set-key (kbd "C-M-<return>") 'electric-indent-just-newline))

;; ;; IS THIS REALLY WORKING?
;; (use-package org-sticky-header
;;   :config
;;   (setq-default
;;    org-sticky-header-full-path 'full
;;    ;; Child and parent headings are seperated by a /.
;;    org-sticky-header-outline-path-separator " / ")
;;   :init (org-sticky-header-mode)
;; )

;; CODE BLOCKS
;; ;; Tangling should preserve indentation.
;; (setq org-src-preserve-indentation t)

;; ;; Tab should do indent in code blocks
;; (setq org-src-tab-acts-natively t)

;; ;; ===========================================================
;; ;; Making Block Delimiters Less Intrusive
;; (global-prettify-symbols-mode -1)

;; (defvar my-prettify-alist nil
;;   "Musa's personal prettifications.")

;; (push '("<=" . ?≤) my-prettify-alist)
;; (push '("#+begin_example" . (?ℰ (Br . Bl) ?⇒)) my-prettify-alist) ;; ℰ⇒
;; (push '("#+end_example" . ?⇐) my-prettify-alist)                  ;; ⇐

;; (-let [modify (lambda ()
;;               (setq prettify-symbols-alist
;;                     (append my-prettify-alist prettify-symbols-alist)))]

;;   (add-hook 'text-mode-hook modify)
;;   (add-hook 'prog-mode-hook modify)
;;   ;; For org-example blocks, “C-c '” to see the prettifications of language constructs.
;;   ;; Or alter the particular hook directly.
;; )

;; ;; Un-disguise a symbol when cursour is inside it or at the right-edge of it.
;; (setq prettify-symbols-unprettify-at-point 'right-edge)
;; ;; ===========================================================
