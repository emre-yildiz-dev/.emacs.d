(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ))

;; Create a variable to indicate where emac's configuration is installed
(setq EMACS_DIR "~/.emacs.d/")

;; Keybindings for listing emacs packages
(global-set-key (kbd "C-c C-p") 'package-list-packages)

;; Disable toolbar, menu bar, scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Do not show the startup screen
(setq inhibit-startup-message t)

;; Disable ring-bell
(setq ring-bell-function 'ignore)

;; Install packages
(setq package-list
      '(company evil doom-themes projectile use-package lsp-metals pdf-tools vterm magit xclip crontab-mode))

;; Activate all the packages
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; In some OS systems Emacs does not load environment vars.
(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize)

;; Font size
;;(set-face-attribute 'default nil :height 150)
(add-to-list 'default-frame-alist '(font . "Dejavu Sans Mono-14"))

;; Xclip for copy-paste
(setq xclip-mode t)

;; company mode tweaks
(global-company-mode t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(setq company-idle-delay 0.0)

;; Line numbers
(global-linum-mode 1)

;; Evil mode ready
(evil-mode 1)

;; Load doom theme with "F6" to switching light
(load-theme 'doom-palenight t)

(use-package heaven-and-hell
  :ensure t
  :init
  (setq heaven-and-hell-theme-type 'dark)
  (setq heaven-and-hell-themes
	'((light . doom-acario-light)
	  (dark . doom-palenight)))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
	 ("<f6>" . heaven-and-hell-toogle-theme)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#292D3E" "#ff5370" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(custom-enabled-themes '(doom-palenight))
 '(custom-safe-themes
   '("a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" default))
 '(exwm-floating-border-color "#232635")
 '(fci-rule-color "#676E95")
 '(highlight-tail-colors ((("#383f45") . 0) (("#323e51") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f2b" "#c792ea"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f2b" "#c3e88d"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f2b" "#676E95"))
 '(objed-cursor-color "#ff5370")
 '(package-selected-packages
   '(xclip vterm use-package projectile pdf-tools magit lsp-metals heaven-and-hell exec-path-from-shell evil doom-themes crontab-mode company))
 '(pdf-view-midnight-colors (cons "#EEFFFF" "#292D3E"))
 '(rustic-ansi-faces
   ["#292D3E" "#ff5370" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(vc-annotate-background "#292D3E")
 '(vc-annotate-color-map
   (list
    (cons 20 "#c3e88d")
    (cons 40 "#d7de81")
    (cons 60 "#ebd476")
    (cons 80 "#ffcb6b")
    (cons 100 "#fcb66b")
    (cons 120 "#f9a16b")
    (cons 140 "#f78c6c")
    (cons 160 "#e78e96")
    (cons 180 "#d690c0")
    (cons 200 "#c792ea")
    (cons 220 "#d97dc1")
    (cons 240 "#ec6898")
    (cons 260 "#ff5370")
    (cons 280 "#d95979")
    (cons 300 "#b36082")
    (cons 320 "#8d678b")
    (cons 340 "#676E95")
    (cons 360 "#676E95")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
