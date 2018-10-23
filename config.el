;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+bindings")

;; Place your private configuration here
(set-terminal-coding-system 'gb2312)
(set-keyboard-coding-system 'gb2312)
(set-language-environment "Chinese-GB")
(prefer-coding-system 'gb2312)

;;(which-function-mode t)

;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)

(setq doom-font (font-spec :family "Fira Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 19))

(setq c-default-style "bsd")
(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

;; proj no need add .o/.a
(setq projectile-globally-ignored-file-suffixes '(".o" ".a"))
(setq projectile-enable-caching t)

(after! hl-line
  :init
  (set-face-background 'highlight nil)
  (set-face-attribute hl-line-face nil :underline t)
;  (set-face-background 'minibuffer-prompt "blue")
  )

;; add .inl and .h to c++ mode
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; company
(def-package! company
  :init
  (global-company-mode 1)
  :config
  (setq completion-ignore-case t)
  )

(def-package! company-quickhelp
  :after company
  :init
  :config
  (company-quickhelp-mode)
  )

(use-package lsp-mode
  :defer 1
  :config
  (setq lsp-highlight-symbol-at-point nil)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  )

(def-package! company-lsp
  :after (company lsp-mode)
  :init
  (setq company-lsp-cache-candidates nil)
  (add-hook 'lsp-mode-hook
            (lambda()
              (add-to-list (make-local-variable 'company-backends)
                           'company-lsp)))
  )

;;(def-package! helm-swoop
;;  :defer t
;;  :init
;;  (setq helm-swoop-use-fuzzy-match t)
;;  (setq helm-swoop-speed-or-color nil)
;;  )

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

;;(def-package! ivy-xref
;;  :init
;;  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs)
;;  )

(def-package! lsp-ui
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  ;;(setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil)
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

(def-package! symbol-overlay)

