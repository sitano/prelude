;;; package --- Summary
;;; Commentary:
;;; Code:

; (prelude-el-get-require-packages '(auto-complete flymake flycheck))
; (setq flymake-log-level 3)
; el-get/init/init-auto-complete.el: (require 'auto-complete-config)
; el-get/init/init-auto-complete.el: (ac-config-default)

(prelude-el-get-require-packages '(smartparens yasnippet))

(require 'smartparens)
(require 'yasnippet)

;; YASnippet magic!
(yas-reload-all)

(defun personal-prog-mode-defaults ()
  "Personal default coding hook."
  ;; For God's sake indent when I press return.
  (electric-indent-mode +1)
  (yas-minor-mode)
  (auto-complete-mode)
  ;; Turn off spell checking while coding; It's annoying.
  ;; (flyspell-mode -1)
  (setq sp-autoescape-string-quote nil)
  ;; Add numbers to syntax highlighting
  (font-lock-add-keywords nil
                          '(("\\<\\([0-9]+\\(eE[+-]?[0-9]*\\)?\\|0[xX][0-9a-fA-F]+\\)\\>" . font-lock-constant-face))))

(add-hook 'prelude-prog-mode-hook 'personal-prog-mode-defaults t)

(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-/") 'yas-expand)

(provide 'personal-prog)
;;; personal-prog.el ends here
