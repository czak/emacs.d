(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Settings

(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

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
  :bind (("C-x g" . magit-status)))

(use-package try
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
	'((counsel-git . ivy--regex-fuzzy)
	  (t . ivy--regex-plus)))
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-c C-g") 'counsel-git)
  (global-set-key (kbd "C-c C-f") 'counsel-rg))

;; Store Custom setting separately
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
