;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.

;; -----------------------------------------------------------------------------
;; nlinum
;; Show line numbers in the margin
;; https://elpa.gnu.org/packages/nlinum.html
;; -----------------------------------------------------------------------------
(use-package nlinum
  :hook ((prog-mode . nlinum-mode)
	 (text-mode . nlinum-mode))
  :config ;;
  (set-face-foreground 'nlinum-current-line "goldenrod")
  (set-face-background 'nlinum-current-line "Gray20")
  (setq nlinum-highlight-current-line t))

;; show row,column numbers on modeline
(column-number-mode t)
(line-number-mode t)

;; -----------------------------------------------------------------------------
;; Highlight
;; -----------------------------------------------------------------------------

;; highlight current line
(global-hl-line-mode t)

;; Highlight expression within matching parens when near one of them.
(setq show-paren-delay 0)
(setq blink-matching-paren nil)
(setq show-paren-style 'expression)
(show-paren-mode t)

;; ;; Tabs, trailing whitespace
;; (setq-default highlight-tabs t)
;; (setq-default show-trailing-whitespace t)

;; ;; Remove useless whitespaces before saving a file
;; (add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'before-save-hook (lambda()
;;			      (delete-trailing-whitespace)))

(use-package rainbow-mode
  :disabled 
  :delight)

;; rainbow-delimiters
;; Colour parentheses depending on their depth.
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters 
  :hook ((prog-mode . rainbow-delimiters-mode) 
	 (org-mode . rainbow-delimiters-mode)))

;; highlight-indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides
(use-package highlight-indent-guides 
  :diminish highlight-indent-guides-mode 
  :hook (prog-mode . highlight-indent-guides-mode) 
  :config ;;
  (setq highlight-indent-guides-method 'character) 
  (setq highlight-indent-guides-responsive 'stack))

;; -----------------------------------------------------------------------------
;; misc
;; -----------------------------------------------------------------------------

;; force newline at EOF
;;(setq require-final-newline t)

;; selected region is deleted when typing.
(delete-selection-mode 1)

;; Move line or selected region up and down (M-Up/Down)
(use-package move-text 
  :config (move-text-default-bindings))

;; electric pairs
(electric-pair-mode 1)

;; -----------------------------------------------------------------------------
;; Kill-Yank for Clipboard and Mouse
;; -----------------------------------------------------------------------------

;; Killing and yanking uses the X clipboard rather than just the primary selection.
(setq save-interprogram-paste-before-kill t)

;; after copy Ctrl+c in Linux X11, you can paste by yanking in emacs.
(setq select-enable-clipboard t)

;; Mouse yanking inserts at the point instead of the location of the click.
(setq mouse-yank-at-point t)


;; -----------------------------------------------------------------------------
;; Multiple Cursors
;; https://github.com/magnars/multiple-cursors.el
;; -----------------------------------------------------------------------------
(use-package multiple-cursors
  :commands (mc/edit-lines
	     mc/mark-next-like-this
	     mc/mark-previous-like-this
	     mc/mark-all-like-this
	     mc/add-cursor-on-click))

;; -----------------------------------------------------------------------------
;; Expand Region
;; https://github.com/magnars/expand-region.el
;; -----------------------------------------------------------------------------
(use-package expand-region 
  :commands (er/expand-region
	     er/contract-region))

;; -----------------------------------------------------------------------------
;; focus
;; https://github.com/larstvei/Focus
;; -----------------------------------------------------------------------------
(use-package focus
  :commands (focus-mode)
  :bind (:map focus-mode-map
	      ("M-p" . focus-prev-thing)
	      ("M-n" . focus-next-thing ))
  :config ;;
  ;; Modes inheriting prog-mode will focus on functions.
  (add-to-list 'focus-mode-to-thing '(prog-mode . defun))

  ;; Modes inheriting text-mode will focus on sentences.
  (add-to-list 'focus-mode-to-thing '(text-mode . sentence))

  ;; Enable toggle of current pin
  (defvar mp/focus-pin-status nil) 
  (defun mp/focus-toggle-pin () 
    "Toggle focus (un)pin" 
    (interactive) 
    (if mp/focus-pin-status (focus-unpin) 
      (focus-pin)) 
    (setq mp/focus-pin-status (not mp/focus-pin-status))) 
  (define-key focus-mode-map (kbd "M-<f12>") 'mp/focus-toggle-pin)
  ;;
  )

