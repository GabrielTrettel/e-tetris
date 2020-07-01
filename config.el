(require 'package)

(setq
 package-archives
 '(("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
   ("org"   . "http://orgmode.org/elpa/")
   ("ublt" . "https://elpa.ubolonton.org/packages/")))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contnts)
  (package-install 'use-package))
(require 'use-package)

;; Ctrl+c Ctrl+v Ctrl+x Ctrl+z like normal people
;; (cua-mode t)

(global-set-key (kbd "C-<tab>") 'other-window)

(use-package evil
  :ensure t
  :config
  (evil-mode 0))

  (cua-mode t)

;; (defvar my-leader-map (make-sparse-keymap)
;;   "Keymap for \"leader key\" shortcuts.")

;; ;; binding "," to the keymap
;; (define-key evil-normal-state-map "\\" my-leader-map)

;; ;; binding ",b"
;; (define-key my-leader-map "b" 'switch-to-buffer)
;; (define-key my-leader-map "k" 'kill-current-buffer)
;; (define-key my-leader-map "l" 'switch-to-next-buffer)
;; (define-key my-leader-map "h" 'switch-to-prev-buffer)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal))))
  '(centaur-active-bar-face ((t (:inherit doom-modeline-bar)))))


 ;; Removing initial text
 (setq inhibit-startup-message t)


 ;; Removing tool bar, scroll bar
 (tool-bar-mode -1)
 (scroll-bar-mode -1)
 ;; (menu-bar-mode -1)

 ;; Line hl
 (global-hl-line-mode t)
 (line-number-mode t)
(global-display-line-numbers-mode 0)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'latex-mode-hook 'linum-mode)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-mode 1)
  :config
  (set-face-foreground 'doom-modeline-evil-emacs-state "SkyBlue2")
  (set-face-foreground 'doom-modeline-evil-insert-state "chartreuse3")
  (set-face-foreground 'doom-modeline-evil-motion-state "plum3")
  (set-face-foreground 'doom-modeline-evil-normal-state "DarkGoldenrod2")
  (set-face-foreground 'doom-modeline-evil-operator-state "DarkGoldenrod2")
  (set-face-foreground 'doom-modeline-evil-visual-state "gray")
  (set-face-foreground 'doom-modeline-evil-replace-state "chocolate")

  (setq doom-modeline-buffer-file-name-style 'truncate-upto-root
        doom-modeline-indent-info t
  ;; Whether display icons in mode-line or not.
  ;; (setq doom-modeline-icon (display-graphic-p))
  ;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
        doom-modeline-major-mode-icon t
  ;; Whether display color icons for `major-mode'. It respects
  ;; `doom-modeline-icon' and `all-the-icons-color-icons'.
        doom-modeline-major-mode-color-icon t
  ;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
        doom-modeline-buffer-state-icon t
  ;; Whether display buffer modification icon. It respects `doom-modeline-icon'
  ;; and `doom-modeline-buffer-state-icon'.
        doom-modeline-buffer-modification-icon t
  ;; Whether display minor modes in mode-line or not.
        doom-modeline-minor-modes (featurep 'minions)
  ;; If non-nil, a word count will be added to the selection-info modeline segment.
        doom-modeline-enable-word-count nil
  ;; Whether display environment version or not
        doom-modeline-env-version t
  ;; Whether display the modal state icon.
  ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
  doom-modeline-modal-icon t))

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  :custom-face
  (centaur-active-bar-face ((t (:inherit doom-modeline-bar))))
  :config
  (setq centaxur-tabs-style "bar"
    centaur-tabs-height 32
    centaur-tabs-set-icons t
    centaur-tabs-set-modified-marker t
    centaur-tabs-show-navigation-buttons t
    centaur-tabs-set-bar 'under
    x-underline-at-descent-line t)
  )

(use-package tree-sitter
  :ensure t)

(use-package tree-sitter-langs
  :ensure t)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;(add-hook 'python-mode-hook #'tree-sitter-hl-mode)
;(add-hook 'c-mode-hook #'tree-sitter-hl-mode)

(use-package flycheck
   :ensure t
   :init
   (global-flycheck-mode t))

(use-package julia-mode
  :ensure t
  :init)

(use-package tex
  :ensure auctex)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-ac
  :ensure t
  :init)

(setq org-support-shift-select t)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
(add-to-list 'ac-modes 'org-mode)

(add-to-list 'org-structure-template-alist
	'("L" "#+TODO: TODO IN-PROGRESS WAITING DONE\n#+OPTIONS: tex:t\n#+STARTUP: latexpreview\n\n? "))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Documents/projects/"))
  :bind
  (:map global-map
    ("C-c p" . projectile-command-map)))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         22)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;;(use-package treemacs-evil
;;  :after treemacs evil
;;  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode t))

(use-package yasnippet
     :ensure t
     :config
     (yas-reload-all)
     (add-hook 'prog-mode-hook #'yas-minor-mode)
     (add-hook 'org-mode-hook #'yas-minor-mode))
   
     (use-package yasnippet-snippets
     :ensure t)
   
;;   (use-package doom-snippets
;;     :load-path "/home/trettel/.emacs.d/cloned-pkgs/doom-snippets"
;;     :after yasnippet)
   
;;   (doom-snippets-initialize)

(use-package auto-complete
  :ensure t
  :init
  :config
  (ac-config-default))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 10)
                          (agenda   . 5))
     show-week-agenda-p t
     dashboard-set-file-icons t
     dashboard-set-heading-icons t
     dashboard-banner-logo-title "I WANT TO BE EVIL"
     dashboard-center-content t))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-display-style 'fancy)
  :init
  (ivy-mode 1))

(use-package ivy-posframe
  :ensure t
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
  (setq ivy-posframe-parameters '((internal-border-width . 10)))
  (setq ivy-posframe-width 60)
  (setq ivy-posframe-height 100)
  :init
  (ivy-posframe-mode 1))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))
