(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Settings

(setq ring-bell-function 'ignore
      inhibit-startup-screen t
      require-final-newline t
      dired-listing-switches "-al --group-directories-first"
      indent-tabs-mode nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(delete-selection-mode)

;; Focus newly split window

(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; Mouse scrolling

(setq mouse-wheel-scroll-amount '(2 ((shift) . 5) ((control))))
(setq mouse-wheel-progressive-speed nil)

(setq scroll-margin 0
      scroll-conservatively 101
      scroll-preserve-screen-position 1)

;; Packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package try
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (setq ivy-height 15)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-c p g") 'counsel-git)
  (global-set-key (kbd "C-c p f") 'counsel-rg))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(use-package windmove
  :ensure t
  :config
  (global-set-key (kbd "M-o M-h") 'windmove-left)
  (global-set-key (kbd "M-o M-j") 'windmove-down)
  (global-set-key (kbd "M-o M-k") 'windmove-up)
  (global-set-key (kbd "M-o M-l") 'windmove-right)
  (global-set-key (kbd "M-o M-o") 'other-window))

(use-package slim-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package ruby-mode
  :ensure t
  :init
  (setq ruby-insert-encoding-magic-comment nil))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package avy
  :ensure t
  :config
  (setq avy-background t)
  (global-set-key (kbd "C-;") 'avy-goto-word-1))

(use-package treemacs
  :ensure t)

;; Store Custom setting separately
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
