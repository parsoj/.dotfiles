;;; init.el --- description -*- lexical-binding: t; -*-
;;--------------------------------------------------------------------------------
;; straight.el Boostrap block
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t) 

(setq create-lockfiles nil)
(setq vc-follow-symlinks t)

(defmacro with-eval-after-packages (features &rest body)
  (if (null features)
    `(progn ,@body)
    `(eval-after-load (quote ,(car features))
       (quote (with-eval-after-packages ,(cdr features) ,@body)))))


(setq config-root "~/configuration/emacs/")
(setq modules-root (concat config-root "modules/") )

(defun get-modules-list ()
  (directory-files-recursively modules-root "\\.el$"))

(defun get-modules-directories ()
  (-filter (lambda (x) (not (string-match "\\.el$" x)))
          (directory-files-recursively modules-root ".*" t)
          )
  )

(defun load-all-config-files () 
  (interactive)
  (mapc (lambda (f) (load-file f)) (get-modules-list))
)

(load-all-config-files)
(server-start)