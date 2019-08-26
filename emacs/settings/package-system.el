;; ===============================================================
;; Package system
;; ===============================================================

(message "")
(message " Loading package system ...   ")
(message " ---------------------------- ")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; load from MELPA
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)

  ;; load from MELPA-STABLE
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)

  ;; load from GNU ELPA for older versions of emacs.
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))


(package-initialize)

; prevents stale elisp bytecode from shadowing more up-to-date source files.
(setq load-prefer-newer t)
