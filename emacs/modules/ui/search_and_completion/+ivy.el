;;; +ivy.el --- description -*- lexical-binding: t; -*-

(use-package ivy 
  :defer 0.1 
  :init (setq ivy-use-virtual-buffers t) 
  (setq ivy-initial-inputs-alist nil) 
  (setq completion-ignored-extensions '("~" ".swp" "#")) 
  :config (ivy-mode 1))

(use-package ivy-posframe 
  :after ivy 
  :config (setq ivy-fixed-height-minibuffer nil
		ivy-posframe-border-width 2
		ivy-posframe-parameters`((title . "ivy-posframe")
					 (min-width . 90) 
					 (min-height . ,ivy-height))) 

					;(set-face-attribute 'ivy-posframe-border :background 'black)

  ;; default to posframe display function
  (setf (alist-get t ivy-posframe-display-functions-alist) #'ivy-posframe-display-at-frame-center)

  ;; posframe doesn't work well with async sources
  (dolist (fn '(swiper counsel-ag counsel-grep counsel-git-grep)) 
    (setf (alist-get fn ivy-posframe-display-functions-alist) #'ivy-display-function-fallback)) 
  (ivy-posframe-mode 1))

(use-package ivy-rich 
  :after ivy 
  :custom (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config (defun ivy-rich-switch-buffer-icon (candidate) 
	    (with-current-buffer (get-buffer candidate) 
	      (let ((icon (all-the-icons-icon-for-mode major-mode))) 
		(if (symbolp icon) 
		    (all-the-icons-icon-for-mode 'fundamental-mode) icon))))
  (setq ivy-rich--display-transformers-list '(

	  counsel-switch-buffer 
	  (:columns ((ivy-rich-switch-buffer-icon :width 2) 
		     (ivy-rich-candidate 
		      (:width 30)) 
		     (ivy-rich-switch-buffer-size 
		      (:width 7)) 
		     (ivy-rich-switch-buffer-indicators 
		      (:width 4 
			      :face error 
			      :align right)) 
		     (ivy-rich-switch-buffer-major-mode 
		      (:width 12 
			      :face warning)) 
		     (ivy-rich-switch-buffer-project 
		      (:width 15 
			      :face success)) 
		     (ivy-rich-switch-buffer-path 
		      (:width (lambda (x) 
				(ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width
									0.3)))))) 
		    :predicate (lambda (cand) 
				 (get-buffer cand)))

	  counsel-M-x 
	  (:columns ((counsel-M-x-transformer 
		      (:width 40))	; thr original transformer
		     (ivy-rich-counsel-function-docstring 
		      (:face font-lock-doc-face)))) ; return the docstring of the command

	  counsel-describe-function 
	  (:columns ((counsel-describe-function-transformer 
		      (:width 40))	; the original transformer
		     (ivy-rich-counsel-function-docstring 
		      (:face font-lock-doc-face)))) ; return the docstring of the function

	  counsel-describe-variable 
	  (:columns ((counsel-describe-variable-transformer 
		      (:width 40))	; the original transformer
		     (ivy-rich-counsel-variable-docstring 
		      (:face font-lock-doc-face)))) ; return the docstring of the variable

	  counsel-recentf 
	  (:columns ((ivy-rich-candidate 
		      (:width 0.8))	; return the candidate itself
		     (ivy-rich-file-last-modified-time 
		      (:face font-lock-comment-face))))) ; return the last modified time of the file
	) 
  (ivy-rich-mode 1)


  )



(provide '+ivy)
;;; +ivy.el ends here