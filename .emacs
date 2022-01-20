;;======================================================================
;; Jack Greisman <Jack.Greisman@gmail.com>
;; .emacs
;;
;; Emacs initialization file -- Emacs executes this file whenever it is
;; launched.
;;======================================================================

;; =====================================================================
;; MELPA Package Support
;; =====================================================================
;; Enables basic packaging support

(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Python environment
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; Black formatting on save
    material-theme                  ;; Theme
    )
  )

;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; =====================================================================
;; Additional customizations
;; =====================================================================

;; Tell Emacs where to find Emacs Lisp files
(add-to-list 'load-path "~/.emacs.d/elisp")

;;----------------------------------------------------------------------

;; General Emacs settings
(require 'emacs-settings)

;;----------------------------------------------------------------------

;; Python IDE
(require 'python-settings)

;;----------------------------------------------------------------------

;; Fireplace mode -- just for kicks
(require 'fireplace)

;; =====================================================================
;; Automated additions to settings
;; =====================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme blacken flycheck elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
