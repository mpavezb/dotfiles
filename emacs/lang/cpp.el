;; -----------------------------------------------------------------------------
;; c++-mode
;; Major mode for C++
;; https://www.emacswiki.org/emacs/CPlusPlusMode
;; -----------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;;(add-hook 'c++-mode-hook 'origami-mode)

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
