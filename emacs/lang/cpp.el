

;; -----------------------------------------------------------------------------
;; clang-format
;; http://clang.llvm.org/docs/ClangFormat.html
;; https://github.com/SavchenkoValeriy/emacs-clang-format-plus
;; -----------------------------------------------------------------------------
;; (sudo apt install clang-format)
(use-package clang-format+)

;; format buffer on save
(add-hook 'c-mode-common-hook #'clang-format+-mode)
(setq clang-format+-context 'buffer)


;; -----------------------------------------------------------------------------
;; Syntax Highlighting
;; -----------------------------------------------------------------------------

;; syntax highlighting for modern cpp until C++20
;; https://github.com/ludwigpacifici/modern-cpp-font-lock
(use-package modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)
