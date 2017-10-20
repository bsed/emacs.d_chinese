;;; package --- Summary
;;; code:
;;; Commentary:


;; NeoTree
;;(use-package neotree
;;  :ensure t
;;  :defer t
;;  :commands (neotree-toggle)
;;  :init
 ;; (progn
   ;; ;; Jump to current file when opening neotree
   ;; (setq-default neo-smart-open t)
    ;; Neotree can't be open by itself
   ;; (setq-default neo-dont-be-alone t))
;;)

(use-package neotree
  :ensure evil
  :ensure t
  :defer t
  :commands (neotree-toggle neotree-show neotree-hide)
  :init
  (setq neo-theme 'icons
        neo-window-width 35
        neo-create-file-auto-open t
        neo-banner-message "Press ? for neotree help"
        neo-show-updir-line nil
        neo-mode-line-type 'neotree
        neo-smart-open t
        neo-dont-be-alone t
        neo-persist-show nil
        neo-show-hidden-files t
        neo-auto-indent-point t
        neo-modern-sidebar t
        neo-vc-integration nil)

  ;; :config
  ;; (add-hook 'neotree-mode-hook #'jake-modal-mode))
  :config
  (progn
    ;; (setq neo-theme 'icons)
    (setq neo-theme 'arrow)
     (setq neo-smart-open t
      neo-show-hidden-files t
      neo-banner-message nil
      neo-create-file-auto-open t
      neo-dont-be-alone t
      neo-vc-integration '(face char)
      neo-window-fixed-size nil)
    (set-face-foreground 'neo-dir-link-face "SlateGray2")
    (set-face-foreground 'neo-file-link-face "grey88")
    ;;(define-key evil-normal-state-map ",o" 'neotree-toggle)
    (add-hook 'neotree-mode-hook
              (lambda ()
                (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
                (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
                (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
                (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)))

    ;; If you use popwin, when NeoTree is open and successively a temporary
    ;; buffer is opened with popwin, a new window with the NeoTree buffer is
    ;; displayed side by side next to the first one (#50). This code will help
    ;; you
    ;; (when neo-persist-show
    ;;   (add-hook 'popwin:before-popup-hook
    ;;             (lambda () (setq neo-persist-show nil)))
    ;;   (add-hook 'popwin:after-popup-hook
    ;;             (lambda () (setq neo-persist-show t))))
    ))

(provide 'init-neotree)