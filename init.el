(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'load-path "~/.emacs.d/extensions/")
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)

(require 'tramp)
(setq tramp-default-method "scp")

(setq pycodechecker "epylint")
(when (load "flymake" t)
  (require 'flymake-cursor)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))

;; consider .h files to be a part of c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; highlight trailing whitespace
(require 'highlight-chars)
(add-hook 'c-mode-hook 'hc-highlight-trailing-whitespace)
(add-hook 'c++-mode-hook 'hc-highlight-trailing-whitespace)
(add-hook 'python-mode-hook 'hc-highlight-trailing-whitespace)
(add-hook 'java-mode-hook 'hc-highlight-trailing-whitespace)

;; highlight any characters past N
(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'java-mode-hook (lambda () (interactive) (column-marker-1 100)))

;; draw a vertical column marker line at N characters
(require 'fill-column-indicator)
(setq fci-rule-color "red")
(add-hook 'c-mode-hook (lambda () (interactive) (fill-column 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (fill-column 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (fill-column 80)))
(add-hook 'java-mode-hook (lambda () (interactive) (fill-column 100)))

(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'c++-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)
(add-hook 'java-mode-hook 'fci-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
