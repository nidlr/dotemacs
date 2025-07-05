;;; languages.el --- Language-Specific Configuration -*- mode: emacs-lisp; lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Language-specific modes and configurations

;;; Code:

(use-package cider
  :hook (((cider-repl-mode)                   . cider-mode)
         ((cider-mode cider-interaction-mode) . eldoc-mode))
  :custom
  (cider-font-lock-dynamically '(macro core function var deprecated))
  (cider-overlays-use-font-lock t)
  (cider-prompt-save-file-on-load 'always-save)
  (cider-repl-pop-to-buffer-on-connect 'display-only)
  (cider-repl-use-clojure-font-lock t)
  (cider-repl-use-pretty-printing t)
  (cider-use-overlays t)
  (nrepl-hide-special-buffers t)
  (nrepl-log-messages t)
  (nrepl-use-ssh-fallback-for-remote-hosts t))

(use-package cider-eval-sexp-fu
  :custom (cider-eval-sexp-fu-flash-duration 0.2))

(use-package clj-refactor
  :functions cljr-add-keybindings-with-prefix
  :hook (cider-mode . clj-refactor-mode)
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clojure-mode
  :mode (("\\\\.clj\\\\'"   . clojure-mode)
         ("\\\\.cljs\\\\'"  . clojure-mode)
         ("\\\\.boot\\\\'"  . clojure-mode)
         ("\\\\.edn\\\\'"   . clojure-mode))
  :hook (((clojure-mode clojurescript-mode clojurec-mode) . lsp))
  :bind (:map clojure-mode-map
              ("<s-return>"   . cider-eval-last-sexp)
              ("<S-s-return>" . cider-eval-defun-at-point)
              ("<C-s-return>" . cider-eval-buffer)
              ("<M-.>"        . cider-find-var)))

(use-package rust-mode
  :defer t
  :mode (("\\.rs\\'"  . rust-mode))
  :hook (((rust-mode) . lsp)))

(use-package slime
  :custom
  (inferior-lisp-program "sbcl")
  :config
  (load (expand-file-name "~/.quicklisp/slime-helper.el")))

(provide 'languages)
;;; languages.el ends here
