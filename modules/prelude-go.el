;;; prelude-go.el --- go lang prelude module

;; Copyright (C) 2014  Ivan Prisyazhniy

;; Author: Ivan Prisyazhniy <john.koepi@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'prelude-programming)

(prelude-el-get-require-packages '(go-mode go-flymake go-autocomplete go-eldoc go-def go-lint))

(require 'go-flycheck)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)
;                         (add-hook 'before-save-hook 'gofmt-before-save)
                          ))

(provide 'prelude-go)
;;; prelude-go.el ends here
