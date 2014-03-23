;;; prelude-dlang.el --- dlang prelude module

;; Copyright (C) 2014  Ivan Prisyazhniy

;; Author: Ivan Prisyazhniy <john.koepi@gmail.com>

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
(prelude-el-get-require-packages '(cc-mode d-mode))

(eval-after-load 'd-mode
  '(progn
     (autoload 'd-mode "d-mode" "Major mode for editing D code." t)
     (add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))))

(provide 'prelude-dlang)
;;; prelude-dlang.el ends here
