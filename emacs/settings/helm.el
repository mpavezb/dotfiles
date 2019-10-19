;; Helm
;; Incremental completions and narrowing selections
;; https://github.com/emacs-helm/heml

(use-package 
  helm)
(progn 
  (use-package 
    helm-config)

  ;; Use C-c h instead of default C-x c, it makes more sense.
  (global-set-key (kbd "C-c h") 'helm-command-prefix) 
  (global-unset-key (kbd "C-x c")) 
  (setq
   ;; move to end or beginning of source when reaching top or bottom of source.
   helm-move-to-line-cycle-in-source t

   ;; search for library in `require' and `declare-function' sexp.
   helm-ff-search-library-in-sexp t

   ;; scroll 8 lines other window using M-<next>/M-<prior>
   helm-scroll-amount 8 helm-ff-file-name-history-use-recentf t helm-echo-input-in-header-line t)

  ;; Command M-x : Command list and fuzzy completion.
  (global-set-key (kbd "M-x") 'helm-M-x) 
  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

  ;; Command C-x C-f : Improved navigation.
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  ;; Command: M-y : Displays kill ring.
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  ;; Command C-x b : Buffer list.
  (global-set-key (kbd "C-x b") 'helm-mini) 
  (setq helm-buffers-fuzzy-matching t helm-recentf-fuzzy-match t)

  ;; TOOD: helm-semantic has not syntax coloring! How can I fix that?
  (setq helm-semantic-fuzzy-match t helm-imenu-fuzzy-match t)

  ;; Lists all occurences of a pattern in buffer.
  (global-set-key (kbd "C-c h o") 'helm-occur) 
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

  ;; open helm buffer inside current window, not occupy whole other window
  (setq helm-split-window-inside-p t helm-autoresize-max-height 50 helm-autoresize-min-height 30) 
  (helm-autoresize-mode 1) 
  (helm-mode 1))
