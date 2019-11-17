;; Magit
;; A Git Porcelain inside Emacs
;; https://magit.vc/
(use-package magit 
  :config (global-set-key (kbd "C-x g") 'magit-status))

;; magit-todos
;; Show TODOs in magit
;; https://github.com/alphapapa/magit-todos
(use-package magit-todos 
  :config () 
  (magit-todos-mode t)

  ;; select diff against HEAD^ (last commit), master (all commits)
  (setq magit-todos-branch-list-commit-ref "master"))

;; Git Timemachine
;; Step through historic versions of git controlled file
;; https://gitlab.com/pidu/git-timemachine
(use-package git-timemachine 
  :config (global-set-key (kbd "C-x C-g") 'git-timemachine))


;; browse-at-remote
;; https://github.com/rmuslimov/browse-at-remote
(use-package browse-at-remote 
  :config (global-set-key (kbd "C-c g g") 'browse-at-remote))
