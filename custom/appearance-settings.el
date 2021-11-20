(provide 'appearance-settings)

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom")
(load-theme 'mtx t)

;; start every frame maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(kill-ring-max 999999999999)
 '(kill-whole-line t)
 '(require-final-newline t)
 '(undo-limit 999999999999))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; kb mode
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

;; shift+arrow move aross windows
(windmove-default-keybindings)

;; visible bell
(setq ring-bell-function
      (lambda ()
        (let ((fg0 (face-foreground 'mode-line))
	      (bg0 (face-background 'mode-line)))
          (set-face-foreground 'mode-line "black")
	  (set-face-background 'mode-line "#ff5252")
          (run-with-idle-timer 0.15 nil
                               (lambda (fg bg) (set-face-foreground 'mode-line fg)
				               (set-face-background 'mode-line bg))
                               fg0 bg0))))

