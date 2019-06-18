;;; emacs/projects/config.el -*- lexical-binding: t; -*-


(def-package! projectile
  :init
  (setq
   projectile-project-search-path '("~/remitly/" "~/projects/")
   projectile-project-root-files-functions '(projectile-root-top-down)
   projectile-project-root-files '(".projectile" "NOTES.org")
   counsel-projectile-switch-project-action (lambda (project_root) (find-file (concat project_root "PROJECT_NOTES.org")))
   )
  :config
  (set-popup-rule! "^\\*PROJECT_NOTES\\*" :slot 0 :side 'right :width .35 :select t)
  )

(def-package! org-projectile
  :init
  (setq
   org-projectile-per-project-filepath "PROJECT_NOTES.org"
   org-projectile-capture-template "* INBOX %?\n"
   )
  :config
  (org-projectile-per-project) ;; tell org-projectile that we are following the "file-per-project strategy"
  (setq org-capture-templates '(("i" "Inbox"  entry  (file+headline (lambda () (concat (projectile-project-root) "PROJECT_NOTES.org")) "Inbox") "* INBOX %?\n")))

  )
