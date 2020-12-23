;;; ../.config/emacs/doom-config/extras/org/refile.el -*- lexical-binding: t; -*-


(setq refile-folders '("active" "inbox" "on_hold" "reference"))

(defun org-get-refile-folders ()
  (-map (lambda (x) (expand-file-name (concat org-directory "/" x "/"))) refile-folders)
  )


(defun org-get-refile-files ()
  (apply '-concat  (-map
                    (lambda (folder)
                      (directory-files-recursively folder (rx ".org" eos))
                      )
                    (org-get-refile-folders)

                    )))



(defun org-get-refile-files ()
  (apply '-concat  (-map
                    (lambda (folder)
                      (directory-files-recursively folder (rx ".org" eos))
                      )
                    (org-get-refile-folders)

                    )))

(setq org-refile-targets `(
                           (,(org-get-refile-files) :maxlevel . 2)))
