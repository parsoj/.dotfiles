;;; lsp.el --- support for language servers          -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Jeff Parsons

;; Author: Jeff Parsons <jeffp@MacBook-Pro-9.local>
;; Keywords: tools,

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  )

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :commands company-lsp)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)