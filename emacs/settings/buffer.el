;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remember point position when reopening/revisiting each buffer
(require 'saveplace)
(setq-default save-place t)

;; remember opened buffers
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; nearly all of this is the default layout
(setq ibuffer-formats
      '((mark modified read-only " "
	      (name 50 50 :left :elide) " "
	      (size 9 -1 :right) " "
	      (mode 16 16 :left :elide) " "
	      filename-and-process) 
	(mark " " (name 16 -1) " " filename)))

;; auto reload files from disk
(global-auto-revert-mode t)

;; Reload buffer shortcut
(global-set-key [f5] 
		'(lambda () 
		   (interactive) 
		   (revert-buffer nil t nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; put filename in clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun mp/put-buffername-on-clipboard () 
  "Put the current buffer name on the clipboard" 
  (interactive) 
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (abbreviate-file-name
									buffer-file-name)))) 
    (when filename (kill-new filename) 
	  (message filename))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reopen killed buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mp/load "reopen-killed-file.el")
