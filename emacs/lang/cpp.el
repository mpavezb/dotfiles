;; -----------------------------------------------------------------------------
;; clang-format
;; http://clang.llvm.org/docs/ClangFormat.html
;; https://github.com/SavchenkoValeriy/emacs-clang-format-plus
;; -----------------------------------------------------------------------------
;; (sudo apt install clang-format)
(use-package clang-format+ 
  :diminish clang-format+-mode

  ;; format buffer on save
  :hook (c-mode-common . clang-format+-mode) 
  :config (setq clang-format+-context 'buffer))

;; -----------------------------------------------------------------------------
;; Syntax Highlighting
;; -----------------------------------------------------------------------------

;; syntax highlighting for modern cpp until C++20
;; https://github.com/ludwigpacifici/modern-cpp-font-lock
(use-package modern-cpp-font-lock 
  :diminish modern-c++-font-lock-mode 
  :config (modern-c++-font-lock-global-mode t))

;; -----------------------------------------------------------------------------
;; Refactoring
;; -----------------------------------------------------------------------------
(use-package srefactor 
  :config (semantic-mode 1))
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
