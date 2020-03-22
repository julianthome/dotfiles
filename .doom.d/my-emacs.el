(setq user-full-name "Julian Thome"
      user-mail-address "julian.thome.de@gmail.com"
      calendar-latitude 49.815273
      calendar-longitude 6.129583
      calendar-location-name "Luxembourg")

(defun edit-config ()
  "Edit my configuration file"
  (find-file "~/.doom.d/my-emacs.org")
)

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

(require 'saveplace)
(setq auto-save-default nil)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

(column-number-mode nil)

(setq system-time-locale "en_US.utf8")
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(unicode-fonts-setup)

(global-prettify-symbols-mode t)

(setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)

(setq projectile-project-search-path '("~/git-repositories/"))

(setq org-directory "~/org/")

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(setq org-todo-keywords
  '((sequence "IDEA" "TODO" "WAIT" "|" "DONE" "CANCELED")))

(setq org-log-done 'time)

(setq org-archive-mark-done nil)

(defun mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(setq org-archive-location "~/org/archive.org::* From %s")

(require 'org)
(use-package org-journal
  :after org
  :preface
  :custom
  (org-journal-date-format "%e %b %Y (%A)")
  (org-journal-dir (format "~/org/journal/" (format-time-string "%Y")))
  (org-journal-file-format "%Y%m%d.gpg")
  (org-journal-time-format "%R ")
)

(add-hook 'org-journal-after-entry-create-hook
            (lambda ()
              (save-excursion
                (let ((template "# -*- mode:org; epa-file-encrypt-to: \"julian.thome.de@gmail.com\" -*-"))
                  (beginning-of-buffer)
                  (unless (search-forward template nil t)
                    (insert template "\n\n"))))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-ellipsis "⤵")

(defun find-file-by-ext (dir ext) 
  (directory-files-recursively dir (concat ext "$")))

(setq org-agenda-files (find-file-by-ext org-directory "-ag\\.org"))

(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(require 'epa-file)
(epa-file-enable)

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-day nil ;; i.e. today
      org-agenda-span 1
      org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("c" "Super view"
           ((agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Today"
                                  :time-grid t
                                  :date today
                                  :order 1)))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name "To refile"
                                   :file-path "refile\\.org")
                            (:name "Next to do"
                                   :todo "NEXT"
                                   :order 1)
                            (:name "Important"
                                   :priority "A"
                                   :order 6)
                            (:name "Today's tasks"
                                   :file-path "journal/")
                            (:name "Due Today"
                                   :deadline today
                                   :order 2)
                            (:name "Scheduled Soon"
                                   :scheduled future
                                   :order 8)
                            (:name "Overdue"
                                   :deadline past
                                   :order 7)
                            (:name "Meetings"
                                   :and (:todo "MEET" :scheduled future)
                                   :order 10)
                            (:discard (:not (:todo "TODO")))))))))))
  :config
  (org-super-agenda-mode))

(setq org-export-with-smart-quotes t)

(setq org-html-postamble nil)

(defvar org-export-output-directory-prefix "export_" "prefix of directory used for org-mode export")

(defadvice org-export-output-file-name (before org-add-export-dir activate)
  "Modifies org-export to place exported files in a different directory"
  (when (not pub-dir)
      (setq pub-dir (concat org-export-output-directory-prefix (substring extension 1)))
      (when (not (file-directory-p pub-dir))
       (make-directory pub-dir))))

(map! :leader
      (:prefix ("j" . "journal") ;; org-journal bindings
        :desc "Create new journal entry" "j" #'org-journal-new-entry
        :desc "Open previous entry" "p" #'org-journal-open-previous-entry
        :desc "Open next entry" "n" #'org-journal-open-next-entry
        :desc "Search journal" "s" #'org-journal-search-forever))

(map!
 (:map calendar-mode-map
   :n "o" #'org-journal-display-entry
   :n "p" #'org-journal-previous-entry
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))

(map!
 :map (calendar-mode-map)
 :localleader
 "w" #'org-journal-search-calendar-week
 "m" #'org-journal-search-calendar-month
 "y" #'org-journal-search-calendar-year)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
