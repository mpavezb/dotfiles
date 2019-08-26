;; meaningful names for buffers with the same name
;; https://github.com/bbatsov/prelude

;; Examples:
;; forward                       bar/mumble/name    quux/mumble/name
;; reverse                       name\\mumble\\bar    name\\mumble\\quux
;; post-forward                  name|bar/mumble    name|quux/mumble
;; post-forward-angle-brackets   name<bar/mumble>   name<quux/mumble>
;; nil                           name               name<2>

(require 'uniquify)

(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

; directory separator
(setq uniquify-separator "/")

; rename after killing uniquified
(setq uniquify-after-kill-buffer-p t)

; don't muck with special buffers
(setq uniquify-ignore-buffers-re "^\\*")

