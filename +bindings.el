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
    "C-s"              #'swiper
    "C-S-s"            #'swiper-all
    "M-%"              #'swiper-query-replace
    "C-c C-r"          #'ivy-resume
    "C-c v"            #'ivy-push-view
    "C-c V"            #'ivy-pop-view
    ;; Counsel
    "C-c n"            #'counsel-imenu
    "C-x C-r"          #'counsel-recentf
    "C-x j"            #'counsel-mark-ring
    "C-c L"            #'counsel-load-library
    "C-c P"            #'counsel-package
    "C-c f"            #'counsel-find-library
    "C-c g"            #'counsel-grep
    "C-c h"            #'counsel-command-history
    "C-c i"            #'counsel-git
    "C-c j"            #'counsel-git-grep
    "C-c l"            #'counsel-locate
    "C-c r"            #'counsel-rg
    "C-c z"            #'counsel-fzf
    "C-c c L"          #'counsel-load-library
    "C-c c P"          #'counsel-package
    "C-c c a"          #'counsel-apropos
    "C-c c e"          #'counsel-colors-emacs
    "C-c c f"          #'counsel-find-library
    "C-c c g"          #'counsel-grep
    "C-c c h"          #'counsel-command-history
    "C-c c i"          #'counsel-git
    "C-c c j"          #'counsel-git-grep
    "C-c c l"          #'counsel-locate
    "C-c c m"          #'counsel-minibuffer-history
    "C-c c o"          #'counsel-outline
    "C-c c p"          #'counsel-pt
    "C-c c r"          #'counsel-rg
    "C-c c s"          #'counsel-ag
    "C-c c t"          #'counsel-load-theme
    "C-c c u"          #'counsel-unicode-char
    "C-c c w"          #'counsel-colors-web
    "C-c c z"          #'counsel-fzf
)
