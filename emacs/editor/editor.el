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
;; fzf
;; Emacs frontend to FZF
;; https://github.com/bling/fzf.el
;; https://github.com/mpavezb/fzf.el (fork)
;; https://github.com/junegunn/fzf
;; -----------------------------------------------------------------------------
(load-file (expand-file-name (concat user-emacs-directory "third_party/" "fzf.el/fzf.el")))
(use-package fzf 
  :bind (("C-c f f" . fzf) 
	 ("C-c f p" . fzf-projectile) 
	 ("C-c f d" . fzf-directory)) 
  :config ;;
  (setq fzf/args "-x --no-hscroll --margin=0,1,1,0 --print-query")
  (setq projectile-enable-caching t)
  (let ((path (concat (file-name-as-directory (getenv "HOME")) ".opt/fzf/bin"))) 
    (when (file-directory-p path) 
      (setenv "PATH" (concat (getenv "PATH") ":" path)))))


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
  :bind ("C-c C-s" . rg-dwim-project-dir) 
  :init (rg-enable-menu) 
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
  (add-to-list 'rg-command-line-flags "--max-columns 150") ;; Hide large columns
  (add-to-list 'rg-command-line-flags "--max-columns-preview") ;; but show matched section
  (add-to-list 'rg-command-line-flags "--glob !git/*") ;; but show matched section
  ;; (setq rg-command-line-flags (delete "--max-columns 150" rg-command-line-flags))

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
  (rg-define-toggle "--after-context 15" "A")  ;; After context medium
  (rg-define-toggle "--before-context 15" "B") ;; Before context medium
  ;; this does not work, as  macro will redefine the toggle function named rg-custom-toggle-flag-*.
  ;; (rg-define-toggle "--after-context 30" "a") ;; After context large
  ;; (rg-define-toggle "--before-context 30" "b") ;; Before context large
  (rg-define-toggle "--context 5" "C")	 ;; Full Context small
  ;; search
  (rg-define-toggle "--word-regexp" "W") ;; Regex for word boundaries
  ;; sort
  (rg-define-toggle "--sort path" "S")	;; Sort by path (asc)
  (rg-define-toggle "--sortr path" "R")	;; Sort by path (asc)
  ;; scope
  (rg-define-toggle "--hidden" "H")	;; Search in hidden files/dirs
  (rg-define-toggle "--text" "T")	;; Search in binary files
  (rg-define-toggle "--search-zip" "Z")	;; Search in zip files
  (rg-define-toggle "--follow" "L")	;; Follow symlinks
  (rg-define-toggle "--max-depth 1" "D") ;; Descend at most N directories

  ;; -----------------------------------
  ;; Type Aliases
  ;; -----------------------------------
  (setq rg-custom-type-aliases nil) 
  (add-to-list 'rg-custom-type-aliases '("cpp" . "*.{c,cpp,h,hpp,cc,hxx,cxx}")) 
  (add-to-list 'rg-custom-type-aliases '("franca" . "*.{fidl,fdepl,cdepl,fcdl}")) 
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
;; focus
;; https://github.com/larstvei/Focus
;; -----------------------------------------------------------------------------
(use-package focus 
  :bind (("<f12>" . focus-mode)	    ;;
	 :map focus-mode-map	    ;;
	 ("M-p" . focus-prev-thing) ;;
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
