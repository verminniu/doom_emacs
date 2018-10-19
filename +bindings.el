;;; vermin's -- .doom.d/+bindings.el

;; Change the default key of persp-mode to avoid conflicts with projectile.
(setq persp-keymap-prefix (kbd "C-c e")
      projectile-keymap-prefix (kbd "C-c p"))

(map!
 (:after cc-mode
   (:map c++-mode-map
     "M-RET"           #'srefactor-refactor-at-point
;     "M-RET o"         #'srefactor-lisp-one-line
;     "M-RET m"         #'srefactor-lisp-format-sexp
;     "M-RET d"         #'srefactor-lisp-format-defun
;     "M-RET b"         #'srefactor-lisp-format-buffer
    [tab]              #'c-indent-line-or-region)
   (:map c-mode-map
     "M-RET"           #'srefactor-refactor-at-point
;     "M-RET o"         #'srefactor-lisp-one-line
;     "M-RET m"         #'srefactor-lisp-format-sexp
;     "M-RET d"         #'srefactor-lisp-format-defun
;     "M-RET b"         #'srefactor-lisp-format-buffer
    [tab]              #'c-indent-line-or-region))

    "M-i"              #'symbol-overlay-put
    "M-n"              #'symbol-overlay-jump-next
    "M-p"              #'symbol-overlay-jump-prev
    "M-v"              #'scroll-down-command

    (:after ivy
    "C-s"              #'swiper
    "C-S-s"            #'swiper-all
    "M-%"              #'swiper-query-replace
    ;; Counsel
    "C-c n"            #'counsel-imenu
    "C-x C-r"          #'counsel-recentf
    )
    (:after helm
      "C-s"            #'helm-swoop
      "C-S-s"          #'helm-multi-swoop-all
      "C-c g"          #'helm-do-grep-ag
      "C-x C-r"        #'helm-recentf
      "C-c n"          #'helm-semantic-or-imenu
      )
)
