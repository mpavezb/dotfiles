;; -----------------------------------------------------------------------------
;; c++-mode
;; Major mode for C++
;; https://www.emacswiki.org/emacs/CPlusPlusMode
;; -----------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;;(add-hook 'c++-mode-hook 'origami-mode)

;; -----------------------------------------------------------------------------
;; clang-format
;; Format C/C++ code
;; http://clang.llvm.org/docs/ClangFormat.html
;; https://github.com/SavchenkoValeriy/emacs-clang-format-plus
;; -----------------------------------------------------------------------------
;; TODO: Replace by lsp formatter
(use-package clang-format+ 
  :diminish clang-format+-mode
  ;; format buffer on save
  :hook (c-mode-common . clang-format+-mode) 
  :config (setq clang-format+-context 'buffer))

;; -----------------------------------------------------------------------------
;; modern-cpp-font-lock
;; Syntax highlighting for modern cpp until C++20
;; https://github.com/ludwigpacifici/modern-cpp-font-lock
;; -----------------------------------------------------------------------------
(use-package modern-cpp-font-lock 
  :diminish modern-c++-font-lock-mode 
  :hook (c++-mode . modern-c++-font-lock-mode))

;; -----------------------------------------------------------------------------
;; srefactor
;; Semantic refactoring for C/C++
;; https://github.com/tuhdo/semantic-refactor
;; -----------------------------------------------------------------------------
;; (use-package srefactor
;;   :bind (:map c-mode-map
;; 	      ("M-RET" . 'srefactor-refactor-at-point)
;; 	      :map c++-mode-map
;; 	      ("M-RET" . 'srefactor-refactor-at-point))
;;   :config (semantic-mode t))

;; -----------------------------------------------------------------------------
;; cmake-mode
;; major-mode for editing CMake sources
;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
;; -----------------------------------------------------------------------------
(use-package cmake-mode 
  :mode "CMakeLists.txt")
