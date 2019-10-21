;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init.el
;; Matias Pavez
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Keep it comented, otherwise will appear again.
;; (package-initialize)

(defun mp/load (@settings-file) 
  "Loads the given file from the mp/ folder"
  (load (concat user-emacs-directory "mp/" @settings-file)))

;; = System =
(mp/load "system/packages.el")
(mp/load "system/files.el")

;; = GUI =
(mp/load "gui/gui.el")
(mp/load "gui/uniquify.el")
(mp/load "gui/themes.el")

;; = Project =
(mp/load "project/git.el")
(mp/load "project/projectile.el")
(mp/load "project/neotree.el")

;; = Editor =
(mp/load "editor/editor.el")
(mp/load "editor/buffer.el")
(mp/load "editor/ido.el")
;; (mp/load "editor/helm.el")

;; = Languages =
(mp/load "lang/org.el")
(mp/load "lang/bazel.el")
(mp/load "lang/xml.el")
(mp/load "lang/cpp.el")
(mp/load "lang/lisp.el")

;; = Integrations =
(mp/load "integrations/neotree-projectile.el")
;; (mp/load "integrations/helm-projectile.el")
