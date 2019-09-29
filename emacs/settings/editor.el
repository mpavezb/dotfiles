;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs desktop-save-mode uses a lock file which is not removed
;; when a crash ocurrs. This function removes this lock file before
;; the next emacs instance tries to acquire it. 
(require 'desktop)
(defun my-remove-stale-lock-file (dir)
  (let ((pid (desktop-owner dir)))
    (when pid
      (let ((infile nil)
            (destination nil)
            (display nil))
        (unless (= (call-process "ps" infile destination display "-p"
                                 (number-to-string pid)) 0)
          (let ((lock-fn (desktop-full-lock-name dir)))
            (delete-file lock-fn)))))))

;; ;; remember buffers between sessions
(desktop-save-mode 1)
;; (let ((dir user-emacs-directory))
;;   (my-remove-stale-lock-file dir)
;;   (setq desktop-path (list dir))
;;   (desktop-save-mode 1))
;; (desktop-read)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; store backups inside user-emacs-directory.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; remember point position when reopening/revisiting each buffer
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; highlight parenthesis
(show-paren-mode 1)

;; show row,column numbers
(setq column-number-mode t)

;; auto reload files from disk
(global-auto-revert-mode t)

;; force newline at EOF
;;(setq require-final-newline t)

;; prefer spaces over tabs
;;(setq-default indent-tabs-mode nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kill-Yank for Clipboard and Mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Killing and yanking uses the X clipboard rather than just the primary selection.
(setq save-interprogram-paste-before-kill t)

; after copy Ctrl+c in Linux X11, you can paste by yanking in emacs.
(setq select-enable-clipboard t)

; Mouse yanking inserts at the point instead of the location of the click.
(setq mouse-yank-at-point t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; nearly all of this is the default layout
(setq ibuffer-formats 
      '((mark modified read-only " "
              (name 50 50 :left :elide) " "
	      (size 9 -1 :right) " "
              (mode 16 16 :left :elide) " " filename-and-process)
        (mark " " (name 16 -1) " " filename)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reopen killed buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keep a stack of killed buffers (only for files)
;; use the stack to reopen buffers.

(defvar killed-file-list nil
  "List of recently killed files.")

(defun add-file-to-killed-file-list ()
  "If buffer is associated with a file name, add that file to the
`killed-file-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name killed-file-list)))

(add-hook 'kill-buffer-hook #'add-file-to-killed-file-list)

;; reopen last killed files
(defun reopen-killed-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when killed-file-list
    (find-file (pop killed-file-list))))
(global-set-key (kbd "C-x M-k") 'reopen-killed-file)

;; reopen killed file from minibuffer list with autocompletion
(defun reopen-killed-file-fancy ()
  "Pick a file to revisit from a list of files killed during this
Emacs session."
  (interactive)
  (if killed-file-list
      (let ((file (completing-read "Reopen killed file: " killed-file-list
                                   nil nil nil nil (car killed-file-list))))
        (when file
          (setq killed-file-list (cl-delete file killed-file-list :test #'equal))
          (find-file file)))
    (error "No recently-killed files to reopen")))



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
