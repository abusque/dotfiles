;;;Environment
(set-language-environment "UTF-8")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(add-to-list 'load-path "/home/abusque/.emacs.d/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;indent with spaces
(setq-default indent-tabs-mode nil)

;;autopair
(require 'autopair)
(autopair-global-mode)

;;;Display
(setq inhibit-splash-screen t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)

(setq truncate-partial-width-windows nil)

(display-time-mode t)

(show-paren-mode t)

;;;Shortcuts
;;general
(global-set-key (kbd "C-c o") 'bury-buffer)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c g") 'gdb)
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c i") 'erc)

;;;Programming

;;Scala mode
(require 'scala-mode2)

;;C mode
(setq c-default-style "bsd")
(setq c-basic-offset 4)
;Load .h in C++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ;;Haskell mode
;; (load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'font-lock-mode)

;;CSharp mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;;Ido
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

;; ;;;ERC
;; (setq erc-server "chat.freenode.net" 
;;       erc-port 6667 
;;       erc-nick "abusque"
;;       erc-user-full-name user-full-name
;;       erc-email-userid "antoinebusque@gmail.com"
;;       erc-prompt-for-password nil)

;;;Latex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;;abbrev-mode
(setq-default abbrev-mode t)
(quietly-read-abbrev-file abbrev-file-name)
(setq save-abbrevs t)

;;;skeletons
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

;;;Others
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
