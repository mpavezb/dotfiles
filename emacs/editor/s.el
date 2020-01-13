;; -----------------------------------------------------------------------------
;; s
;; https://github.com/magnars/s.el
;; -----------------------------------------------------------------------------
(use-package s)

(defun mp/s-replace (a b fun) 
  (let ((str (funcall fun 
		      (buffer-substring-no-properties 
		       a
		       b
		       end)))) 
    (progn (delete-region a b) 
	   (insert str))))

(defun mp/s-split-words (a b) 
  (interactive "r") 
  (mp/s-replace a b (lambda (str) 
		      (string-join (s-split-words str) " "))))

(defun mp/s-lower-camel-case (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-lower-camel-case))

(defun mp/s-upper-camel-case (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-upper-camel-case))

(defun mp/s-snake-case (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-snake-case))

(defun mp/s-dashed-words (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-dashed-words))

(defun mp/s-capitalized-words (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-capitalized-words))

(defun mp/s-titleized-words (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-titleized-words))

(defun mp/s-word-initials (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-word-initials))

(defun mp/s-upcase (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-upcase))

(defun mp/s-downcase (a b) 
  (interactive "r") 
  (mp/s-replace a b 's-downcase))
