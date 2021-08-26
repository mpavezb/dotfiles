
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
