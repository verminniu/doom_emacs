;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+bindings")

;; Place your private configuration here
(set-terminal-coding-system 'gb2312)



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
