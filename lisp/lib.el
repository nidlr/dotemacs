;;; lib.el --- Utility functions -*- mode: emacs-lisp; lexical-binding: t; no-byte-compile: t -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun set-line-spacing ()
  "Configure text display properties for better readability."
  (setq-local default-text-properties
              '(line-spacing 0.15 line-height 1.15)))

(defun select-line ()
  "Select current line.  If region is active, extend selection downward by line.
If `visual-line-mode' is on, consider line as visual line.
URL `http://xahlee.info/emacs/emacs/emacs_select_line.html'"
  (interactive)
  (if (region-active-p)
      (if visual-line-mode
          (let ((xp1 (point)))
            (end-of-visual-line 1)
            (when (eq xp1 (point))
              (end-of-visual-line 2)))
        (progn
          (forward-line 1)
          (end-of-line)))
    (if visual-line-mode
        (progn (beginning-of-visual-line)
               (push-mark (point) t t)
               (end-of-visual-line))
      (progn
        (push-mark (line-beginning-position) t t)
        (end-of-line)))))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun beginning-of-next-word ()
  "Move point to the beginning of the next word."
  (interactive)
  (forward-word)
  (forward-word)
  (backward-word))

(provide 'lib)
;;; lib.el ends here
