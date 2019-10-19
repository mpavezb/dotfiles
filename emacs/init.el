;;
;; init.el
;; This file is the starting point for emacs configuration.
;; Matias Pavez

;; Keep it comented, otherwise will appear again.
;; (package-initialize)

;; ===============================================================
;; Load Helpers
;; ===============================================================
(defun mp/get-fullpath (@file-relative-path) 
  "Returns the full path, relative to caller's file location"
  (concat (file-name-directory (or load-file-name 
				   buffer-file-name)) @file-relative-path))

(defun mp/load (@settings-file) 
  "Loads the given file from settings folder"
  (load (mp/get-fullpath (concat "settings/" @settings-file))))


;; ===============================================================
;; Load required settings.
;; ===============================================================

;; Basics
;; ---------------------------------------------------------
(mp/load "package-system.el")
(mp/load "themes.el")
(mp/load "gui.el")
(mp/load "git.el")
(mp/load "uniquify.el")
(mp/load "editor.el")
(mp/load "neotree.el")
(mp/load "ido.el")
;; (mp/load "helm.el")
(mp/load "projectile.el")

;; Integrations
;; ---------------------------------------------------------
(mp/load "neotree-projectile.el")
;; (load (mp/get-fullpath "settings/helm-projectile.el"))

;; Language Specific
;; ---------------------------------------------------------
(mp/load "lisp.el")
(mp/load "org.el")
(mp/load "bazel.el")
(mp/load "xml.el")
(mp/load "cpp.el")
