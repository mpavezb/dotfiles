;; -----------------------------------------------------------------------------
;; dashboard
;; An extensible emacs dashboard
;; https://github.com/emacs-dashboard/emacs-dashboard
;; -----------------------------------------------------------------------------
(defun mp/dashboard-banner ()
  """Set a dashboard banner including information on package initialization
   time and garbage collections."""
  (setq dashboard-banner-logo-title
        (format "Emacs ready in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)))

(use-package dashboard
  :init ;;
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'mp/dashboard-banner)
  :config ;;
  ;; Banner
  (setq dashboard-startup-banner 2)

  ;; Footer
  ;; (setq dashboard-footer-messages '("Dashboard is pretty cool!"))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (setq dashboard-set-footer t)

  ;; General
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-init-info t)
  ;; (setq dashboard-init-info "This is an init message!")

  ;; Sections
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

  ;; Icons
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))

  ;; Navigator
  ;; TODO: show link to emacs updates and News
  ;; TODO: show link to emacs profiling
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
	`(((,(all-the-icons-octicon "mark-github" :height 1.0 :v-adjust -0.1) "dotfiles" "" (lambda (&rest _) (browse-url "https://github.com/mpavezb/dotfiles")) error)
	   (,(all-the-icons-faicon "trello" :height 1.0 :v-adjust -0.1) "trello" "" (lambda (&rest _) (browse-url "https://trello.com/b/ZlHGhGUZ/tasks")) warning))))

  ;; Load it!
  (dashboard-setup-startup-hook))
