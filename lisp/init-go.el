;;; package --- Summary:
;;; Commentary:
;;; Code:


(use-package company-go
  :ensure t)


(use-package go-mode
  :ensure t
  :defer t
  :mode ("\\.go\\'" . go-mode)
  :config (progn
        ;; go-mode
            ;; format the current buffer

        ;;(add-hook 'before-save-hook 'gofmt-before-save)
        (add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))

        ;;(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
        ;;(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-i") 'go-goto-imports)))

        ;; Gocode autocomplete
        ;;(add-hook 'go-mode-hook 'company-mode)
        (add-hook 'go-mode-hook
	    '     (lambda()
                          ;; Prefer goreturns to gofmt if installed
              (let ((goreturns (executable-find "goreturns")))
                (when goreturns
                  (setq gofmt-command goreturns)))

              (subword-mode 1)
	          (set (make-local-variable 'company-backends)'(company-go))
	          (company-mode)))
         (add-hook 'go-mode-hook 'my-go-mode-hook)

	    ))

;;GOlint
;;(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))
;;(require 'golint)

(use-package golint)

(use-package go-complete        :ensure t)
(use-package go-direx
  :ensure t

  )
(use-package go-errcheck :ensure t)
(use-package go-gopath :ensure t)
(use-package go-impl :ensure t)
(use-package go-projectile :ensure t)
(use-package go-snippets :ensure t)

(use-package go-playground)
(use-package go-playground-cli)
(use-package go-projectile)
(use-package go-scratch)
(use-package go-stacktracer)
(use-package gorepl-mode
  :init (add-hook 'go-mode-hook #'gorepl-mode))



 ;;; go mode hook
(defun my-go-mode-hook()
  (exec-path-from-shell-copy-envs '("GOROOT" "GOPATH"))
  ;; call Gofmt before saving
  ;; use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Godef jump/back key binding.
  ;; jump back buffer :
  ;; |C-t       |'pop-tag-mark   |default
  ;; |----------+----------------|
  ;; |C-x <left>|'previous-buffer|default
  (local-set-key (kbd "<f12>") 'godef-jump-other-window)
  (local-set-key (kbd "M-/") 'pop-tag-mark)

  ;; removes all unused imports
  (local-set-key (kbd "C-c C-r")'go-remove-unused-imports)

  ;; show the go documentation for a given package
  ;; Note: godoc depends on the godoc utility.
  ;; It must be installed and on your $PATH.
  ;; To install it run: go get code.google.com/p/go.tools/cmd/godoc.
  (local-set-key (kbd "C-c C-k") 'godoc)

  ;; show the argument list of the function at your point in the minibuffer
  (go-eldoc-setup)
  )




(use-package go-dlv
  :ensure t
  :defer t
  :config
  ;; golang debuger
  ;;(require 'go-dlv)
  (local-set-key (kbd "<f5>")'gud-cont)
  (local-set-key (kbd "<f9>") 'gud-break)
  (local-set-key (kbd "<f10>") 'gud-next)
  (local-set-key (kbd "<f11>")'gud-step)
  )




;;(use-package go-eldoc
;;  :ensure t
;;  :defer t
;;  :config (progn
;;	    (add-hook 'go-mode-hook 'go-eldoc-setup)
;;	    ))





(use-package go-eldoc
  :ensure t
  :defer t
  :config
  ;; go-eldoc
  (set-face-attribute 'eldoc-highlight-function-argument nil
		      :underline t :foreground "green"
		      :weight 'bold)
  )


(provide 'init-go)
;;; init-go.el ends here
