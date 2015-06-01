;;; Environment
(set-language-environment "UTF-8")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(add-to-list 'load-path "/home/abusque/.emacs.d/autopair/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Confirm before exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; indent with spaces
(setq-default indent-tabs-mode nil)

;; autopair
(require 'autopair)
(autopair-global-mode)

;; ag
(setq ag-highlight-search t)
(setq ag-reuse-window t)

;;; Display
(setq inhibit-splash-screen t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)

(setq truncate-partial-width-windows nil)

(display-time-mode t)

(show-paren-mode t)

(setq-default show-trailing-whitespace t)

;;; Shortcuts
;; general
(global-set-key (kbd "C-c o") 'bury-buffer)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c g") 'gdb)
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c i") 'erc)
(global-set-key (kbd "C-c a") 'ag)

;;; Programming

;; web-mode

(require 'web-mode)
(setq web-mode-engines-alist '(("underscorejs" . "\\.template.html\\'")))

;; C mode
(add-hook 'c-mode-common-hook '(lambda () (setq indent-tabs-mode t)))
(setq c-default-style "linux")
(setq c-basic-offset 8)

;;; Ido
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

;;; Latex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;; abbrev-mode
(setq-default abbrev-mode t)
(quietly-read-abbrev-file abbrev-file-name)
(setq save-abbrevs t)

;;; skeletons
(define-skeleton latexfr-skeleton
  "Inserts a Latex skeleton for utf8 encoded french documents"
  "Enter document class (default article):"
  "\\documentclass{" str | "article" "}\n\n"
  "\\usepackage{french}\n"
  "\\usepackage[utf8]{inputenc}\n"
  "\\usepackage[T1]{fontenc}\n\n"
  "\\begin{document}\n\n"
  "" _ "\n\n"
  "\\end{document}\n")

;;; Backup and temp files
;; Place backups/auto-saves in
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Disable file locks
(setq create-lockfiles nil)

;;; Others
(defalias 'yes-or-no-p 'y-or-n-p)

(auto-compression-mode 1)

(setq x-select-enable-clipboard t)

(defun eshell/clear()
  "Clears the shell buffer ala Unix's clear"
  (interactive)
  ; the shell prompts are read-only, so clear for that duration
  (let ((inhibit-read-only t))
        ; simply delete the region
        (delete-region (point-min) (point-max))))
