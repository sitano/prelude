;;; package --- Summary
;;; Commentary:
;;; - https://github.com/lunaryorn/stante-pede/blob/master/Cask
;;; - https://github.com/rejeep/emacs
;;; Code:

;; Basic libraries
(prelude-require-packages '(dash s f epl))

;; Basic libraries - Fix environment
(prelude-require-packages '(exec-path-from-shell))

;; Allow arrow keys
(setq guru-warn-only t)

;; Default encoding
(setq set-buffer-file-coding-system 'unix)

;; No toolbar and scrollbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Parens
(show-paren-mode 1)

;; Show when lines exceed fill column
(setq whitespace-style '(face tabs spaces trailing lines space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark))
(setq whitespace-line-column 120)

;; Show line numbers
(prelude-require-packages '(nlinum))
(global-nlinum-mode 1)

;; Windows numbers
(prelude-require-packages '(window-numbering))
(window-numbering-mode 1)

;; Duplicate things
(prelude-require-packages '(duplicate-thing))
(global-set-key (kbd "M-d") 'dublicate-thing)

;; Backup files
(setq make-backup-files nil)

;; Save place in closed files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(prelude-require-packages '(saveplace))

;; Move cursor to the last available pos on scrollint
(setq scroll-error-top-bottom t)

;; Handle .gz files
(auto-compression-mode t)

;; Provide templates for new files
(auto-insert-mode t)

;; Color theme
(prelude-require-packages '(solarized-theme zenburn-theme))
(load-theme 'solarized-dark t)

(setq inhibit-startup-screen t)

;; Make org mode look nicer
(defvar org-startup-indented)

;; Switching windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Terminator style window splitting
;; (global-set-key (kbd "C-S-o") 'split-window-below)
;; (global-set-key (kbd "C-S-e") 'split-window-right)

;; C-SPC is easier than M-/
;; (global-set-key (kbd "C-SPC") 'hippie-expand)

;; Enable Projectile
(projectile-global-mode)

;; Remove whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Set custom ujelly theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/ujelly-theme")
;; (load-theme 'ujelly t)

(provide 'personal)
;;; personal.el ends here
