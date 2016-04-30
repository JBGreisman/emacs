;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; el-get-settings.el
;;
;; Settings for using el-get to install and manage Emacs Lisp files
;;======================================================================

;; Use el-get as elisp package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;----------------------------------------------------------------------

;; Install el-get if it doesn't exist
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;----------------------------------------------------------------------

;; Packages to install
(setq
 my-packages '(el-get
	       jedi
	       ))

;;----------------------------------------------------------------------

;; Use shallow git clones because we don't need the entire version
;; history for each project
(setq el-get-git-shallow-clone t)

;;----------------------------------------------------------------------

;; Install packages
(el-get 'sync my-packages)

;;----------------------------------------------------------------------

(provide 'el-get-settings)
