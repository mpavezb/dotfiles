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
  :commands (rg-dwim-project-dir)
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
