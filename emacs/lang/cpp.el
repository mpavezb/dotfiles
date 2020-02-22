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
(use-package clang-format+ 
  :defer t 
  :init (add-to-list 'package-pinned-packages '(magit . "melpa-stable") t) 
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
  :defer t 
  :diminish modern-c++-font-lock-mode 
  :config (modern-c++-font-lock-global-mode t))

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
