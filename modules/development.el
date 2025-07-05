;;; development.el --- Development Tools Configuration -*- mode: emacs-lisp; lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Development tools and IDE features

;;; Code:

(use-package exec-path-from-shell
  :custom (exec-path-from-shell-arguments '("-i"))
  :config (exec-path-from-shell-initialize))

(use-package flycheck
  :defer t
  :hook ((prog-mode . flycheck-mode))
  :custom
  (flycheck-emacs-lisp-load-path 'inherit))

(use-package flycheck-clj-kondo)

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-semantic-tokens-enable t)
  :config
  (defun corfu-lsp-setup ()
    (setq-local completion-styles '(orderless)
                completion-category-defaults nil))
  :hook (lsp-mode . corfu-lsp-setup))

(use-package lsp-ui
  :custom (lsp-ui-doc-enable nil))

(use-package treemacs
  :defer t
  :custom
  (treemacs-filewatch-mode t)
  (treemacs-follow-mode t)
  (treemacs-no-png-images t)
  (treemacs-text-scale -0.3)
  (treemacs-user-mode-line-format 'none)
  (treemacs-expand-after-init t)
  :bind (:map treemacs-mode-map
              ([mouse-1] . treemacs-single-click-expand-action)))

(provide 'development)
;;; development.el ends here
