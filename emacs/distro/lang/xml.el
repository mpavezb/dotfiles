;; -----------------------------------------------------------------------------
;; nxml-mode
;; https://www.emacswiki.org/emacs/NxmlMode
;; -----------------------------------------------------------------------------
(use-package nxml-mode
  :straight nil
  :init ;;
  ;; Use this mode for bazel BUILD files
  (autoload 'nxml-mode "nxml" "Associates xml files with nxml-mode." t) 
  (add-to-list 'auto-mode-alist (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt"
								  "svg" "rss" "launch" "test") t)
					      "\\'") 'nxml-mode)))
