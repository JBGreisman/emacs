;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; python-settings.el
;;
;; Settings for using Emacs as a Python IDE
;;======================================================================

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;----------------------------------------------------------------------

(provide 'python-settings)
