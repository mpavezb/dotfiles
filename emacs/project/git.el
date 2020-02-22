;; -----------------------------------------------------------------------------
;; magit
;; A Git Porcelain inside Emacs
;; https://magit.vc/
;; -----------------------------------------------------------------------------
(use-package magit 
  :defer t 
  :init (add-to-list 'package-pinned-packages '(magit . "melpa-stable") t) 
  :bind ("C-x g" . magit-status))

;; -----------------------------------------------------------------------------
;; magit-todos
;; Show TODOs in magit
;; https://github.com/alphapapa/magit-todos
;; -----------------------------------------------------------------------------
(use-package magit-todos 
  :defer t 
  :requires magit 
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
  :defer t 
  :init (add-to-list 'package-pinned-packages '(git-timemachine . "melpa-stable") t) 
  :bind ("C-c g g" . git-timemachine))

;; -----------------------------------------------------------------------------
;; browse-at-remote
;; Load source code in the browser.
;; https://github.com/rmuslimov/browse-at-remote
;; -----------------------------------------------------------------------------
(use-package browse-at-remote 
  :defer t 
  :bind ("C-c g b" . browse-at-remote))
