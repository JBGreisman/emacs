;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; .emacs
;;
;; Emacs initialization file -- Emacs executes this file whenever it is
;; launched.
;;======================================================================

;; Tell Emacs where to find Emacs Lisp files

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp")

;;----------------------------------------------------------------------

;; General Emacs settings
(require 'emacs-settings)

;;----------------------------------------------------------------------

;; Use el-get as package manager for Emacs Lisp plug-ins
(require 'el-get-settings)

;;----------------------------------------------------------------------

;; Python IDE
(require 'python-settings)

;;----------------------------------------------------------------------

;; Display characters in columns 72 and 73 using unusual background
;; colors to make it easy to spot lines longer than 72 characters
(require 'column-marker)
(defun myMarkCol ()
   (interactive)
   (column-marker-2 72))
(add-hook 'c-mode-hook 'myMarkCol)
(add-hook 'asm-mode-hook 'myMarkCol)
(add-hook 'java-mode-hook 'myMarkCol)
(add-hook 'python-mode-hook 'myMarkCol)
(add-hook 'emacs-lisp-mode-hook 'myMarkCol)
(add-hook 'sh-mode-hook 'myMarkCol)

;;----------------------------------------------------------------------

;; Fireplace mode -- just for kicks
(require 'fireplace)

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
