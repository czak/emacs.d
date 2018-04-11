(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Settings

(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq require-final-newline t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Mode-specific settings

(setq ruby-insert-encoding-magic-comment nil)

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
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-c C-g") 'counsel-git)
  (global-set-key (kbd "C-c C-f") 'counsel-rg))

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

;; Store Custom setting separately
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
