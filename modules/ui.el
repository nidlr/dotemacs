;;; ui.el --- UI Configuration -*- mode: emacs-lisp; lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; UI configuration including themes, fonts, appearance, and modeline

;;; Code:

(use-package emacs
  :init
  (defalias 'yes-or-no-p 'y-or-n-p)
  :custom
  (compilation-scroll-output t)
  (compilation-window-height 15)
  (cursor-type 'bar)
  (display-buffer-alist
   '(("\\*\\(compilation\\|eshell\\|xref\\|cider-repl\\)\\*"
      (display-buffer-reuse-mode-window
       display-buffer-below-selected)
      (window-height . 20))))
  (display-line-numbers-width 3)
  (modus-themes-bold-constructs nil)
  (modus-themes-italic-constructs nil)
  (split-height-threshold 80)
  (temp-buffer-max-height 15)
  (temp-buffer-resize-mode t)
  (window-divider-default-right-width 1)
  :config
  (blink-cursor-mode 0)
  (column-number-mode 1)
  (show-paren-mode 1)
  (window-divider-mode 1)
  (menu-bar-mode 0)
  (fringe-mode 0)
  (setq-default fill-column 100)

  (set-face-attribute 'default nil :font "PragmataPro Mono Liga" :weight 'normal :height 130)
  (require-theme 'modus-themes)
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-faint)
  (load-theme 'modus-operandi t)

  (custom-set-faces
   '(mode-line ((t (:box nil))))
   '(mode-line-active ((t (:box nil))))
   '(mode-line-inactive ((t (:box nil))))
   '(treemacs-root-face ((t (:bold t :underline nil))))
   '(lsp-face-semhl-definition ((t :inherit font-lock-function-name-face)))
   '(lsp-face-semhl-implementation ((t :inherit font-lock-function-name-face)))
   '(lsp-face-semhl-namespace ((t :inherit font-lock-type-face)))
   '(lsp-rust-analyzer-reference-modifier-face ((t :inherit lsp-rust-analyzer-reference-modifier-face :bold nil)))
   '(lsp-rust-analyzer-mutable-modifier-face ((t :inherit lsp-rust-analyzer-reference-modifier-face :underline t))))

  (enable-ligatures)

  :hook
  ((prog-mode . display-line-numbers-mode)
   ((text-mode prog-mode) . set-line-spacing)))

(use-package doom-modeline
  :demand t
  :custom
  (doom-modeline-bar-width 5)
  (doom-modeline-check-simple-format t)
  (doom-modeline-height 20)
  (doom-modeline-icon nil)
  :config
  (doom-modeline-mode 1))

(provide 'ui)
;;; ui.el ends here
