;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs user filesystem
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -----------------------------------------------------------------------------
;; no-littering
;; Help keeping ~/.emacs.d clean
;; https://github.com/emacscollective/no-littering
;; -----------------------------------------------------------------------------
(use-package no-littering 
  :config
  ;; auto-saved files
  (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/")
					  t)))

  ;; customize (disabled)
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  ;; (load custom-file)
  ;;
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File Utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun mp/get-fullpath (@file-relative-path) 
  "Returns the full path, relative to caller's file location"
  (concat (file-name-directory (or load-file-name 
				   buffer-file-name)) @file-relative-path))
