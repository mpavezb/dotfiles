(require 'projectile)
(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(progn
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
)
