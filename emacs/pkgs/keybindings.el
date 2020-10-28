;; -----------------------------------------------------------------------------
;; Keybindings
;; -----------------------------------------------------------------------------
;; Disable a keybinding:
;;(global-set-key (kbd "<f11>") nil)


;; -----------------------------------------------------------------------------
;; Keybindings: F1 - F12
;; -----------------------------------------------------------------------------
;; ##        Fi                C-Fi                S-Fi                   Fi a
;; F1   <emacs> help                          <ubuntu> help
;; F2   <emacs> paging
;; F3   <emacs> macro
;; F4   <emacs> macro
;; F5   reset buffer
;; F6   bookmark-jump       bookmark-set      
;; F7
;; F8   neotree
;; F9   quick-compile       compile
;; F10  <emacs> menu
;; F11  <emacs> fullscreen
;; F12  focus-mode

;; helm-resume

;; (global-set-key (kbd "<f1>") 'helm-resume)

(defun mp/exec-term () (interactive) (ansi-term explicit-shell-file-name))
(defun mp/reset-buffer () (interactive) (revert-buffer nil t nil))


(global-set-key (kbd "<f1>") 'shell)
(global-set-key (kbd "C-<f1>") 'mp/exec-term)

(global-set-key [f5] 'mp/reset-buffer)

(global-set-key [f6] 'bookmark-jump)
(global-set-key [C-f6] 'bookmark-set)

(global-set-key [f8] 'mp/neotree-project-dir)

(define-key prog-mode-map [f9] 'mp/compile-please)
(define-key prog-mode-map [C-f9] 'compile)

(global-set-key [f12] 'focus-mode)

;;(global-set-key (kbd "S-<f2>")                       'helm-execute-kmacro)

;; -----------------------------------------------------------------------------
;; Keybindings: Remap emacs functions
;; -----------------------------------------------------------------------------

;; -----------------------------------------------------------------------------
;; Keybindings: Custom commands
;; -----------------------------------------------------------------------------

;;; Ctl-x-5 map
(define-key ctl-x-5-map (kbd "C-x c t") 'helm-top-in-frame)
(define-key ctl-x-5-map (kbd "C-x c i") 'helm-imenu-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-f") 'helm-find-files-in-frame)
(define-key ctl-x-5-map (kbd "M-x")     'helm-M-x-in-frame)
(define-key ctl-x-5-map (kbd "C-s")     'helm-occur-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-b") 'helm-mini-in-frame)
(define-key ctl-x-5-map (kbd "M-g a")   'helm-do-grep-ag-in-frame)
(define-key ctl-x-5-map (kbd "M-g g")   'helm-do-git-grep-in-frame)

;;; HELM
;; (global-set-key [remap execute-extended-command] #'helm-M-x) ;; is this way better?
;; (global-set-key [remap find-file] #'helm-find-files)         ;; is this way better?
;; Search Functions
(global-set-key (kbd "M-x")                 'undefined)
(global-set-key (kbd "M-x")                 'helm-M-x)
(global-set-key (kbd "M-y")                 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f")             'helm-find-files)
(global-set-key (kbd "C-x b")               'helm-buffers-list)
(global-set-key (kbd "C-c <SPC>")           'helm-all-mark-rings)
(global-set-key [remap bookmark-jump]       'helm-filtered-bookmarks)
(global-set-key (kbd "C-:")                 'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-,")                 'helm-calcul-expression)
(global-set-key (kbd "C-h d")               'helm-info-at-point)
(global-set-key (kbd "C-h i")               'helm-info)
(global-set-key (kbd "C-x C-d")             'helm-browse-project)
(global-set-key (kbd "C-h a")               'helm-apropos)
(global-set-key (kbd "C-h C-d")             'helm-debug-open-last-log)
(global-set-key (kbd "C-c i")               'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-c C-i")             'helm-imenu)
(global-set-key (kbd "C-s")                 'helm-occur)
(global-set-key [remap jump-to-register]    'helm-register)
(global-set-key [remap list-buffers]        'helm-mini)
(global-set-key [remap switch-to-buffer]    'helm-mini)
(global-set-key [remap dabbrev-expand]      'helm-dabbrev)
(global-set-key (kbd "M-g a")               'helm-do-grep-ag)
(global-set-key (kbd "M-g g")               'helm-grep-do-git-grep)
(global-set-key (kbd "C-x r p")             'helm-projects-history)
(global-set-key (kbd "C-c t r")             'helm-dictionary)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-<tab>") 'company-complete-common-or-cycle)
(global-set-key (kbd "C-x M-t") 'mp/theme-toggle)
(global-set-key (kbd "C-x M-p") 'mp/theme-picker-helm)
(global-set-key (kbd "C-x M-k") 'mp/reopen-killed-file)

;; C-x C-0 restores the default font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(defun mp/kill-buffer-prompt-if-unsaved () (interactive) (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'mp/kill-buffer-prompt-if-unsaved)

(global-set-key (kbd "C-c f f") 'fzf)
(global-set-key (kbd "C-c f d") 'fzf-directory)
(global-set-key (kbd "C-c f p") 'fzf-projectile)

(global-set-key (kbd "C-c C-s") 'rg-dwim-project-dir)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "M-+") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g g") 'git-timemachine)
(global-set-key (kbd "C-c g b") 'browse-at-remote)

;; ("C-c t" . google-translate-smooth-translate)

;; ("C-h r" . helm-info-emacs)
;;  :bind (("C-S-<up>" . buf-move-up) 
;;	 ("C-S-<down>" . buf-move-down) 
;;	 ("C-S-<left>" . buf-move-left) 
;;	 ("C-S-<right>" . buf-move-right)))

;; DISABLED
;; :bind (("C-x o" . switch-window)))
;; :bind (("C-c j" . org-journal-new-entry)) 
;; ("C-c a" . org-agenda) 
;; ("C-c l" . org-store-link)  ;; clash with lsp mode!
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-x C-b") 'persp-ibuffer)
;; (global-set-key (kbd "<backtab>") 'completion-at-point)


