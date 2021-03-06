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
  ;; - expiration date (normal buffers): 3 days (consider weekends!)
  ;; - expiration date (special buffers): 1 hour
  ;; - see doc on how to add more special buffers to the list.
  (setq clean-buffer-list-delay-general 3) 
  (setq clean-buffer-list-delay-special 3600)

  ;; buffers not to kill
  (add-to-list 'clean-buffer-list-kill-never-buffer-names "README.md"))

;; -----------------------------------------------------------------------------
;; buffer-move
;; -----------------------------------------------------------------------------
(use-package buffer-move 
  :commands (buf-move-up
	     buf-move-down
	     buf-move-left
	     buf-move-right))

;; -----------------------------------------------------------------------------
;; ibuffer
;; -----------------------------------------------------------------------------
;; (autoload 'ibuffer "ibuffer" "List buffers." t)

;; ;; nearly all of this is the default layout
;; (setq ibuffer-formats
;;       (quote ((mark modified read-only
;; 		    " " (name 50 50 :left :elide)
;; 		    " " (size 9 -1 :right)
;; 		    " " (mode 16 16 :left :elide)
;; 		    " " filename-and-process)
;; 	      (mark " " (name 16 -1)
;; 		    " " filename))))

;; auto reload files from disk
(global-auto-revert-mode t)

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
