;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init.el
;; Matias Pavez
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar mp/emacs-dir
  (concat user-emacs-directory "distro/")
  "Returns mp emacs directory.")

(defun mp/emacs-file (@filename) 
  "Returns path to distro emacs file."
  (concat mp/emacs-dir @filename))

(defun mp/load (@settings-file) 
  "Loads the given file from the distro/ folder"
  (load (mp/emacs-file @settings-file)))

;; = System =
(mp/load "pkgs/packages.el")
(mp/load "pkgs/files.el")

;; = Editor =
(mp/load "pkgs/git.el")
(mp/load "pkgs/history.el")
(mp/load "pkgs/dired.el")
(mp/load "pkgs/editor.el")
(mp/load "pkgs/fzf.el")
(mp/load "pkgs/rg.el")
(mp/load "pkgs/buffer.el")
(mp/load "pkgs/helm.el")
(mp/load "pkgs/compilation.el")
(mp/load "pkgs/shell.el")

;; = Project =
(mp/load "pkgs/projectile.el")
(mp/load "pkgs/neotree.el")

;; = GUI =
(mp/load "pkgs/gui.el")
(mp/load "pkgs/uniquify.el")
(mp/load "pkgs/doom-modeline.el")
(mp/load "pkgs/themes.el")
(mp/load "pkgs/dashboard.el")

;; = Org =
;; (mp/load "pkgs/org.el")
;; (mp/load "pkgs/journal.el")

;; = Languages =
(mp/load "lang/ide.el")
(mp/load "lang/bazel.el")
(mp/load "lang/cpp.el")
(mp/load "lang/lisp.el")
(mp/load "lang/python.el")
(mp/load "lang/markdown.el")
(mp/load "lang/web.el")
(mp/load "lang/xml.el")
(mp/load "lang/yaml.el")
(mp/load "lang/misc.el")

;; = Misc =
(mp/load "pkgs/goodies.el")

;; = Custom Commands =
(put 'scroll-left 'disabled nil) ;; Reenabled Command
(mp/load "pkgs/s.el")
(mp/load "pkgs/reopen-killed-file.el")

;; = Perspective must be loaded after all hooks are set =
(mp/load "pkgs/perspective.el")

;; = Keybindings =
(mp/load "pkgs/keybindings.el")
