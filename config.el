;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+bindings")

;; Place your private configuration here
(set-terminal-coding-system 'gb2312)
(set-keyboard-coding-system 'gb2312)
(set-language-environment "Chinese-GB")
(prefer-coding-system 'gb2312)

(which-function-mode t)

(setq doom-theme 'doom-molokai)

(setq doom-font (font-spec :family "Fira Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 19))

(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

;; proj no need add .o/.a
(setq projectile-globally-ignored-file-suffixes '(".o" ".a"))
(setq projectile-enable-caching t)

;; add .inl and .h to c++ mode
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(def-package! smartparens
  :config
  (setq sp-autoinsert-pair nil
        sp-autodelete-pair nil
        sp-escape-quotes-after-insert nil)
  (setq-default sp-autoskip-closing-pair nil)
  )


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

(def-package! ivy-xref
  :init
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs)
  )

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

(def-package! symbol-overlay)

(def-package! electric
  :init
  (electric-indent-mode t)
  (electric-pair-mode t)
  (electric-layout-mode t)
)
