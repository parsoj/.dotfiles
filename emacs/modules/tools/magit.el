
(use-package magit)

(use-package evil-magit
  :after +evil
  )


(add-to-list 'display-buffer-alist
	     `("magit:"
	       (display-buffer-in-side-window)
	       (side . top)
	       (window-width . 0.5)
	       ))
