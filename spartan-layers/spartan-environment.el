;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;; Explicitly set an Emacs environment as desired.

;; if EDITOR is not set already, set it.
(or (getenv "EDITOR")
    (progn
      (setenv "EDITOR" "emacsclient")
      (setenv "VISUAL" (getenv "EDITOR"))))

;; if PAGER is not set already, set it
(or (getenv "PAGER")
    (setenv "PAGER" "cat"))

;; 'PATH' modifications

(setq spartan-path-insert '(
			    ;; "~/bin"
			    ;; "~/.local/bin"
			    ))

(setq spartan-path-append '(
			    ""
			    ))

;; SET matching exec-path and 'PATH' values with inserts/appends

(dolist (item spartan-path-insert)
  (add-to-list 'exec-path item))

(dolist (item spartan-path-append)
  (add-to-list 'exec-path item t))

(setenv "PATH" (string-trim-right (string-join exec-path ":") ":$"))

(provide 'spartan-environment)
