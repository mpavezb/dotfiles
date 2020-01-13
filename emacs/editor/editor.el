;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.

;; Line numbering
;; Display line number sidebar on programming languages
;; https://www.emacswiki.org/emacs/LineNumbers
(add-hook 'prog-mode-hook 'linum-mode)

;; highlight current line-number
;; https://github.com/targzeta/linum-highlight-current-line-number
(mp/load "lisp/linum-highlight-current-line-number")
(setq linum-format 'linum-highlight-current-line-number)

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
(show-paren-mode 1)

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

;; history size
(setq history-length 1000)
(savehist-mode 1)

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

(use-package browse-kill-ring 
  :bind ("C-M-y" . browse-kill-ring) 
  :config () 
  (setq browse-kill-ring-highlight-current-entry t) 
  (setq browse-kill-ring-highlight-inserted-item t) 
  (setq browse-kill-ring-show-preview t) 
  (setq browse-kill-ring-separator "~~"))

(use-package popup-kill-ring 
  :config () 
  :bind ("M-y" . popup-kill-ring))

;; -----------------------------------------------------------------------------
;; search
;; -----------------------------------------------------------------------------

;; REGEX search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(setq isearch-allow-scroll t)

;; -----------------------------------------------------------------------------
;; Delete emacs grep header
;; -----------------------------------------------------------------------------
(defun mp/delete-grep-header () 
  (save-excursion (with-current-buffer grep-last-buffer (goto-line 5) 
				       (narrow-to-region (point) 
							 (point-max)))))

;; this shows:
;; ad-handle-definition: ‘grep’ got redefined
;; ad-handle-definition: ‘rgrep’ got redefined
(defadvice grep (after mp/delete-grep-header activate) 
  (mp/delete-grep-header))
(defadvice rgrep (after mp/delete-grep-header activate) 
  (mp/delete-grep-header))

;; -----------------------------------------------------------------------------
;; completion
;; -----------------------------------------------------------------------------

;; hippie-expand
;; Allows expansion for autocompletion (given an interesting source)
;; https://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)


;; -----------------------------------------------------------------------------
;; other
;; -----------------------------------------------------------------------------

;; Kill current buffer; prompt only if there are unsaved changes.
(global-set-key (kbd "C-x k") 
		'(lambda () 
		   (interactive) 
		   (kill-buffer (current-buffer))))


;; -----------------------------------------------------------------------------
;; Multiple Cursors
;; https://github.com/magnars/multiple-cursors.el
;; -----------------------------------------------------------------------------
(use-package multiple-cursors 
  :bind (("C-S-c C-S-c" . mc/edit-lines) 
	 ("C->" . mc/mark-next-like-this) 
	 ("C-<" . mc/mark-previous-like-this) 
	 ("C-c C-<" . mc/mark-all-like-this) 
	 ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; -----------------------------------------------------------------------------
;; Expand Region
;; https://github.com/magnars/expand-region.el
;; -----------------------------------------------------------------------------
(use-package expand-region 
  :bind (("M-+" . er/expand-region) 
	 ("M--" . er/contract-region)))

;; -----------------------------------------------------------------------------
;; s
;; https://github.com/magnars/s.el
;; -----------------------------------------------------------------------------
(mp/load "editor/s.el")

;; -----------------------------------------------------------------------------
;; origami
;; A text folding minor mode for emacs
;; https://github.com/gregsexton/origami.el
;; -----------------------------------------------------------------------------
;; (use-package origami
;;   :bind (("<backtab>" . origami-forward-toggle-node)))
