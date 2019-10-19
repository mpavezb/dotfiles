;; init.el
;;
;; This file is the starting point for emacs configuration.
;;
;;
;; Matias Pavez

;; Keep it comented, otherwise will appear again.
;; (package-initialize)

(message "=============================")
(message "Matias Pavez's Emacs Settings")
(message "=============================")

(defun mp/get-fullpath (@file-relative-path) 
  "Returns the full path, relative to caller's file location"
  (concat (file-name-directory (or load-file-name 
				   buffer-file-name)) @file-relative-path))


;; ===============================================================
;; Load required settings.
;; ===============================================================

;; Basics
;; ---------------------------------------------------------
(load (mp/get-fullpath "settings/package-system.el"))
(load (mp/get-fullpath "settings/themes.el"))
(load (mp/get-fullpath "settings/gui.el"))
(load (mp/get-fullpath "settings/git.el"))
(load (mp/get-fullpath "settings/uniquify.el"))
(load (mp/get-fullpath "settings/editor.el"))
(load (mp/get-fullpath "settings/neotree.el"))
(load (mp/get-fullpath "settings/ido.el"))
;;(load (mp/get-fullpath "settings/helm.el"))
(load (mp/get-fullpath "settings/projectile.el"))

;; Integrations
;; ---------------------------------------------------------
(load (mp/get-fullpath "settings/neotree-projectile.el"))
;; (load (mp/get-fullpath "settings/helm-projectile.el"))

;; Language Specific
;; ---------------------------------------------------------
(load (mp/get-fullpath "settings/lisp.el"))
(load (mp/get-fullpath "settings/org.el"))
(load (mp/get-fullpath "settings/bazel.el"))
(load (mp/get-fullpath "settings/xml.el"))
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
 '(custom-enabled-themes (quote (deeper-blue))) 
 '(package-selected-packages (quote (doom-themes solarized-theme git-timemachine magit diminish
						 which-key restart-emacs use-package
						 rainbow-delimiters helm projectile helm-projectile
						 neotree modern-cpp-font-lock yaml-mode bazel-mode
						 markdown-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
