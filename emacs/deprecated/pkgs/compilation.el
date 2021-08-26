
;; Follow files on error
(add-hook 'compilation-mode-hook (next-error-follow-minor-mode t))

;; Dont ask about saving buffers
(setq compilation-ask-about-save nil)

;; Stop on the first error.
(setq compilation-scroll-output 'next-error)

;; Ignore info and warnings.
(setq compilation-skip-threshold 2)

(defcustom mp/compile-window-size 105 
  "Width given to the non-compilation window." 
  :type 'integer 
  :group 'mp)

(defun mp/compile-please (comint) 
  "Compile without confirmation. With a prefix argument, use comint-mode." 
  (interactive "P")

  ;; Do the command without a prompt.
  (save-window-excursion (compile (eval compile-command) 
				  (and comint 
				       t)))

  ;; Create a compile window of the desired width.
  (pop-to-buffer (get-buffer "*compilation*"))
  (enlarge-window (- (frame-width) mp/compile-window-size (window-width)) 'horizontal))
