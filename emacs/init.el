;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init.el
;; Matias Pavez
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mp/emacs-dir () 
  "Returns mp emacs directory."
  (concat user-emacs-directory "mp/"))

(defun mp/emacs-file (@filename) 
  "Returns path to mp emacs file."
  (concat (mp/emacs-dir) @filename))

(defun mp/load (@settings-file) 
  "Loads the given file from the mp/ folder"
  (load (mp/emacs-file @settings-file)))

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
(mp/load "editor/dired.el")
(mp/load "editor/editor.el")
(mp/load "editor/buffer.el")
(mp/load "editor/ido.el")
;; (mp/load "editor/helm.el")

;; = Org =
(mp/load "org/org.el")
;; (mp/load "org/journal.el")

;; = Languages =
(mp/load "lang/bazel.el")
(mp/load "lang/xml.el")
(mp/load "lang/cpp.el")
(mp/load "lang/lisp.el")
(mp/load "lang/python.el")
(mp/load "lang/web.el")

;; = Integrations =
(mp/load "integrations/neotree-projectile.el")
;;;; (mp/load "integrations/helm-projectile.el")
