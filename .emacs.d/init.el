
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(require 'org)
(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("/home/julian/org/shiftleft-ag.org" "/home/julian/org/general-ag.org" "/home/julian/org/kmux-ag.org")))
 '(package-selected-packages
   (quote
    (ggtags use-package unicode-fonts solarized-theme rust-mode org-journal org-bullets neotree mu4e-maildirs-extension markdown-mode linum-relative key-chord hydra helm-projectile helm-mu helm-bibtex general flycheck fill-column-indicator exec-path-from-shell evil-surround evil-org evil-mu4e evil-magit evil-leader doom-themes auctex-latexmk airline-themes adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
