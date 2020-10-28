;; -----------------------------------------------------------------------------
;; magit
;; A Git Porcelain inside Emacs
;; https://magit.vc/
;; -----------------------------------------------------------------------------
(use-package magit 
  :commands (magit-status))

;; -----------------------------------------------------------------------------
;; magit-todos
;; Show TODOs in magit
;; https://github.com/alphapapa/magit-todos
;; -----------------------------------------------------------------------------
(use-package magit-todos
  :disabled 
  :after (magit) 
  :config ;;
  (magit-todos-mode t)

  ;; select diff against HEAD^ (last commit), master (all commits)
  (setq magit-todos-branch-list-commit-ref "master"))

;; -----------------------------------------------------------------------------
;; git-timemachine
;; Step through historic versions of git controlled file
;; https://gitlab.com/pidu/git-timemachine
;; -----------------------------------------------------------------------------
(use-package git-timemachine 
  :commands (git-timemachine))

;; -----------------------------------------------------------------------------
;; browse-at-remote
;; Load source code in the browser.
;; https://github.com/rmuslimov/browse-at-remote
;; -----------------------------------------------------------------------------
(use-package browse-at-remote 
  :commands (browse-at-remote)
  :config ;;
  ;; (add-to-list 'browse-at-remote-remote-type-domains '("my.domain.com" . "github"))
  ;;
  )
