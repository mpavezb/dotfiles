;; -----------------------------------------------------------------------------
;; Helm
;; Incremental completions and narrowing selections
;; https://github.com/emacs-helm/heml
;; -----------------------------------------------------------------------------
;; Based on: https://github.com/thierryvolpiatto/emacs-tv-config/blob/ce165bec3596f494a021076385c9edf3e7894506/init-helm.el
;; See also: https://github.com/davidlandry93/helm-ros
(require 'helm-config)
(require 'helm-mode)
(require 'helm-adaptive)
(require 'helm)
(require 'helm-files)
(require 'helm-for-files)

(defun helm/debug-toggle ()
  (interactive)
  (setq helm-debug (not helm-debug))
  (message "Helm Debug is now %s" (if helm-debug "Enabled" "Disabled")))

(defun helm/eselect-grep ()
  (interactive)
  (when (y-or-n-p (format "Current grep program is %s, switching? " (helm-grep-command)))
    (if (helm-grep-use-ack-p)
	(setq helm-grep-default-command "grep --color=always -d skip %e -n%cH -e %p %f"
	      helm-grep-default-recurse-command "grep --color=always -d recurse %e -n%cH -e %p %f")
      (setq helm-grep-default-command "ack-grep -Hn --color --smart-case --no-group %e %p %f"
    helm-grep-default-recurse-command "ack-grep -H --color --smart-case --no-group %e %p
%f"))
    (message "Switched to %s" (helm-grep-command))))

(defun helm/turn-on-header-line ()
  (interactive)
  (setq helm-echo-input-in-header-line t)
  (setq helm-split-window-in-side-p t)
  (helm-autoresize-mode -1)
  (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe))

(defun helm/turn-off-header-line ()
  (interactive)
  (setq helm-echo-input-in-header-line nil)
  ;;(helm-autoresize-mode 1)
  (setq helm-split-window-in-side-p nil)
  (remove-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe))

(defun helm/occur-which-func ()
  (interactive)
  (with-current-buffer (or (helm-aif (with-helm-buffer (window-buffer
							helm-persistent-action-display-window))
			       (and (null (minibufferp it))
				    it))
			   helm-current-buffer)
    (when (eq major-mode 'emacs-lisp-mode)
      (message "[%s]" (which-function)))))

;; -----------------------------------------------------------------------------
;; ctl-x-5-map
;; -----------------------------------------------------------------------------
(defun helm-find-files-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-find-files)))

(defun helm-M-x-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-M-x)))

(defun helm-occur-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-occur)))

(defun helm-mini-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-mini)))

(defun helm-do-grep-ag-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-do-grep-ag)))

(defun helm-do-git-grep-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-grep-do-git-grep)))

(defun helm-imenu-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-imenu)))

