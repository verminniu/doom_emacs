;;; vermin's -- .doom.d/+bindings.el

;; Change the default key of persp-mode to avoid conflicts with projectile.
(setq persp-keymap-prefix (kbd "C-c e")
      projectile-keymap-prefix (kbd "C-c p"))

(map!
 (:after evil
   :gnvime "C-n"              #'next-line
   :gnvime "C-p"              #'previous-line
   :gnvime "C-b"              #'backward-char
   :gnvime "C-f"              #'forward-char
   :gnvime "C-e"              #'move-end-of-line
   :gnvime "C-a"              #'move-beginning-of-line
   :gnvime "C-d"              #'delete-forward-char
   :gnvime "M-b"              #'backward-word
   :gnvime "M-f"              #'forward-word
   :gnvime "M-i"              #'symbol-overlay-put
   :gnvime "M-n"              #'symbol-overlay-jump-next
   :gnvime "M-p"              #'symbol-overlay-jump-prev
   :gnvime "C-v"              #'scroll-up-command
   :gnvime "M-v"              #'scroll-down-command
   :gnvime "M-."              #'xref-find-definitions
   :gnvime "M-,"              #'xref-pop-marker-stack
   :gnvime "C-x C-s"          #'save-buffer
   :gnvime "C-w"              #'whole-line-or-region-kill-region
   :gnvime "M-w"              #'whole-line-or-region-kill-ring-save
   :gnvime "C-y"              #'whole-line-or-region-yank

   :i      "C-k"              #'kill-line
   :i      "M-k"              #'kill-sentence
   :i      "M-d"              #'kill-word
   )

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

  ;; Smartparens
 (:after smartparens
   (:map smartparens-mode-map
     "C-M-a"     #'sp-beginning-of-sexp
     "C-M-e"     #'sp-end-of-sexp
     "C-M-f"     #'sp-forward-sexp
     "C-M-b"     #'sp-backward-sexp
     "C-M-d"     #'sp-splice-sexp
     "C-M-k"     #'sp-kill-sexp
     "C-M-t"     #'sp-transpose-sexp
     "C-<right>" #'sp-forward-slurp-sexp
     "M-<right>" #'sp-forward-barf-sexp
     "C-<left>"  #'sp-backward-slurp-sexp
     "M-<left>"  #'sp-backward-barf-sexp))

  ;; Multiple Cursors
 (:when (featurep! :editor multiple-cursors)
   (:prefix "C-c m"
     "l"         #'mc/edit-lines
     "n"         #'mc/mark-next-like-this
     "N"         #'mc/unmark-next-like-this
     "p"         #'mc/mark-previous-like-this
     "P"         #'mc/unmark-previous-like-this
     "t"         #'mc/mark-all-like-this
     "m"         #'mc/mark-all-like-this-dwim
     "e"         #'mc/edit-ends-of-lines
     "a"         #'mc/edit-beginnings-of-lines
     "s"         #'mc/mark-sgml-tag-pair
     "d"         #'mc/mark-all-like-this-in-defun))

    (:after ivy
    "C-s"              #'swiper
    "C-S-s"            #'swiper-all
    "M-%"              #'swiper-query-replace
    ;; Counsel
    "C-c n"            #'counsel-imenu
    "C-x C-r"          #'counsel-recentf
    )
    (:after helm
     "C-s"            #'swiper-helm
      "C-S-s"          #'swiper-all
      "C-c g"          #'helm-do-grep-ag
      "C-x C-r"        #'helm-recentf
      "C-c n"          #'helm-semantic-or-imenu
      )
  (:after company
   (:map company-active-map
     "C-o"      #'company-search-kill-others
     "C-n"      #'company-select-next
     "C-p"      #'company-select-previous
     "C-h"      #'company-show-doc-buffer
     "C-s"      #'company-search-candidates
     "M-s"      #'company-filter-candidates
     "C-;"      #'company-complete-common-or-cycle
     "TAB"      #'company-complete-common-or-cycle
     [backtab]  #'company-select-previous
     "C-RET"    #'counsel-company)
   (:map company-search-map
     "C-n"        #'company-search-repeat-forward
     "C-p"        #'company-search-repeat-backward
     "C-s"        (¦Ë! (company-search-abort) (company-filter-candidates))))
)

(which-key-add-key-based-replacements "C-c !"   "checking")
(which-key-add-key-based-replacements "C-c d p" "doom popups")
(which-key-add-key-based-replacements "C-c d"   "doom")
(which-key-add-key-based-replacements "C-c e"   "perspective")
(which-key-add-key-based-replacements "C-c m"   "mail")
(which-key-add-key-based-replacements "C-c o a" "org agenda")
(which-key-add-key-based-replacements "C-c o e" "org export")
(which-key-add-key-based-replacements "C-c o"   "org")
(which-key-add-key-based-replacements "C-c p"   "projectile")
(which-key-add-key-based-replacements "C-c s"   "snippets")
(which-key-add-key-based-replacements "C-c v"   "versioning")
(which-key-add-key-based-replacements "C-c w"   "workspace")
