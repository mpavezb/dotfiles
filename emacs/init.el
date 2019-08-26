;; init.el
;
; This file is the starting point for emacs configuration.
; 
;
; Matias Pavez

;; Keep it comented, otherwise will appear again.
;; (package-initialize)

(message "=============================")
(message "Matias Pavez's Emacs Settings")
(message "=============================")

(defun mpb-get-fullpath (@file-relative-path)
  "Returns the full path, relative to caller's file location"
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
)


;; ===============================================================
;; Load required settings.
;; ===============================================================

;; Package system
(load (mpb-get-fullpath "settings/package-system.el"))

;; GUI
(load (mpb-get-fullpath "settings/gui.el"))

;; Uniquify
;; meaningful names for buffers with the same name
(load (mpb-get-fullpath "settings/uniquify.el"))

;; Editor
(load (mpb-get-fullpath "settings/editor.el"))

;; IDO mode
(load (mpb-get-fullpath "settings/ido.el"))

;; ORG mode
(load (mpb-get-fullpath "settings/org.el"))

;; Bazel Mode
(load (mpb-get-fullpath "settings/bazel.el"))

;; XML Mode
(load (mpb-get-fullpath "settings/xml.el"))


;; ===============================================================
;; Ide Settings
;; ===============================================================

;; Projectile
;; ---------------------------------------------------------------
(require 'projectile)
(progn
  (projectile-mode)
)


;; ===============================================================
;; Emacs built-in customization tool.
;; ===============================================================111
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(history-length 1000)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (bazel-mode color-theme-sanityinc-tomorrow markdown-mode)))
 '(ring-bell-function (quote ignore))
 '(savehist-mode t)
 '(server-mode t)
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