(defun helm-top-in-frame ()
  (interactive)
  (with-helm-in-frame (call-interactively #'helm-top)))
;; -----------------------------------------------------------------------------

;; DESCRIPTION
(use-package helm-mode
  :init (add-hook 'helm-mode-hook (lambda ()
				    (setq completion-styles (cond ((assq 'helm-flex
									 completion-styles-alist)
								   '(helm-flex)) ;; emacs-26.
								  ((assq 'flex
									 completion-styles-alist)
								   '(flex)))))) ;; emacs-27+.
  :config ;;
  (helm-mode 1)
  (setq helm-completing-read-handlers-alist '((xref-find-references .
								    helm-completing-read-default-find-tag)
					      (write-file . helm-read-file-name-handler-1)
					      (basic-save-buffer . helm-read-file-name-handler-1)
					      (find-tag . helm-completing-read-default-find-tag)
					      (xref-find-definitions .
								     helm-completing-read-default-find-tag)
					      (xref-find-references .
								    helm-completing-read-default-find-tag)
					      (tmm-menubar)
					      (mu4e-view-save-attachment-multi .
									       helm-read-file-name-handler-1)
					      (mu4e-view-save-attachment-single .
										helm-read-file-name-handler-1)
					      (cancel-debug-on-entry)
					      (org-capture . helm-org-completing-read-tags)
					      (org-set-tags . helm-org-completing-read-tags)
					      (dired-do-rename . helm-read-file-name-handler-1)
					      (dired-do-copy . helm-read-file-name-handler-1)
					      (dired-do-symlink . helm-read-file-name-handler-1)
					      (dired-do-relsymlink . helm-read-file-name-handler-1)
					      (dired-do-hardlink . helm-read-file-name-handler-1)
					      (basic-save-buffer . helm-read-file-name-handler-1)
					      (write-file . helm-read-file-name-handler-1)
					      (write-region . helm-read-file-name-handler-1))))

;; DESCRIPTION
(use-package helm-adaptive
  :config ;;
  (setq helm-adaptive-history-file nil)
  (helm-adaptive-mode 1))


;; DESCRIPTION
(use-package helm-utils
  :config
  ;; Popup buffer-name or filename in grep/moccur/imenu-all etc...
  ;; (helm-popup-tip-mode 1)
  (setq helm-highlight-matches-around-point-max-lines 30)
  (setq helm-window-show-buffers-function #'helm-window-mosaic-fn)
  (add-hook 'find-file-hook 'helm-save-current-pos-to-mark-ring))

(use-package helm-sys
  :commands (helm-top)
  :config (helm-top-poll-mode 1))

(use-package helm-info
  :bind ("C-h r" . helm-info-emacs))


(use-package helm-ring
  :config (setq helm-kill-ring-threshold 1)
  ;; Action for helm kill-ring
  (defun helm/emamux:copy-from-kill-ring (candidate)
    (require 'emamux)
    (emamux:check-tmux-running)
    (when (null kill-ring)
      (error
       "kill-ring is nil!!"))
    (emamux:set-buffer candidate 0))
  (add-to-list 'helm-kill-ring-actions '("Emamux copy" . helm/emamux:copy-from-kill-ring) t)
  :bind (:map helm-kill-ring-map
	      ("C-d" . helm-kill-ring-run-persistent-delete)))


(use-package helm-ls-git
  :config
  ;; Use `magit-status-setup-buffer' instead of
  ;; `magit-status-internal' with recent magit.
  (setq helm-ls-git-status-command 'magit-status-internal)
  (cl-defmethod
    helm-setup-user-source
    ((source helm-ls-git-source))
    (helm-source-add-action-to-source-if "Magit find file" (lambda (candidate)
							     (magit-find-file
							      (magit-branch-or-commit-at-point)
							      candidate)) source (lambda
										   (_candidate)
										   ;; For `magit-branch-or-commit-at-point'.
										   (require
										    'magit-git)
										   (with-helm-current-buffer
										     (magit-branch-or-commit-at-point)))
							      1)))

(use-package helm-buffers
  :config ;;
  (setq helm-buffers-favorite-modes (append helm-buffers-favorite-modes '(picture-mode
										  artist-mode)))
  (setq helm-buffers-fuzzy-matching       t)
  (setq helm-buffer-skip-remote-checking  t)
  (setq helm-buffer-max-length            60)
  (setq helm-buffers-end-truncated-string "…")
  (setq helm-buffers-maybe-switch-to-tab  t)
  (setq helm-mini-default-sources
		'(helm-source-buffers-list helm-source-buffer-not-found))
  (define-key helm-buffer-map (kbd "C-d") 'helm-buffer-run-kill-persistent)
  (cl-defmethod
    helm-setup-user-source
    ((source helm-source-buffers))
    "Adds additional actions to `helm-source-buffers-list'.
- Magit status."
    (setf (slot-value source 'candidate-number-limit) 300)
    (helm-aif (slot-value source 'action)
	(setf (slot-value source 'action)
	      (helm-append-at-nth (if (symbolp it)
				      (symbol-value it) it)
				  '(("Diff buffers" . helm-buffers-diff-buffers)) 4)))
    (helm-source-add-action-to-source-if "Magit status" (lambda (candidate)
							  (funcall helm-ls-git-status-command
								   (with-current-buffer candidate
								     default-directory))) source
								     (lambda (candidate)
								       (locate-dominating-file
									(with-current-buffer
									    candidate
									  default-directory)
									".git")) 1)))


(use-package helm-files
  :config ;;
  (setq helm-ff-auto-update-initial-value        nil) 
  (setq helm-ff-allow-non-existing-file-at-point t) 
  (setq helm-trash-remote-files                  t) 
  (setq helm-dwim-target 'next-window)
  (customize-set-variable 'helm-ff-lynx-style-map t)
  (define-key helm-read-file-map (kbd "RET") 'helm-ff-RET)
  (define-key helm-find-files-map (kbd "C-i") nil)
  (define-key helm-find-files-map (kbd "C-/") 'helm-ff-run-find-sh-command)
  (define-key helm-find-files-map (kbd "C-d") 'helm-ff-persistent-delete)
  (defun helm/insert-date-in-minibuffer ()
    (interactive)
    (with-selected-window (or (active-minibuffer-window)
			      (minibuffer-window))
      (unless (or (helm-follow-mode-p)
		  helm--temp-follow-flag)
	(goto-char (point-max))
	(insert (format-time-string "%Y-%m-%d-%H:%M")))))
  (define-key helm-find-files-map (kbd "C-c y") 'helm/insert-date-in-minibuffer)
  (define-key helm-read-file-map (kbd "C-c y") 'helm/insert-date-in-minibuffer)
  (defun helm/ff-candidates-lisp-p (candidate)
    (cl-loop for cand in (helm-marked-candidates) always (string-match "\\.el$" cand)))

;; Add actions to `helm-source-find-files' IF:
  (cl-defmethod helm-setup-user-source ((source helm-source-ffiles))
    "Adds additional actions to `helm-find-files'.
    - Byte compile file(s) async
    - Byte recompile directory
    - Magit status
    - Github issues
    - Patch region on directory
    - Update directory autoloads"
    (helm-source-add-action-to-source-if
     "Byte compile file(s) async"
     (lambda (_candidate)
       (cl-loop for file in (helm-marked-candidates)
                do (async-byte-compile-file file)))
     source
     'helm/ff-candidates-lisp-p)
    (helm-source-add-action-to-source-if
     "Recover file"
     (lambda (candidate)
       (recover-file candidate))
     source
     (lambda (candidate)
       (file-exists-p (expand-file-name
                       (format "#%s#" (helm-basename candidate))
                       (helm-basedir candidate)))))
    (helm-source-add-action-to-source-if
     "Byte recompile directory (async)"
     'async-byte-recompile-directory
     source
     'file-directory-p)
    (helm-source-add-action-to-source-if
     "Magit status"
     (lambda (_candidate)
       (funcall helm-ls-git-status-command
                helm-ff-default-directory))
     source
     (lambda (candidate)
       (and (not (string-match-p ffap-url-regexp candidate))
            helm-ff-default-directory
            (locate-dominating-file helm-ff-default-directory ".git")))
     1)
    (helm-source-add-action-to-source-if
     "Patch region on directory"
     (lambda (_candidate)
       (with-helm-current-buffer
         (shell-command-on-region (region-beginning) (region-end)
                                  (format "patch -d %s -p1"
                                          helm-ff-default-directory))))
     source
     (lambda (_candidate)
       (with-helm-current-buffer
         (and (or (eq major-mode 'mu4e-view-mode)
                  (eq major-mode 'diff-mode))
              (region-active-p))))
     1)
    (helm-source-add-action-to-source-if
     "Update directory autoloads"
     (lambda (candidate)
       (require 'autoload)
       (let ((default-directory helm-ff-default-directory)
             (generated-autoload-file
              (read-file-name "Write autoload definitions to file: "
                              helm-ff-default-directory
                              nil nil nil
                              (lambda (f)
                                (string-match "autoloads\\|loaddefs" f)))))
         (cl-letf (((symbol-function 'autoload-generated-file)
                    (lambda ()
                      (expand-file-name generated-autoload-file default-directory))))
           (update-directory-autoloads (expand-file-name candidate)))))
     source
     (lambda (candidate)
       (and (file-directory-p candidate)
            (string= (helm-basename candidate) ".")))
     1)))

(use-package helm-dictionary ; Its autoloads are already loaded.
  :disabled
  :commands helm-dictionary
  :config
  (setq helm-dictionary-database
        '(("en-fr" . "~/helm-dictionary/dic-en-fr.iso")
          ("fr-en" . "~/helm-dictionary/dic-fr-en.iso"))
        helm-dictionary-online-dicts
        '(("translate.reference.com en->fr" .
           "http://translate.reference.com/translate?query=%s&src=en&dst=fr")
          ("translate.reference.com fr->en" .
           "http://translate.reference.com/translate?query=%s&src=fr&dst=en"))))

(use-package helm-descbinds
  :config
  ;; C-h b, C-x C-h etc...
  (helm-descbinds-mode 1))


(use-package helm-lib
  :config
  ;; scroll 4 lines other window using M-<next>/M-<prior>
  (setq helm-scroll-amount 4))

(use-package helm
  :config
  (setq helm-input-idle-delay                     0.01
        helm-reuse-last-window-split-state        t
        helm-always-two-windows                   t
        helm-split-window-inside-p                nil
        helm-commands-using-frame                 '(completion-at-point
                                                    helm-apropos
                                                    helm-eshell-prompts helm-imenu
                                                    helm-imenu-in-all-buffers)
        helm-actions-inherit-frame-settings       t
        helm-use-frame-when-more-than-two-windows t
        helm-use-frame-when-dedicated-window      t
        helm-frame-background-color               "DarkSlateGray"
        helm-show-action-window-other-window      'left
        helm-allow-mouse                          t
        helm-move-to-line-cycle-in-source         t ;; move to end or beginning of source when reaching top or bottom of source.
        helm-autoresize-max-height                80 ; it is %.
        helm-autoresize-min-height                20 ; it is %.
        helm-debug-root-directory                 "/tmp/helm-debug"
        helm-follow-mode-persistent               t
        helm-candidate-number-limit               500)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-info-bash)
  (helm-define-key-with-subkeys global-map (kbd "C-c n") ?n 'helm-cycle-resume))

(use-package helm-external
  :config
  (setq helm-raise-command                 "wmctrl -xa %s")
  (setq helm-default-external-file-browser "nautilus"))

(use-package helm-grep
  :config
  (setq helm-pdfgrep-default-read-command
        "evince --page-label=%p '%f'"
        helm-grep-default-command
        "ack-grep -Hn --color --smart-case --no-group %e %p %f"
        helm-grep-default-recurse-command
        "ack-grep -H --color --smart-case --no-group %e %p %f"
        helm-grep-ag-command
        "rg --color=always --colors 'match:bg:yellow' --colors 'match:fg:black' --smart-case --no-heading --line-number %s %s %s"
        helm-grep-ag-pipe-cmd-switches
        '("--colors 'match:bg:yellow' --colors 'match:fg:black'")
        helm-grep-git-grep-command
        "git --no-pager grep -n%cH --color=always --exclude-standard --no-index --full-name -e %p -- %f")
  (add-hook 'helm-grep-mode-hook 'hl-line-mode)
  (define-key helm-grep-map   (kbd "C-M-a") 'helm/occur-which-func))

(use-package helm-occur
  :config
  (add-hook 'helm-occur-mode-hook 'hl-line-mode)
  (define-key helm-occur-map (kbd "C-M-a") 'helm/occur-which-func))

(use-package helm-elisp
  :config
  (setq helm-show-completion-display-function #'helm-display-buffer-in-own-frame
        helm-apropos-fuzzy-match              t
        helm-lisp-fuzzy-completion            t)
  (helm-multi-key-defun helm-multi-lisp-complete-at-point
      "Multi key function for completion in emacs lisp buffers.
First call indent, second complete symbol, third complete fname."
    '(helm-lisp-indent
      helm-lisp-completion-at-point
      helm-complete-file-name-at-point)
    0.3)
  (define-key emacs-lisp-mode-map (kbd "TAB") 'helm-multi-lisp-complete-at-point)
  (define-key lisp-interaction-mode-map (kbd "TAB") 'helm-multi-lisp-complete-at-point))

;; helm-locate
;; https://github.com/emacs-helm/helm/wiki/Locate
;; (<helm-prefix> l by default) is Helm’s interface to the locate command,
;; which finds files on your system that have been indexed with updatedb.
(use-package helm-locate
  :config
  (setq helm-locate-fuzzy-match t))

(use-package helm-org
  :config
  (setq helm-org-headings-fontify t))

(use-package helm-find
  :config
  (setq helm-find-noerrors t))

(use-package helm-fd)

(use-package helm-elisp-package
  :config
  (setq helm-el-package-autoremove-on-start t
        helm-el-package-upgrade-on-start t))

(use-package helm-imenu
  :config
  (customize-set-variable 'helm-imenu-lynx-style-map t))

(use-package helm-rg)

;;; Ctl-x-5 map
;;
(define-key ctl-x-5-map (kbd "C-x c t") 'helm-top-in-frame)
(define-key ctl-x-5-map (kbd "C-x c i") 'helm-imenu-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-f") 'helm-find-files-in-frame)
(define-key ctl-x-5-map (kbd "M-x")     'helm-M-x-in-frame)
(define-key ctl-x-5-map (kbd "C-s")     'helm-occur-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-b") 'helm-mini-in-frame)
(define-key ctl-x-5-map (kbd "M-g a")   'helm-do-grep-ag-in-frame)
(define-key ctl-x-5-map (kbd "M-g g")   'helm-do-git-grep-in-frame)

;;; Helm-command-map (C-x c)
;;
;;
(define-key helm-command-map (kbd "g") 'helm-apt)
(define-key helm-command-map (kbd "z") 'helm-complex-command-history)
(define-key helm-command-map (kbd "I") 'helm-imenu-in-all-buffers)
(define-key helm-command-map (kbd "@") 'helm-list-elisp-packages-no-fetch)

;;; Global-map
;;
;;
(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)
(global-set-key (kbd "M-y")                          'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f")                      'helm-find-files)
(global-set-key (kbd "C-x b")                        'helm-buffers-list)
(global-set-key (kbd "C-c <SPC>")                    'helm-all-mark-rings)
(global-set-key [remap bookmark-jump]                'helm-filtered-bookmarks)
(global-set-key (kbd "C-:")                          'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-,")                          'helm-calcul-expression)
(global-set-key (kbd "C-h d")                        'helm-info-at-point)
(global-set-key (kbd "C-h i")                        'helm-info)
(global-set-key (kbd "C-x C-d")                      'helm-browse-project)
(global-set-key (kbd "<f1>")                         'helm-resume)
(global-set-key (kbd "C-h C-f")                      'helm-apropos)
(global-set-key (kbd "C-h a")                        'helm-apropos)
(global-set-key (kbd "C-h C-d")                      'helm-debug-open-last-log)
;; (global-set-key (kbd "<f5> s")                       'helm-find)
(global-set-key (kbd "S-<f2>")                       'helm-execute-kmacro)
(global-set-key (kbd "C-c i")                        'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-c C-i")                      'helm-imenu)
(global-set-key (kbd "<f11>")                        nil)
(global-set-key (kbd "<f11> o")                      'helm-org-agenda-files-headings)
(global-set-key (kbd "C-s")                          'helm-occur)
(define-key global-map [remap jump-to-register]      'helm-register)
(define-key global-map [remap list-buffers]          'helm-mini)
(define-key global-map [remap dabbrev-expand]        'helm-dabbrev)
(define-key global-map (kbd "M-g a")                 'helm-do-grep-ag)
(define-key global-map (kbd "M-g g")                 'helm-grep-do-git-grep)
(define-key global-map (kbd "C-x r p")               'helm-projects-history)
(define-key global-map (kbd "C-c t r")               'helm-dictionary)

;; Indent or complete with completion-at-point
;; (setq tab-always-indent 'complete)

;; (define-key global-map (kbd "<backtab>") 'completion-at-point)

;; Minibuffer history (Rebind to M-s).
(customize-set-variable 'helm-minibuffer-history-key [remap next-matching-history-element])

;; Avoid hitting forbidden directories when using find.
(add-to-list 'completion-ignored-extensions ".gvfs/")
(add-to-list 'completion-ignored-extensions ".dbus/")
(add-to-list 'completion-ignored-extensions "dconf/")
