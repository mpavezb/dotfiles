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

;; IDO mode
(load (mpb-get-fullpath "settings/ido.el"))

;; Uniquify
;; meaningful names for buffers with the same name
(load (mpb-get-fullpath "settings/uniquify.el"))

;; Editor
(load (mpb-get-fullpath "settings/editor.el"))

;; Projectile
(load (mpb-get-fullpath "settings/projectile.el"))

;; ORG mode
(load (mpb-get-fullpath "settings/org.el"))

;; Bazel Mode
(load (mpb-get-fullpath "settings/bazel.el"))

;; XML Mode
(load (mpb-get-fullpath "settings/xml.el"))


;;(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(modern-c++-font-lock-global-mode t)


;; ===============================================================
;; Emacs built-in customization tool.
;; ===============================================================111
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#2d2d2d" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#ff6188" "#fcfcfa"])
 '(beacon-color "#f2777a")
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai-pro)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "d1ede12c09296a84d007ef121cd72061c2c6722fcb02cb50a77d9eae4138a3ff" "1d2f406a342499f0098f9388b87d05ec9b28ccb12ca548f4f5fa80ae368235b6" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(history-length 1000)
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(modern-c++-font-lock-global-mode t)
 '(package-selected-packages
   (quote
    (monokai-alt-theme monokai-pro-theme monokai-theme darkokai-theme modern-cpp-font-lock yaml-mode bazel-mode color-theme-sanityinc-tomorrow markdown-mode)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(ring-bell-function (quote ignore))
 '(savehist-mode t)
 '(server-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
