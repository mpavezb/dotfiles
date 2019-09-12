;; editor.el
;;
;; Basic editor configurations.
;; Non-language related.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; store backups inside user-emacs-directory.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; remember point position when reopening/revisiting each buffer
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; remember buffers between sessions
(desktop-save-mode 1)

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
