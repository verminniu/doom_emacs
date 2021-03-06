;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;(load! "+bindings")

;; Place your private configuration here

;; set charset
;;(set-terminal-coding-system 'gb2312)
;;(set-keyboard-coding-system 'gb2312)
;;(set-language-environment "Chinese-GB")
;;(prefer-coding-system 'gb2312)

;;(which-function-mode t)

;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-peacock)

(setq doom-font (font-spec :family "Fira Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 19))

(setq c-default-style "doom")
(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

;; proj no need add .o/.a
(setq projectile-globally-ignored-file-suffixes '(".o" ".a"))
(setq projectile-enable-caching t)

;(add-hook 'after-init-hook 'global-company-mode)
;;(def-package! company
;;  :init
;;  (add-hook 'after-init-hook 'global-company-mode)
;;  )

(after! hl-line
  :init
  (set-face-background 'highlight nil)
  (set-face-attribute hl-line-face nil :underline t)
;  (set-face-background 'minibuffer-prompt "blue")
  )

;; add .inl and .h to c++ mode
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(def-package! iedit
  :defer t
  )

(def-package! srefactor
  :defer t
  )

(def-package! srefactor-lisp
  :defer t
  )

(after! cc-mode
  (semantic-mode 1)
  )

(def-package! window-numbering
  :init
  (window-numbering-mode 1)
  :config
  (setq window-numbering-assign-func
        (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
  )

(def-package! whole-line-or-region
  :init
  (add-hook 'after-init-hook 'whole-line-or-region-mode)
  )

(def-package! multiple-cursors
  :defer t
  )

(def-package! symbol-overlay
  :defer t
  )

(def-package! ztree
  :defer t
  )

