;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init.el
;; Matias Pavez
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Keep it comented, otherwise will appear again.
;; (package-initialize)

(defun mp/load (@settings-file) 
  "Loads the given file from settings folder"
  (load (concat user-emacs-directory "settings/" @settings-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mp/load "package-system.el")
(mp/load "file-system.el")
(mp/load "themes.el")
(mp/load "gui.el")
(mp/load "git.el")
(mp/load "uniquify.el")
(mp/load "editor.el")
(mp/load "neotree.el")
(mp/load "ido.el")
;; (mp/load "helm.el")
(mp/load "projectile.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Integrations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mp/load "neotree-projectile.el")
;; (mp/load "helm-projectile.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Specific
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mp/load "lisp.el")
(mp/load "org.el")
(mp/load "bazel.el")
(mp/load "xml.el")
(mp/load "cpp.el")
