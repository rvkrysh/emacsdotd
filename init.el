;; define init file
(setq init-file (expand-file-name "~/.emacs.d/custom/krysh.el" user-emacs-directory))
(when (file-exists-p init-file)
  (load init-file))
