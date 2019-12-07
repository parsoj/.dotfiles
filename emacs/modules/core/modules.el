

(defun jump-to-scratch-file ()
  (interactive)
  (let ((module-path (completing-read
                      "Jump To Module: "
                      (get-scratch-list)
                      nil t)))
    (find-file module-path)
    )

  )

(defun jump-to-module ()
  (interactive)
  (let ((module-path (completing-read
                      "Jump To Module: "
                      (get-modules-list)
                      nil t)))
    (find-file module-path)
    )

  )

(defun jump-to-doom-module ()
  (interactive)
  (let ((module-path (completing-read
                      "Jump Doom To Module File: "
                      (get-doom-modules-list)
                      nil t)))
    (find-file module-path)
    )

  )

(defun jump-to-package ()
  (interactive)
  (let* ((package-repos-dir "~/.config/emacs/straight/repos/")
	 (file-path (completing-read
		     "Jump to Package: "
		     (directory-files-recursively package-repos-dir "\\.el$" t)
		     nil t)))
    (find-file file-path)
    )
  )

(defun create-new-module ()
  (interactive)
  (let ((module-dir (completing-read
		      "Pick Directory to create in: "
		      (get-modules-directories)
		      nil t)))

    (counsel-file-jump nil module-dir)
    ;; TODO load list of directories, and prompt for parent dir for new module
    ;; TODO ask for file/path name from that starting point
    ;; TODO create new file there and open it
    )
)

(defun create-new-scratch-file ()
  (interactive)
    (counsel-file-jump nil scratch-root)
)
