;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; .emacs
;;
;; Emacs initialization file -- Emacs executes this file whenever it is
;; launched.
;;======================================================================

;; Create (or don't create) backup files.
(setq-default make-backup-files t)
;; (setq-default make-backup-files nil)

;;----------------------------------------------------------------------

;; Tell Emacs where to find plug-in (.el) files.
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;----------------------------------------------------------------------

;; Use el-get as elisp package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Use shallow git clones because we don't need the entire version
;; history for each project
(setq el-get-git-shallow-clone t)

(el-get 'sync)


;;----------------------------------------------------------------------

;;------------;;
;; Python IDE ;;
;;------------;;
(require 'python)
(setq python-shell-interpreter "ipython"
      python-shell-buffer-name "IPython Shell")
(defalias 'ipython 'run-python)
(defalias 'python 'run-python)

;; Python autocompletion using jedi.el
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;----------------------------------------------------------------------

;; Turn on (or off) syntax highlighting.
(global-font-lock-mode t)
;; (global-font-lock-mode nil)

;;----------------------------------------------------------------------

;; Display (or don't display) the column number in the status bar.
(setq column-number-mode t)
;; (setq column-number-mode nil)

;-----------------------------------------------------------------------

;; Highlight (or don't highlight) matching parentheses, braces, and
;; brackets.
(show-paren-mode t)
;; (show-paren-mode nil)

;;----------------------------------------------------------------------

;; Bind the "Control-x l" (the letter "ell") key sequence to
;; the function "goto-line".
(global-set-key "\C-xl" 'goto-line)

;;----------------------------------------------------------------------

;; Indent using spaces instead of tabs, but not in makefile-mode.
(defun myIndentUsingSpaces () (setq indent-tabs-mode nil))
(add-hook 'text-mode-hook 'myIndentUsingSpaces)
(add-hook 'c-mode-hook 'myIndentUsingSpaces)
(add-hook 'asm-mode-hook 'myIndentUsingSpaces)
(add-hook 'java-mode-hook 'myIndentUsingSpaces)
(add-hook 'python-mode-hook 'myIndentUsingSpaces)
(add-hook 'emacs-lisp-mode-hook 'myIndentUsingSpaces)
(add-hook 'sh-mode-hook 'myIndentUsingSpaces)

;;----------------------------------------------------------------------

;; Bind the "Control-x n" key sequence to toggle line numbering.
(require 'linum)
(global-set-key "\C-n" 'linum-mode)

;;----------------------------------------------------------------------

;; Display characters in columns 72 and 73 using unusual background
;; colors, thus making it easy to spot lines that are longer than 72
;; characters.
(require 'column-marker)
(defun myMarkCol ()
   (interactive)
   (column-marker-1 73)
   (column-marker-2 72))
(add-hook 'c-mode-hook 'myMarkCol)
(add-hook 'asm-mode-hook 'myMarkCol)
(add-hook 'java-mode-hook 'myMarkCol)
(add-hook 'python-mode-hook 'myMarkCol)
(add-hook 'emacs-lisp-mode-hook 'myMarkCol)
(add-hook 'sh-mode-hook 'myMarkCol)

;;----------------------------------------------------------------------

;; Fireplace mode
(load "~/.emacs.d/elisp/fireplace")

;;----------------------------------------------------------------------

;; Bind the "Control-x p" key sequence to writing a line of "#'s"
(defun insert-divider1()
  (interactive)
  (insert (concat (make-string 72 ?#) "\n")))
(global-set-key "\C-xp" 'insert-divider1)

;; Bind the "Control p" key sequence to writing a line of "#'s"
(defun insert-divider2()
  (interactive)
  (insert (concat "#" (make-string 70 ?-) "#" "\n")))
(global-set-key "\C-p" 'insert-divider2)
