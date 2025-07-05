;;; init.el --- Init File -*- mode: emacs-lisp; lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:
;;; Init File

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'lib)
(require 'packages)
(require 'gc)
(require 'ui)
(require 'completion)
(require 'editing)
(require 'development)
(require 'languages)

;;; init.el ends here
