;;; init.el --- Fun stuff all around -*- lexical-binding: t; -*-

;;; Commentary:
;; This is a simple init.el which offers a Python configuration.  Each package
;; usage is annotated with the how and why of its use.  `use-package' is used to
;; manage the configuration as it provides lots of facilities to load modes,
;; define custom variables and key-maps, etc.

;;; Code:

;; This is the package system for Emacs. We have to load it to install `use-package'.
(require 'package)


;; ELPA and MELPA are the package repositories from which we can install
;; packages from the Emacs community.
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("elpa" . "https://elpa.gnu.org/packages/")))

;; Make sure `use-package' is available and install it if it isn't already.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;========================================
;;; Useful defaults
;;;========================================

;; Open python files in tree-sitter mode.
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))


(use-package emacs
  :init
  ;; <OPTIONAL> Setting my favorite fonts here. You can replace "Roboto" with your favorite font.
  ;; You can also also adjust the size of the font with the "height" here under.
  (set-face-attribute 'default nil :family "Roboto Mono" :height 120 :weight 'regular)
  (set-face-attribute 'fixed-pitch nil :family "Roboto Mono" :height 120 :weight 'medium)
  (set-face-attribute 'variable-pitch nil :family "Roboto Regular" :height 120 :weight 'medium)
  :config
  (setq-default cursor-type 'bar)              ; Line-style cursor similar to other text editors
  (setq inhibit-startup-screen t)              ; Disable startup screen (the welcome to Emacs message)
  (setq initial-scratch-message "")	       ; Make *scratch* buffer blank
  (setq-default frame-title-format '("%b"))    ; Make window title the buffer name
  (setq confirm-kill-processes nil)            ; Stop confirming the killing of processes
  (setq use-short-answers t)	               ; y-or-n-p makes answering questions faster
  (show-paren-mode t)	                       ; Visually indicates pair of matching parentheses
  (delete-selection-mode t)                    ; Start writing straight after deletion
  (setq read-process-output-max (* 1024 1024)) ; Increase the amount of data which Emacs reads from the process
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (keymap-global-set "C-c l" 'goto-line)
  )

(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq treemacs-no-png-images t
	  treemacs-width 24)
  :bind ("C-c t" . treemacs))

;;; <OPTIONAL THEMING>

(use-package modus-themes
  :ensure t
  :config
    (setq modus-themes-org-blocks 'gray-background
	modus-themes-fringes 'subtle
	modus-themes-italic-constructs t
	modus-themes-bold-constructs t
	modus-themes-syntax '(alt-syntax)
	modus-themes-hl-line '(intense)
	modus-themes-paren-match '(intense)
	modus-themes-mode-line '(borderless))
    (setq modus-themes-headings
        (quote ((1 . (background overline variable-pitch 1.4))
                (2 . (overline rainbow variable-pitch 1.25))
                (3 . (overline 1.1))
                (t . (monochrome))))))


;; Maybe define some palette overrides, such as by using our presets
(setq modus-themes-common-palette-overrides
      modus-themes-preset-overrides-intense)

;; Load the theme of choice (built-in themes are always "safe" so they
;; do not need the `no-require' argument of `load-theme').
(load-theme 'modus-vivendi t)

;;;========================================
;;; Python
;;;========================================

;; `python.el' provides `python-mode' which is the builtin major-mode for the
;; Python language.

(use-package python
  :ensure t
  :config
  ;; Remove guess indent python message
  (setq python-indent-guess-indent-offset-verbose nil)
  ;; Use IPython when available or fall back to regular Python 
  (cond
   ((executable-find "ipython")
    (progn
      (setq python-shell-buffer-name "IPython")
      (setq python-shell-interpreter "ipython")
      (setq python-shell-interpreter-args "-i --simple-prompt")))
   ((executable-find "python3")
    (setq python-shell-interpreter "python3"))
   ((executable-find "python2")
    (setq python-shell-interpreter "python2"))
   (t
    (setq python-shell-interpreter "python"))))


;; Required to easily switch virtual envs 
;; via the menu bar or with `pyvenv-workon` 
;; Setting the `WORKON_HOME` environment variable points 
;; at where the envs are located. I use miniconda. 
(use-package pyvenv
  :ensure t
  :defer t
  :config
  ;; Setting work on to easily switch between environments
  (setenv "WORKON_HOME" (expand-file-name "~/miniconda3/envs/"))
  ;; Display virtual envs in the menu bar
  (setq pyvenv-menu t)
  ;; Restart the python process when switching environments
  (add-hook 'pyvenv-post-activate-hooks (lambda ()
					  (pyvenv-restart-python)))
  :hook (python-ts-mode . pyvenv-mode))


;; ;; Hide the modeline for inferior python processes.  This is not a necessary
;; ;; package but it's helpful to make better use of the screen real-estate at our
;; ;; disposal. See: https://github.com/hlissner/emacs-hide-mode-line.

;; (use-package hide-mode-line
;;   :ensure t
;;   :defer t
;;   :hook (inferior-python-mode . hide-mode-line-mode))


;; <OPTIONAL> Buffer formatting on save using black.
;; See: https://github.com/pythonic-emacs/blacken.
(use-package blacken
  :ensure t
  :defer t
  :custom
  (blacken-allow-py36 t)
  (blacken-skip-string-normalization t)
  :hook (python-ts-mode . blacken-mode))

;; <OPTIONAL> Numpy style docstring for Python.  See:
;; https://github.com/douglasdavis/numpydoc.el.  There are other packages
;; available for docstrings, see: https://github.com/naiquevin/sphinx-doc.el
(use-package numpydoc
  :ensure t
  :defer t
  :custom
  (numpydoc-insert-examples-block nil)
  (numpydoc-template-long nil)
  :bind (:map python-mode-map
              ("C-c C-n" . numpydoc-generate)))

;; Provide drop-down completion.
(use-package company
  :ensure t
  :defer t
  :custom
  ;; Search other buffers with the same modes for completion instead of
  ;; searching all other buffers.
  (company-dabbrev-other-buffers t)
  (company-dabbrev-code-other-buffers t)
  ;; M-<num> to select an option according to its number.
  (company-show-numbers t)
  ;; Only 2 letters required for completion to activate.
  (company-minimum-prefix-length 2)
  ;; Do not downcase completions by default.
  (company-dabbrev-downcase nil)
  ;; Even if I write something with the wrong case,
  ;; provide the correct casing.
  (company-dabbrev-ignore-case t)
  ;; company completion wait
  (company-idle-delay 0.2)
  ;; No company-mode in shell & eshell
  (company-global-modes '(not eshell-mode shell-mode))
  ;; Use company with text and programming modes.
    :hook ((text-mode . company-mode)
           (prog-mode . company-mode)))

;;; <EGLOT> configuration, pick this or the LSP configuration but not both.
;; Using Eglot with Pyright, a language server for Python.
;; See: https://github.com/joaotavora/eglot.
(use-package eglot
  :ensure t
  :defer t
  :hook (python-ts-mode . eglot-ensure))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages '(company numpydoc blacken hide-mode-line modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
