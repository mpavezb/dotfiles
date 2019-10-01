(tool-bar-mode -1)
(menu-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq server-mode t)

; Display buffername in the title bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b (•̀ᴗ•́)و"))))


(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; C-x C-0 restores the default font size

(add-hook 'text-mode-hook
            '(lambda ()
               (visual-line-mode 1)
                   (diminish 'visual-line-mode)
               ))


;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)


;; Provides only the command “restart-emacs”.
(use-package restart-emacs
  :commands restart-emacs)


;; Making it easier to discover Emacs key presses.
;; Emacs shows available key shortcuts while typing some command.
(use-package which-key
 :diminish which-key-mode
 :init (which-key-mode)
 :config (which-key-setup-side-window-bottom)
         (setq which-key-idle-delay 3.0)
)

;; Hide minibuffer markers
(use-package diminish)
;; (diminish 'eldoc-mode)
;; (diminish 'org-indent-mode)

;;
;;(use-package dash)    ;; “A modern list library for Emacs”
;;(use-package s   )    ;; “The long lost Emacs string manipulation library”.


;; Efficient version control.
(use-package magit
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package git-timemachine
  :config (global-set-key (kbd "C-x C-g") 'git-timemachine))

;; vc annotate: C-x v g
