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

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(def-package! cquery
  :commands lsp-cquery-enable
  :init
  (add-hook 'c-mode-common-hook #'cquery//enable)
;  (add-hook 'c-mode-common-hook 'flycheck-mode)
  :config
  (setq cquery-sem-highlight-method 'font-lock)
  ;(setq lsp-highlight-symbol-at-point nil)
  (cquery-use-default-rainbow-sem-highlight)
)

;;;
