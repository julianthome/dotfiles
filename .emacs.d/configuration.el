(setq user-full-name "Julian Thome"
      user-mail-address "julian.thome.de@gmail.com"
      calendar-latitude 49.815273
      calendar-longitude 6.129583
      calendar-location-name "Luxembourg")

(defun edit-config ()
  "Edit my configuration file"
  (find-file "~/.emacs.d/configuration.org")
)

(add-to-list 'load-path "~/.emacs.d/lisp")

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (if (file-exists-p filePath)
      (with-temp-buffer
            (insert-file-contents filePath)
                  (split-string (buffer-string) "\n" t))
    ""
    )
)

(defun find-file-by-ext (dir ext) 
  (directory-files-recursively dir (concat ext "$")))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(add-hook 'after-init-hook 'global-company-mode)

(setq inhibit-default-init t)

(setq make-backup-files nil)

(global-hl-line-mode 1)

(setq line-move-visual nil)

(setq enable-local-variables :safe)

(setq gc-cons-threshold 20000000)

(setq vc-follow-symlinks t)

(setq sentence-end-double-space nil)

(transient-mark-mode t)

(delete-selection-mode 1)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq-default dired-listing-switches "-alh")

(fset 'yes-or-no-p 'y-or-n-p)

(global-font-lock-mode t)

(global-auto-revert-mode t)

(show-paren-mode 1)
(setq show-paren-delay 0.0)

(setq show-paren-style 'parenthesis)

(setq visible-bell t)

(setq ring-bell-function 'ignore)

(setq-default fill-column 80)

(setq ns-pop-up-frames nil)

(defun backup-to-temp-directory ()
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))))

(setq buffer-face-mode t)
(setq default-font "Source Code Pro")
(setq default-font-size 16)
(setq current-font-size default-font-size)
(setq font-change-increment 1.1)

(defun font-code ()
  "Return a string representing the current font"
  (concat default-font "-" (number-to-string current-font-size)))

(defun set-font-size ()
  "Set the font to `default-font' at `current-font-size'.
Set that for the current frame, and also make it the default for
other, future frames."
  (let ((font-code (font-code)))
    (add-to-list 'default-frame-alist (cons 'font font-code))
    (set-frame-font font-code)))

(defun reset-font-size ()
  "Change font size back to `default-font-size'."
  (interactive)
  (setq current-font-size default-font-size)
  (set-font-size))

(defun increase-font-size ()
  "Increase current font size by a factor of `font-change-increment'."
  (interactive)
  (setq current-font-size
        (ceiling (* current-font-size font-change-increment)))
  (set-font-size))

(defun decrease-font-size ()
  "Decrease current font size by a factor of `font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq current-font-size
        (max 1
             (floor (/ current-font-size font-change-increment))))
  (set-font-size))

(reset-font-size)

(require 'saveplace)
(setq auto-save-default nil)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e)) 
  (setq mouse-sel-mode t)
)

(column-number-mode nil)

(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(setq system-time-locale "en_US.utf8")
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it's not.
Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format  "Package %s is missing. Install it? " package))
	   (package-install package)
	 package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-content))

;; Activate installed packages.
(package-initialize)

(ensure-package-installed
      'helm 
      'evil 
      'evil-collection
      'evil-org
      'evil-surround
      'evil-leader
      'company
      'key-chord 
      'doom-themes 
      'cider
      'clojure-mode
      'fill-column-indicator
      'general 
      'ggtags
      'hydra 
      'auctex 
      'flycheck 
      'exec-path-from-shell 
      'neotree 
      'auctex-latexmk 
      'org-bullets 
      'org-journal
      'ox-reveal
      'powerline 
      'airline-themes 
      'solarized-theme 
      'helm-bibtex 
      'magit
      'evil-magit 
      'flyspell
      'projectile
      'helm-projectile
      'helm-mu
      'unicode-fonts
      'rust-mode
      'use-package
      'evil-mu4e
      'mu4e-maildirs-extension
      'smtpmail
      'adoc-mode
      'linum-relative
      'markdown-mode
)

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(require 'use-package)

(unicode-fonts-setup)

(global-prettify-symbols-mode t)

;; no menu and scroll bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-column 80)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-color "#a4adbc")
(setq fci-rule-character ?\u2502)

