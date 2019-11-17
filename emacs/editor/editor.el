;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; show row,column numbers
(column-number-mode t)
(line-number-mode t)

;; history size
(setq history-length 1000)
(savehist-mode 1)

;; force newline at EOF
;;(setq require-final-newline t)

;; prefer spaces over tabs
;;(setq-default indent-tabs-mode nil)

;; Make it very easy to see the line with the cursor.
(global-hl-line-mode t)

;; selected region is deleted when typing.
(delete-selection-mode 1)


;; Highlight expression within matching parens when near one of them.
(setq show-paren-delay 0)
(setq blink-matching-paren nil)
(setq show-paren-style 'expression)
(show-paren-mode 1)

;; Colour parens, and other delimiters, depending on their depth.
;; Very useful for parens heavy languages like Lisp.
(use-package rainbow-delimiters)
(add-hook 'org-mode-hook '(lambda () 
			    (rainbow-delimiters-mode 1)))
(add-hook 'prog-mode-hook '(lambda () 
			     (rainbow-delimiters-mode 1)))
(electric-pair-mode 1)
;; (setq electric-pair-pairs '((?~ . ?~)
;; 			    (?* . ?*)
;; 			    (?/ . ?/)))

;; sample: (blue (purple (forest (green (yellow (blue))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kill-Yank for Clipboard and Mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Killing and yanking uses the X clipboard rather than just the primary selection.
(setq save-interprogram-paste-before-kill t)

;; after copy Ctrl+c in Linux X11, you can paste by yanking in emacs.
(setq select-enable-clipboard t)

;; Mouse yanking inserts at the point instead of the location of the click.
(setq mouse-yank-at-point t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; REGEX search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq isearch-allow-scroll t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hippie-expand
;; Allows expansion for autocompletion (given an interesting source)
;; https://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Enable ‘possibly confusing commands’
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)


;; ;; M-k kills to the left (Dual to C-k)
;; (global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) )

;; Kill current buffer; prompt only if there are unsaved changes.
(global-set-key (kbd "C-x k") 
		'(lambda () 
		   (interactive) 
		   (kill-buffer (current-buffer))))


;; Multiple Cursors
;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Expand Region
;; https://github.com/magnars/expand-region.el
(use-package expand-region)
(global-set-key (kbd "M-+") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Move line or selected region up and down (M-Up/Down)
(use-package move-text)
(move-text-default-bindings)


;; -----------------------------------------------------------------------------
;; highlight-indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides
;; -----------------------------------------------------------------------------
(use-package highlight-indent-guides)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-responsive 'stack)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
