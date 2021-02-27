;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; emacs-settings.el
;;
;; General Emacs settings to customize configuration
;;======================================================================

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme

;;----------------------------------------------------------------------

;; org-mode customization
(setq org-hide-emphasis-markers t)


;; Create (or don't create) backup files.
;; (setq-default make-backup-files t)
;; (setq-default make-backup-files nil)

;;----------------------------------------------------------------------

;; Turn on (or off) syntax highlighting.
;; (global-font-lock-mode t)
;; (global-font-lock-mode nil)

;;----------------------------------------------------------------------

;; Indent using spaces instead of tabs, except in makefile mode
;; (setq indent-tabs-mode nil)
;; (defun indentWithTabs () (setq indent-tabs-mode t))
;; (add-hook 'makefile-mode 'indentWithTabs)

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

;; Bind the "Control-x l" key sequence to the function "goto-line".
;; (global-set-key "\C-xl" 'goto-line)

;;----------------------------------------------------------------------

;; Bind the "Control-n" key sequence to toggle line numbering
;; (global-set-key "\C-n" 'linum-mode)

;;----------------------------------------------------------------------

(provide 'emacs-settings)