;; https://stackoverflow.com/questions/20682244/how-to-disable-bold-fonts-by-overriding-set-face-attribute-in-emacs
(defun remap-faces-default-attributes ()
   (let ((family (face-attribute 'default :family))
         (height (face-attribute 'default :height)))
     (mapcar (lambda (face)
              (face-remap-add-relative
               face :family family :weight 'normal :height height))
          (face-list))))

(when (display-graphic-p)
   (add-hook 'change-major-mode-after-body-hook 'remap-faces-default-attributes))

;; relative numbering
(require 'linum-relative)
(linum-mode)
(linum-relative-global-mode)

(setq evil-emacs-state-cursor '("chartreuse3" (bar . 2)))
(require 'powerline)
(require 'airline-themes)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t
      nlinum-highlight-current-line t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

(setq doom-line-numbers-style 'relative)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
(set-face-attribute 'org-level-1 nil :height 1.0)
(load-theme 'airline-doom-one t)

;; AucTeX
(setq-default TeX-master nil)
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
 
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(add-hook 'TeX-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)
(server-start)

(require 'neotree)
(custom-set-faces
(set-face-attribute 'neo-button-face      nil :height 140)
(set-face-attribute 'neo-file-link-face   nil :height 140)
(set-face-attribute 'neo-dir-link-face    nil :height 140)
(set-face-attribute 'neo-header-face      nil :height 140)
(set-face-attribute 'neo-expand-btn-face  nil :height 140)
)
(setq neo-theme 'arrow)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(evil-collection-init 'clojure)

(require 'key-chord)
(require 'evil)
(require 'hydra)
(require 'evil-surround)
(evil-mode 1)
(require 'general)
(general-evil-setup)
(key-chord-mode 1)

;; enable replacement in visual selection per default
(setq evil-ex-visual-char-range t)

(defvar comma-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map "," comma-leader-map)


(defun my-run-latex ()
  (interactive)
  (TeX-save-document (TeX-master-file))
  (TeX-command "latexmk" 'TeX-master-file -1))

;; change the "leader" key to space
;; (define-key evil-normal-state-map "," 'evil-repeat-find-char-reverse)
;; (define-key evil-normal-state-map (kbd "SPC") comma-leader-map)

(defun close-and-kill-this-pane ()
      "If there are multiple windows, then close this pane and kill the buffer in it also."
      (interactive)
      (kill-this-buffer)
      (if (not (one-window-p))
          (delete-window)))

(global-evil-surround-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-enable-caching t)

(setq projectile-require-project-root nil)

(require 'helm)
(require 'helm-bibtex)
(setq helm-for-files-preferred-list '(helm-source-buffers-list
                                      helm-source-buffer-not-found
                                      helm-source-recentf
                                      helm-source-bookmarks
                                      helm-source-file-cache
                                      helm-source-files-in-current-dir
                                      ))

;;(define-key evil-normal-state-map (kbd "C-p") 'helm-multi-files)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
(autoload 'helm-bibtex "helm-bibtex" "" t)
;;(setq bibtex-completion-bibliography (find-file-by-ext (projectile-project-root) "\\.bib"))
;;(setq helm-bibtex-bibliography (find-file-by-ext (projectile-project-root) "\\.bib"))

(package-install 'flycheck)
(global-flycheck-mode)
(exec-path-from-shell-initialize)

(require 'flyspell)
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(require 'magit)
(require 'evil-magit)

(setq org-startup-indented t)

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(add-hook 'org-mode-hook 'flyspell-mode)

(setq org-src-window-setup 'current-window)

(require 'ox-reveal)

(setq org-todo-keywords
  '((sequence "IDEA" "TODO" "WAIT" "|" "DONE" "CANCELED")))

(setq org-log-done 'time)

(setq org-archive-mark-done nil)

(defun mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(setq org-archive-location
      (concat "~/org/archive.org::* From %s"))

(require 'org-journal)
(setq org-journal-dir "~/org/journal")

(require 'org)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(global-evil-leader-mode)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(setq org-ellipsis "⤵")

(setq org-agenda-files (find-file-by-ext org-directory "-ag\\.org"))

(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-export-with-smart-quotes t)

(setq org-html-postamble nil)

(defvar org-export-output-directory-prefix "export_" "prefix of directory used for org-mode export")

(defadvice org-export-output-file-name (before org-add-export-dir activate)
  "Modifies org-export to place exported files in a different directory"
  (when (not pub-dir)
      (setq pub-dir (concat org-export-output-directory-prefix (substring extension 1)))
      (when (not (file-directory-p pub-dir))
       (make-directory pub-dir))))

(require 'rust-mode)

;;(require 'mu4e)
;;(require 'smtpmail)
;;(require 'evil-mu4e)
;;(require 'org-mu4e)
;;(require 'mu4e-contrib)
;;(mu4e-maildirs-extension)

;;(define-key mu4e-headers-mode-map (kbd "o") 'mu4e-update-mail-and-index)

;;(setq mu4e-change-filenames-when-moving t)

;;(setq mu4e-update-interval 300)

;;(setq mu4e-get-mail-command "mbsync inboxes"
;;  mu4e-update-interval 300
;;  mu4e-headers-auto-update t
;;)

;;(setq mu4e-confirm-quit nil)

;;(setq mail-user-agent 'mu4e-user-agent)

;;(add-hook 'message-mode-hook 'turn-on-orgtbl)
;;(add-hook 'message-mode-hook 'turn-on-orgstruct++)
;;(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)

;;(setq mu4e-view-show-addresses t)

;;(setq mu4e-attachment-dir "~/mail-downloads")

;;(define-key mu4e-view-mode-map (kbd "C-c C-o") 'mu4e~view-browse-url-from-binding)

;;(add-to-list 'mu4e-view-actions '("html in browser" . mu4e-action-view-in-browser) t)

;;(defun encrypt-responses ()
;;  (let ((msg mu4e-compose-parent-message))
;;    (when msg
;;      (when (member 'encrypted (mu4e-message-field msg :flags))
;;        (mml-secure-message-encrypt-pgpmime)))))
;;
;;(add-hook 'mu4e-compose-mode-hook 'encrypt-responses)

;;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;;(setq message-sendmail-extra-arguments '("--read-envelope-from"))
;;(setq message-sendmail-f-is-evil 't)
;;(setq sendmail-program "msmtp")

;;(setq mu4e-compose-context-policy 'ask-if-none
;;      mu4e-context-policy 'pick-first
;;      mu4e-maildir "~/Maildir"
;;      mu4e-contexts
;;      `(,(make-mu4e-context
;;            :name "yahoo"
;;            :enter-func (lambda () (mu4e-message "Switch to Yahoo"))
;;            :match-func (lambda (msg)
;;                          (when msg
;;                            (string-prefix-p "/yahoo" (mu4e-message-field msg :maildir))))
;;
;;          :vars '((user-mail-address . "frostisch@yahoo.de")
;;                  (mu4e-refile-folder . "/yahoo/Draft")
;;                  (mu4e-sent-folder . "/yahoo/Sent")
;;                  (mu4e-trash-folder . "/yahoo/Trash")
;;                  (mu4e-drafts-folder . "/yahoo/Drafts")))))

;;(add-hook 'message-send-hook
;;                (lambda ()
;;                  (unless (yes-or-no-p "Sure you want to send this? ")
;;(signal 'quit nil))))

;;(setq mu4e-sent-messages-behavior 'sent)
;;(require 'org-mu4e)

;;(setq org-mu4e-link-query-in-headers-mode nil)

;;(require 'bbdb-mu4e)



(setq message-kill-buffer-on-exit t)

(require 'helm-config)
(require 'helm-mu)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(autoload 'adoc-mode "adoc-mode" nil t)

(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(eval-after-load 'ox '(require 'ox-koma-letter))

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
                      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                                    (ggtags-mode 1))))

(key-chord-define evil-normal-state-map "jk" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)

(general-nmap "Q" (general-simulate-key "gqap"))
(general-vmap "Q" (general-simulate-key "gq"))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)

(key-chord-define evil-normal-state-map "ee" 'evil-emacs-state)
(key-chord-define evil-emacs-state-map "ee" 'evil-normal-state)

(define-key comma-leader-map "lr" 'my-run-latex)
(define-key comma-leader-map "lv" 'TeX-view)

(define-key comma-leader-map "bn" 'next-buffer)
(define-key comma-leader-map "bp" 'previous-buffer)

(define-key comma-leader-map "bd" 'close-and-kill-this-pane)
(define-key comma-leader-map "x" 'save-buffers-kill-emacs)

(define-key comma-leader-map "oje" 'org-journal-new-entry)

(define-key comma-leader-map "ols" 'org-store-link)
(define-key comma-leader-map "oli" 'org-insert-link)
(define-key comma-leader-map "olf" 'org-open-at-point)

(define-key comma-leader-map "a" 'mark-done-and-archive)

(define-key global-map (kbd "C-)") 'reset-font-size)
(define-key global-map (kbd "C-+") 'increase-font-size)
(define-key global-map (kbd "C-=") 'increase-font-size)
(define-key global-map (kbd "C-_") 'decrease-font-size)
(define-key global-map (kbd "C--") 'decrease-font-size)

(define-key comma-leader-map "f" 'neotree-toggle)
