;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matias Pavez"
      user-mail-address "matias.pavez.b@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; LSP using clangd instead of ccls
(setq lsp-clients-clangd-args '("-j=4"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(after! lsp
  (require 'dap-cpptools))

;; window-select config
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "goldenrod" :background "black"
    :weight bold :height 2.5 :box (:line-width 10 :color "black")))


;; -----------------------------------------------------------------------------
;; ORG MODE
;; -----------------------------------------------------------------------------
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/gdrive/work/org/")
(after! org

  ;; -------------------------------------
  ;; Edition
  ;; -------------------------------------
  ;; Fold all source blocks on startup.
  (setq org-hide-block-startup nil)

  ;; Avoid accidentally editing folded regions.
  (setq org-catch-invisible-edits 'show)

  ;; Give quote and verse blocks a nice look.
  (setq org-fontify-quote-and-verse-blocks t)

  ;; Pressing ENTER on a link should follow it.
  (setq org-return-follows-link t)

  ;; When active, indent text according to outline structure.
  (setq org-indent-mode t)

  (setq org-tags-column -80)

  ;; -------------------------------------
  ;; Todo
  ;; -------------------------------------
  ;; Sequences:
  ;; - Before "|": States requiring action. Displayed in the global TODO list.
  ;; - After  "|": States requiring no further action.
  ;;
  ;; Event Handlers:
  ;; - @: Record note with timestamp.
  ;; - !: Record timestamp on selection.
  ;; - X/Y: Use X on enter, use Y on exit.
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WIP(s@/!)" "|" "DONE(d@/!)")
          (sequence "WAIT(w@/!)" "HOLD(h@/!)" "|" "CANC(c@/!)")))

  (setq org-todo-keyword-faces
        '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
          ("WIP" :foreground "#0098dd" :weight normal :underline t)
          ("DONE" :foreground "#50a14f" :weight normal :underline t)
          ("WAIT" :foreground "#9f7efe" :weight normal :underline t)
          ("HOLD" :foreground "#9f7efe" :weight normal :underline t)
          ("CANC" :foreground "#ff6480" :weight normal :underline nil :strike-through t)))

  ;; -------------------------------------
  ;; Priorities
  ;; -------------------------------------

  ;; set priority range from A to C with default A
  (setq org-highest-priority ?A)
  (setq org-default-priority ?B)
  (setq org-lowest-priority ?C)

  ;; set colours for priorities
  (setq org-priority-faces
        (quote ((?A . (:foreground "#e45649" :weight small))
                (?B . (:foreground "#da8548" :weight small))
                (?C . (:foreground "#0098dd" :weight small)))))


  ;; -------------------------------------
  ;; Src Snippets
  ;; -------------------------------------
  ;; Tab should do indent in code blocks
  (setq org-src-tab-acts-natively t)

  ;; Don't auto modify src code indentation.
  (setq org-src-preserve-indentation t)


  ;; Undone dependencies block switching parent to DONE.
  (setq org-enforce-todo-dependencies t)


  (setq org-log-into-drawer "LOGBOOK")
  ;;
  ;;
  (add-to-list 'org-modules 'org-habit)

  (setq org-refile-allow-creating-parent-nodes 'confirm)
  ;; (setq org-refile-targets)
  (setq org-refile-use-outline-path 'file)
  ;;
)

(after! org-fancy-priorities
    (setq org-fancy-priorities-list '((?A . "■")
                                      (?B . "■")
                                      (?C . "■")))
    ;;
    )

(after! org-journal
  (setq org-journal-dir "~/gdrive/work/org/journal/")

  ;; Set log date as  first level headline.
  (setq org-journal-date-prefix "* ")

  ;; Set log entries as second level headlines.
  (setq org-journal-time-prefix "** ")

  ;; Log weekly starting on Sunday
  (setq org-journal-file-type 'weekly)
  (setq org-journal-start-on-weekday 7)

  (setq org-journal-date-format "%a, %Y-%m-%d")
  (setq org-journal-file-format "%Y-%m-%d.org")

  ;;
  )

(after! org-agenda

  ;; agenda files
  ;; TODO: Maybe this messes up with refile!
  (setq org-agenda-files
      (directory-files-recursively "~/gdrive/work/org/" "\\.org$"))

  (setq org-agenda-prefix-format '((agenda . " %i %-20:c%?-12t%-6e% s")
			           (todo   . " %i %-20:c %-6e")
			           (tags   . " %i %-20:c")
			           (search . " %i %-20:c")))

  ;; (C-c n a d) Todays Agenda
  (setq org-agenda-custom-commands
        '(("d" "Today's Tasks"
           ((agenda "" ((org-agenda-span 1)
                        (org-agenda-overriding-header "Today's Tasks")))))))

  (setq org-agenda-skip-scheduled-if-done t)

  ;;
  )

(after! org-clock
  ;; Always change the task to WIP on clock in.
  (setq org-clock-in-switch-to-state "WIP")

  ;; Resolve open clocks when idle for more than X min
  (setq org-clock-idle-time 30)
  ;;
  )
