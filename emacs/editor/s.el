;; -----------------------------------------------------------------------------
;; s
;; https://github.com/magnars/s.el
;; -----------------------------------------------------------------------------
(use-package s)

(defun mp/s-replace (a b fun) 
  (let ((str (funcall fun 
		      (buffer-substring-no-properties 
		       a
		       b)))) 
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

;; TODO: Refactor this!, Should not duplicate all functions.
(defun mp/mc-helper (fun) 
  "Executes the provided function over all available cursors."
  (mc/for-each-cursor-ordered (mc/execute-command-for-fake-cursor fun cursor)))

(defun mp/mc-s-split-words () 
  (interactive) 
  (mp/mc-helper 'mp/s-split-words))

(defun mp/mc-s-lower-camel-case () 
  (interactive) 
  (mp/mc-helper 'mp/s-lower-camel-case))

(defun mp/mc-s-upper-camel-case () 
  (interactive) 
  (mp/mc-helper 'mp/s-upper-camel-case))

(defun mp/mc-s-snake-case () 
  (interactive) 
  (mp/mc-helper 'mp/s-snake-case))

(defun mp/mc-s-dashed-words () 
  (interactive) 
  (mp/mc-helper 'mp/s-dashed-words))

(defun mp/mc-s-capitalized-words () 
  (interactive) 
  (mp/mc-helper 'mp/s-capitalized-words))

(defun mp/mc-s-titleized-words () 
  (interactive) 
  (mp/mc-helper 'mp/s-titleized-words))

(defun mp/mc-s-word-initials () 
  (interactive) 
  (mp/mc-helper 'mp/s-word-initials))

(defun mp/mc-s-upcase () 
  (interactive) 
  (mp/mc-helper 'mp/s-upcase))

(defun mp/mc-s-downcase () 
  (interactive) 
  (mp/mc-helper 'mp/s-downcase))
