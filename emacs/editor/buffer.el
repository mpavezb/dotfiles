;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -----------------------------------------------------------------------------
;; saveplace
;; -----------------------------------------------------------------------------
;; remember point position when reopening/revisiting each buffer
(use-package saveplace 
  :config (setq-default save-place t))

;; -----------------------------------------------------------------------------
;; desktop.el
;; http://wikemacs.org/wiki/Desktop.el
;; -----------------------------------------------------------------------------
;; remember opened buffers
(desktop-save-mode 1)

;; Restore at most 1 buffer on startup
(setq desktop-restore-eager 1)

;; buffers not to save
(setq desktop-buffers-not-to-save (concat "\\(\\.log\\|^tags\\|^TAGS\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; Buffers not to clear (regex)
(add-to-list 'desktop-clear-preserve-buffers "README.md")

;; -----------------------------------------------------------------------------
;; midnight mode
;; cleans buffer list periodically
;; https://www.emacswiki.org/emacs/MidnightMode
;; https://www.emacswiki.org/emacs/CleanBufferList
;; -----------------------------------------------------------------------------
;; Calls command M-x clean-buffer-list at midnight.
(use-package midnight 
  :defer 60 
  :config
  ;; set clean time
  (midnight-delay-set 'midnight-delay "4:30am")
  ;; clean-buffer-list configuration:
  ;; - expiration date (normal buffers): 1 day
  ;; - expiration date (special buffers): 1 hour
  ;; - see doc on how to add more special buffers to the list.
  (setq clean-buffer-list-delay-general 1) 
  (setq clean-buffer-list-delay-special 3600)

  ;; buffers not to kill
  (add-to-list 'clean-buffer-list-kill-never-buffer-names "README.md"))

;; -----------------------------------------------------------------------------
;; buffer-move
;; -----------------------------------------------------------------------------
(use-package buffer-move 
  :bind (("C-S-<up>" . buf-move-up) 
	 ("C-S-<down>" . buf-move-down) 
	 ("C-S-<left>" . buf-move-left) 
	 ("C-S-<right>" . buf-move-right)))

;; -----------------------------------------------------------------------------
;; ibuffer
;; -----------------------------------------------------------------------------
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; nearly all of this is the default layout
(setq ibuffer-formats
      (quote ((mark modified read-only
		    " " (name 50 50 :left :elide)
		    " " (size 9 -1 :right)
		    " " (mode 16 16 :left :elide)
		    " " filename-and-process)
	      (mark " " (name 16 -1)
		    " " filename))))

;; auto reload files from disk
(global-auto-revert-mode t)

;; Reload buffer shortcut
(global-set-key [f5] 
		'(lambda () 
		   (interactive) 
		   (revert-buffer nil t nil)))


;; -----------------------------------------------------------------------------
;; put filename in clipboard
;; -----------------------------------------------------------------------------
(defun mp/get-buffername () 
  "Returns the buffername"
  (if (equal major-mode 'dired-mode) default-directory (abbreviate-file-name buffer-file-name)))

(defun mp/clipboard-buffername-full () 
  "Put the current buffername on the clipboard, including parent directories" 
  (interactive) 
  (let ((filename (mp/get-buffername))) 
    (when filename (kill-new filename) 
	  (message filename))))

(defun mp/clipboard-buffername () 
  "Put the current buffername on the clipboard, without parent directories." 
  (interactive) 
  (let ((filename (file-name-nondirectory  (mp/get-buffername)))) 
    (when filename (kill-new filename) 
	  (message filename))))

;; -----------------------------------------------------------------------------
;; Reopen killed buffers
;; -----------------------------------------------------------------------------
(mp/load "lisp/reopen-killed-file.el")
