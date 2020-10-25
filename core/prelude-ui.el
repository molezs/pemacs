;; prelude-ui.el My custom Emacs UI config

;; remove Toolbar
(tool-bar-mode -1)

(toggle-scroll-bar -1)

;; remove blinking cursor
(blink-cursor-mode -1)

;; disable bell
(setq ring-bell-function 'ignore)

;; disable splash screen
(setq inhibit-splash-screen t)

;; TODO if srolling is annoying change

;; Line numbers in Graphic mode and remove in term
(when (display-graphic-p)
  (global-display-line-numbers-mode t))
(unless (display-graphic-p)
  ;; adds a margin in the terminal
  (add-hook 'window-configuration-change-hook
            (lambda ()
              (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 0)))
  (menu-bar-mode -1))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Defualt Gruvboxtheme
(load-theme 'gruvbox-dark-hard t)

(provide 'prelude-ui)
;;; prelude-ui.el ends here