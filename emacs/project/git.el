;; Magit
;; A Git Porcelain inside Emacs
;; https://magit.vc/
(use-package 
  magit 
  :config (global-set-key (kbd "C-x g") 'magit-status))

;; Git Timemachine
;; Step through historic versions of git controlled file
;; https://gitlab.com/pidu/git-timemachine
(use-package 
  git-timemachine 
  :config (global-set-key (kbd "C-x C-g") 'git-timemachine))
