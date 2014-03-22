;;; prelude-packages-get.el --- Emacs Prelude: el-get package selection.
;;
;; Copyright © 2011-2013 Ivan
;;
;; Author: Ivan  <john.koepi@gmail.com>
;; URL: https://github.com/sitano/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Takes care of the automatic installation of all the packages required by
;; Emacs Prelude.

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

(setq el-get-default-process-sync t)

(setq el-get-is-lazy t)

(setq el-get-dir (concat (file-name-as-directory user-emacs-directory) "elpa/el-get"))

(setq el-get-user-package-directory (concat (file-name-as-directory prelude-vendor-dir) "el-get/init/"))

(let ((el-get-install-dir (concat (file-name-as-directory el-get-dir) "el-get")))
  (unless (member el-get-install-dir load-path)
    (add-to-list 'load-path el-get-install-dir)))

(defun prelude-require-el-get ()
  "Lazy el-get initialization."
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))

  (let ((el-get-user-recipe-path (concat (file-name-as-directory prelude-vendor-dir) "el-get/recipes/")))
    (unless (member el-get-user-recipe-path el-get-recipe-path)
      (add-to-list 'el-get-recipe-path el-get-user-recipe-path)))

  (setq el-get-verbose t)
  (el-get 'sync))

(prelude-require-el-get)

(defun prelude-el-get-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (el-get-package-installed-p package)
    (el-get-install package)))

(defun prelude-el-get-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'prelude-el-get-require-package packages))

(provide 'prelude-packages-get)
;;; prelude-packages-get.el ends here
