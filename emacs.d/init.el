(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

(setq-default fill-column 80)
(if (>= emacs-major-version 23)
  (set-language-environment "UTF-8"))

;; Font and color
(global-font-lock-mode t)

;; Unique buffer naming
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'forward
  uniquify-separator ":")

;; Line number
(global-linum-mode 1)
(setq linum-format "%d ")

;; Remove toolbar
(tool-bar-mode -1)

;; Remove scrollbar
;(scroll-bar-mode -1)

;; Remove menubar
(menu-bar-mode -1)

;; TAB
(setq tab-width 4)
(setq-default indent-tabs-mode nil) ;; Use SPACE instead of TAB

;; Enable mouse wheel
;(mouse-wheel-mode t)

;; Show column-number in the mode line
(column-number-mode 1)

;; Startup default mode
(setq initial-major-mode 'text-mode)

;; Scroll one line at bottom of the window
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; Shorten yes/no choices to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Make trailing whitespace visible (delete with delete-trailing-whitespace)
(setq show-trailing-whitespace t)

;;; Backup files
;; Put backups (ie. <file> "~") to ~/.emacs.d/backup instead of $PWD
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;(setq auto-save-file-name-transforms '(("." . "~/.emacs.d/backup")))
