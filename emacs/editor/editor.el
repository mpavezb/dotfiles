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
(use-package linum-highlight-current-line-number 
  :load-path "mp/lisp/" 
  :config ;;
  (setq linum-format 'linum-highlight-current-line-number))

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

;; Tabs, trailing whitespace
;; (setq-default highlight-tabs t)
;; (setq-default show-trailing-whitespace t)

;; Remove useless whitespaces before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() 
			      (delete-trailing-whitespace)))

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

;; history size
(setq history-length 1000)
(setq savehist-save-minibuffer-history t)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring last-kbd-macro
						kmacro-ring shell-command-history Info-history-list
						register-alist))
(savehist-mode t)

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
  :config ;;
  (setq browse-kill-ring-highlight-current-entry t) 
  (setq browse-kill-ring-highlight-inserted-item t) 
  (setq browse-kill-ring-show-preview t) 
  (setq browse-kill-ring-separator "~~"))

(use-package popup-kill-ring 
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
;; rg
;; Fast alternative to grep
;; https://rgel.readthedocs.io/
;; https://github.com/BurntSushi/ripgrep/
;; -----------------------------------------------------------------------------
;; TODO: define own search configs
;; TODO: defer loading
;; TODO: Configurable after/before context.
;; TODO: Configurable max depth.
(use-package rg
  :init (rg-enable-default-bindings)
  :config ;;
  ;; -----------------------------------
  ;; Displays
  ;; -----------------------------------
  (setq rg-use-transient-menu t) ;; transient menu
  (setq rg-show-header t)	 ;; search header
  (setq rg-hide-command t)	 ;; executed rg command
  (setq rg-show-columns nil)	 ;; column number
  (setq rg-group-result t)	 ;; group by filename

  ;; -----------------------------------
  ;; Default options
  ;; -----------------------------------
  (add-to-list 'rg-command-line-flags "--max-filesize 10M") ;; Ignore large files
  (add-to-list 'rg-command-line-flags "--max-columns 80") ;; Hide large columns
  (add-to-list 'rg-command-line-flags "--max-columns-preview") ;; but show matched section
  (add-to-list 'rg-command-line-flags "--glob !git/*") ;; but show matched section

  ;; -----------------------------------
  ;; Toggles
  ;; -----------------------------------
  (defun mp/rg-toggle-group ()
    "Toggle grouping and rerun."
    (interactive)
    (setq rg-group-result (not rg-group-result))
    (rg-rerun))
  ;; display
  (define-key rg-mode-map (kbd "G") 'mp/rg-toggle-group)
  (rg-define-toggle "--after-context 3" "A")  ;; After context
  (rg-define-toggle "--before-context 3" "B") ;; Before context
  (rg-define-toggle "--context 3" "C")	      ;; Full Context
  ;; search
  (rg-define-toggle "--word-regexp" "W") ;; Regex for word boundaries
  ;; sort
  (rg-define-toggle "--sort path" "S")	;; Sort by path (asc)
  (rg-define-toggle "--sortr path" "R")	;; Sort by path (asc)
  ;; scope
  (rg-define-toggle "--hidden" "H")	;; Search in hidden files/dirs
  (rg-define-toggle "--text" "T")	;; Search in binary files
  (rg-define-toggle "--search-zip" "Z")	;; Search in zip files
  (rg-define-toggle "--follow" "S")	;; Follow symlinks
  (rg-define-toggle "--max-depth 1" "D") ;; Descend at most N directories

  ;; -----------------------------------
  ;; Type Aliases
  ;; -----------------------------------
  (setq rg-custom-type-aliases nil)
  (add-to-list 'rg-custom-type-aliases '("cpp" . "*.{c,cpp,h,hpp,cc,hxx,cxx}"))
  (add-to-list 'rg-custom-type-aliases '("franca" . "*.{fidl,fdepl,cdepl}"))
  (add-to-list 'rg-custom-type-aliases '("web" . "*.{html,js,css}"))
  ;;
  )

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


;; auto-complete
;; https://github.com/auto-complete/auto-complete
(use-package auto-complete
  :diminish 
  :config ;;
  (ac-config-default)

  ;; Automatic Start and Triggering
  ;; (setq ac-auto-start nil) ;; disabled auto start
  (setq ac-auto-start 5) ;; start after typing 4 characters
  (ac-set-trigger-key "TAB")

  ;; Filter list with C-s / DEL
  (setq ac-use-menu-map t)

  ;; disable quick help info
  ;; (setq ac-use-quick-help nil)
  (setq ac-use-quick-help t)

  ;; Number of rows
  (setq ac-menu-height 20)

  ;; Case is ignored only if there are not upper chars
  (setq ac-ignore-case 'smart)
  ;;
  )
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
