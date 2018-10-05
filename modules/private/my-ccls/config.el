;;; private/my-cquery/config.el -*- lexical-binding: t; -*-
;;;
;;; package --  add cquery


;; company
;;(def-package! company
;;  :init
;;  (global-company-mode 1)
;;  )

;; yasnippet for cquery function args
;;(def-package! yasnippet
;;  :init
;;  (yas-global-mode t)
;;  (yas-global-mode-enable-in-buffers)
;;)

;;(def-package! company-quickhelp)
;;
;;(def-package! company-lsp
;;  :defer t
;;  :init
;;  (setq company-quickhelp-delay 0)
;;  ;; Language servers have better idea filtering and sorting,
;;  ;; don't filter results on the client side.
;;  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
;;  (setq company-lsp-cache-candidates nil)
;;  (setq company-lsp-enable-snippet t)
;;  (setq company-lsp-enable-recompletion t)
;;
;;;  (add-hook 'c-mode-common-hook 'company-lsp)
;;  (add-to-list 'company-backends 'company-lsp)
;;  (add-hook 'c-mode-common-hook 'company-lsp)
;;  )



(setq ccls-executable "/Users/verminniu/test/ccls")
;; ;; Arch Linux aur/ccls-git aur/ccls
;; (setq ccls-executable "/usr/bin/ccls")

;; ;; Log file
;(setq ccls-extra-args '("--log-file=~/.ccls/log/cq.log"))

;; Cache directory, both relative and absolute paths are supported
(setq ccls-cache-dir "~/.ccls/cache")
;; Initialization
(setq ccls-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))

(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring)))


;; Also see lsp-project-whitelist lsp-project-blacklist ccls-root-matchers


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

(yas-global-mode)

(defun ccls//enable ()
  (condition-case nil
      (lsp-ccls-enable)
    (user-error nil)))

(def-package! ccls
  :commands lsp-ccls-enable
  :init
  (add-hook 'c-mode-common-hook 'company-lsp)
  (add-hook 'c-mode-common-hook #'ccls//enable)
  :config
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)

  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
  (setq company-lsp-enable-recompletion t)
  (set-company-backend! '(c-mode c++-mode objc-mode) 'company-lsp)
)

;;;
