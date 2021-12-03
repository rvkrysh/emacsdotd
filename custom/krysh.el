;; define and initialise package repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defconst all-packages
  `(magit))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package all-packages)
    (unless (package-installed-p package)
      (package-install package))))
(install-packages)

;; use-package to simplify the config file
;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))
;;(require 'use-package)
;;(setq use-package-always-ensure 't)

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'appearance-settings)

;; matching paren
(show-paren-mode 1)

;; replace active region with typing
(delete-selection-mode 1)
(transient-mark-mode t)

;; respond to system clipboard
;;(setq x-select-enable-clipboard t)

(setq-default indicate-empty-lines t)

;; tabs 8 wide
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

;; auto revert buffer
(global-auto-revert-mode t)

;; back-up to folder
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.saves/"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; C/C++ indentation
(defun c-mode-indent-setup-hook ()
  (c-set-offset 'innamespace 0)
  (c-set-offset 'substatement-open 0)
  (setq c-basic-offset 8)
  (setq indent-tabs-mode nil))
(add-hook 'c-mode-hook 'c-mode-indent-setup-hook)
(add-hook 'c++-mode-hook 'c-mode-indent-setup-hook)

;; customised verilog variables
(defun verilog-mode-setup-hook ()
  (setq indent-tabs-mode nil)
  (setq verilog-auto-endcomments nil)
  (setq verilog-auto-indent-on-newline nil)
  (setq verilog-auto-newline nil)
  (setq verilog-indent-level 2)
  (setq verilog-indent-level-behavioral 2)
  (setq verilog-indent-level-declaration 0)
  (setq verilog-indent-level-module 2)
  (setq verilog-minimum-comment-distance 9000)
)
(add-hook 'verilog-mode-hook 'verilog-mode-setup-hook)
