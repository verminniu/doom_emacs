;;; private/my-cquery/config.el -*- lexical-binding: t; -*-
;;;
;;; package --  add cquery

(setq cquery-executable "cquery")
;; ;; Arch Linux aur/cquery-git aur/cquery
;; (setq cquery-executable "/usr/bin/cquery")

;; ;; Log file
(setq cquery-extra-args '("--log-file=~/.cquery/log/cq.log"))

;; Cache directory, both relative and absolute paths are supported
(setq cquery-cache-dir "~/.cquery/cache")
;; Initialization
(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))

(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

;;(def-package! lsp-mode
;;  :commands lsp
;;  :init
;;  (setq lsp-auto-guess-root t)
;;  :config
;;  (require 'lsp-clients)
;;  ;(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
;;  (setq lsp-highlight-symbol-at-point nil)
;;  )
;;
;;(def-package! company-lsp
;;  :commands company-lsp
;;  :init
;;  (set-company-backend! '(c-mode c++-mode cuda-mode objc-mode)
;;    '(company-lsp company-yasnippet))
;;  :config
;;  (setq company-transformers '(company-sort-by-backend-importance))
;;  ;(setq company-transformers nil)
;;  (setq company-lsp-async t)
;;  ;(setq company-lsp-enable-snippet t)
;;  ;(setq company-lsp-enable-recompletion t)
;;  (setq company-lsp-cache-candidates nil)
;;  )
;;
;;(def-package! lsp-ui
;;  :init
;;  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;  (add-hook 'c-mode-common-hook 'flycheck-mode)
;;  (setq lsp-ui-sideline-enable nil)
;;  (setq lsp-ui-doc-enable nil)
;;  )

(def-package! cquery
  :commands lsp
  :init
  (add-hook 'c-mode-common-hook (lambda()(require 'cquery)(lsp)))
;  (add-hook 'c-mode-common-hook 'flycheck-mode)
  :config
  ;;(setq lsp-ui-sideline-enable nil)
  ;;(setq lsp-ui-doc-enable nil)
  (setq company-lsp-cache-candidates nil)
  (setq company-lsp-async t)
  (setq company-transformers '(company-sort-by-backend-importance))
  (setq cquery-sem-highlight-method 'font-lock)
  (cquery-use-default-rainbow-sem-highlight)
)

;;;
