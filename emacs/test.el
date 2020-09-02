;; -----------------------------------------------------------------------------
;; This expresions can be used for testing a new emacs installation
;; -----------------------------------------------------------------------------

;; Native Compilation Support
(if (and (fboundp 'native-comp-available-p)
       (native-comp-available-p))
  (message "Native compilation is available")
  (message "Native complation is *not* available"))

;; Native JSON support
(if (functionp 'json-serialize)
  (message "Native JSON is available")
(message "Native JSON is *not* available"))
