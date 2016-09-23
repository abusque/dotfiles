;;; Environment
(set-language-environment "UTF-8")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(add-to-list 'load-path "/home/abusque/.emacs.d/autopair/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Confirm before exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; indent with spaces
(setq-default indent-tabs-mode nil)

;; ag
(setq ag-highlight-search t)
(setq ag-reuse-window t)

;; autopair
(use-package autopair
  :ensure t
  :init (autopair-global-mode))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;;; Display
(setq inhibit-splash-screen t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)
(display-time-mode t)
(show-paren-mode t)

(setq truncate-partial-width-windows nil)
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
(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "C-c w") 'whitespace-mode)


;;; Programming

;; C mode
(add-hook 'c-mode-common-hook '(lambda () (setq indent-tabs-mode t)))
(setq c-default-style "linux")
(setq c-basic-offset 8)

;; Javascript mode
(setq js-indent-level 2)

;; PHP mode
(defun php-pillr-hook ()
  "PHP Pillr config"
  (setq indent-tabs-mode nil
        tab-width 2
        c-basic-offset 4
        flycheck-phpcs-standard "~/pillr/higgs/docs/CodingStyle.xml")
  (lambda ()
    (c-set-offset 'case-label '+)))
(add-hook 'php-mode-hook 'php-pillr-hook)

;; web-mode
(require 'web-mode)
(setq web-mode-engines-alist '(("underscorejs" . "\\.template.html\\'")))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(setq web-mode-enable-auto-pairing nil)

;; irfc-mode
(add-to-list 'auto-mode-alist '("rfc[0-9]+\\.txt" . irfc-mode))

;;; Ido
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)


;;; abbrev-mode
(setq-default abbrev-mode t)
(quietly-read-abbrev-file abbrev-file-name)
(setq save-abbrevs t)


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
(put 'upcase-region 'disabled nil)
