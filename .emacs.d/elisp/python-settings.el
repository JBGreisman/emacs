;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; python-settings.el
;;
;; Settings for using Emacs as a Python IDE
;;======================================================================

;; I opted for python.el, but python-mode.el is another popular option
(require 'python)

;;----------------------------------------------------------------------

;; Use IPython as the Python shell and alias run-python command
(setq python-shell-interpreter "ipython"
      python-shell-buffer-name "IPython Shell")
(defalias 'ipython 'run-python)
(defalias 'python 'run-python)

;;----------------------------------------------------------------------

;; Python autocompletion using jedi.el
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;----------------------------------------------------------------------

(provide 'python-settings)
