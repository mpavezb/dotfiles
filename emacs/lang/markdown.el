;; -----------------------------------------------------------------------------
;; markdown-mode
;; Major mode for editing Markdown-formatted text.
;; https://jblevins.org/projects/markdown-mode/
;; -----------------------------------------------------------------------------
(use-package markdown-mode 
  :ensure t 
  :commands (markdown-mode gfm-mode) 
  :mode (("README\\.md\\'" . gfm-mode) 
	 ("\\.md\\'" . markdown-mode) 
	 ("\\.markdown\\'" . markdown-mode)) 
  :init (setq markdown-command "/usr/bin/pandoc"))
