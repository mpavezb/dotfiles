;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; remember point position when reopening/revisiting each buffer
(require 'saveplace)
(setq-default save-place t)

;; remember opened buffers
(desktop-save-mode 1)

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
(use-package 
  rainbow-delimiters)
(add-hook 'org-mode-hook '(lambda () 
			    (rainbow-delimiters-mode 1)))
(add-hook 'prog-mode-hook '(lambda () 
			     (rainbow-delimiters-mode 1)))
(electric-pair-mode 1)
(setq electric-pair-pairs '((?~ . ?~) 
			    (?* . ?*) 
			    (?/ . ?/)))

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
;; ibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; nearly all of this is the default layout
(setq ibuffer-formats '((mark modified read-only " " (name 50 50
							   :left 
							   :elide) " " (size 9 -1 
									     :right) " " (mode 16 16
											       :left 
											       :elide)
									     " "
									     filename-and-process) 
			(mark " " (name 16 -1) " " filename)))

;; auto reload files from disk
(global-auto-revert-mode t)

;; Reload buffer shortcut
(global-set-key [f5] 
		'(lambda () 
		   (interactive) 
		   (revert-buffer nil t nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reopen killed buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keep a stack of killed buffers (only for files)
;; use the stack to reopen buffers.

(defvar mp/killed-file-list nil 
  "List of recently killed files.")

(defun mp/add-file-to-killed-file-list () 
  "If buffer is associated with a file name, add that file to the
`killed-file-list' when killing the buffer."
  (when buffer-file-name (push buffer-file-name mp/killed-file-list)))
(add-hook 'kill-buffer-hook #'mp/add-file-to-killed-file-list)

;; reopen last killed files
(defun mp/reopen-killed-file () 
  "Reopen the most recently killed file, if one exists." 
  (interactive) 
  (when mp/killed-file-list (find-file (pop mp/killed-file-list))))
(global-set-key (kbd "C-x M-k") 'mp/reopen-killed-file)

;; reopen killed file from minibuffer list with autocompletion
(defun mp/reopen-killed-file-fancy () 
  "Pick a file to revisit from a list of files killed during this
Emacs session." 
  (interactive) 
  (if mp/killed-file-list (let ((file (completing-read "Reopen killed file: " mp/killed-file-list
						       nil nil nil nil (car mp/killed-file-list)))) 
			    (when file 
			      (setq mp/killed-file-list (cl-delete file mp/killed-file-list 
								   :test #'equal)) 
			      (find-file file))) 
    (error 
     "No recently-killed files to reopen")))


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
(use-package 
  multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Expand Region
;; https://github.com/magnars/expand-region.el
(use-package 
  expand-region)
(global-set-key (kbd "M-+") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put filename in clipboard
(defun mp/put-buffername-on-clipboard () 
  "Put the current buffer name on the clipboard" 
  (interactive) 
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (abbreviate-file-name
									buffer-file-name)))) 
    (when filename (kill-new filename) 
	  (message filename))))

;; Move line or selected region up and down (M-Up/Down)
(use-package 
  move-text)
(move-text-default-bindings)
