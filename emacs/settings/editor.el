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


;; Kill-Yank for Clipboard and Mouse
;; ---------------------------------------------------------

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
