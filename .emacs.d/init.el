;;;;;;;;;;;; Plugins ;;;;;;;;;;;;;;;;;;;

;; Use Package Manager called MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Enable Evil
;; evil-disable-insert-state-bindings makes sure that readline emacs bindings
;; are available like c-p, c-n, c-d. however it turns off c-o, which we want. this will be added later
(setq evil-disable-insert-state-bindings t)
;; this is necessary to allow c-r to work to redo
(setq evil-undo-system 'undo-redo)
(require 'evil)
(evil-mode 1)

;; this package is like vim-sneak, allows you to jump to a two-char combo before/after the cursor
(require 'evil-snipe) 
(setq evil-snipe-scope 'whole-visible) ;; only allow jumping to visible sections of buffer
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
;;;;;;;;;;;; End Plugins ;;;;;;;;;;;;;;;; 

;;;;;;;;;;;; Emacs Settings ;;;;;;;;;;;;;

;; make lines get truncated by default
(setq-default truncate-lines t)

;; when the cursor moves past the current view, don't make the view put the cursor in the middle
;; make it scroll one line, just enough to see the cursor again
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Scrolling-only-one-line.html
(setq scroll-conservatively most-positive-fixnum)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" default))
 '(package-selected-packages
   '(ox-gfm projectile counsel doom-themes org-bullets evil-snipe evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; make emacs open to ~/home/Notes/Writings by default
;; https://emacs.stackexchange.com/questions/73713/open-file-at-startup-from-init-file
(add-hook 'server-after-make-frame-hook (lambda () (find-file "~/RemoteGit/MyGithub/Notes")))

;; use gruvbox theme
(load-theme 'doom-gruvbox)

;; make font bigger
(set-face-attribute 'default nil :height 200)
(add-to-list 'default-frame-alist '(font . "Fira Code"))

;; make windows split by default vertically by reducing the minimum width required of a split 
(setq split-width-threshold 50) 

;; disable menu-bar and tool-bar
;; https://kb.mit.edu/confluence/display/istcontrib/Disabling+the+Emacs+menubar%2C+toolbar%2C+or+scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; make "RET" open the current buffer in the current window, instead of a new window
(define-key Buffer-menu-mode-map (kbd "<return>") 'Buffer-menu-this-window)

(setq backup-directory-alist `(("." . "~/.saves")))
;;;;;;;;;;;; End Emacs Settings ;;;;;;;;;

;;;;;;;;;;;; for text files ;;;;;;;;;;;;;

;; make lines wrap, without splitting words. text-mode-hook affects org-mode 
;; org-mode does not soft wrap by default so this setting is needed
;; https://www.inmotionhosting.com/support/edu/software/how-to-wrap-text-in-emacs/
;; https://emacs.stackexchange.com/questions/19629/word-wrap-line-option-by-default
;; https://superuser.com/questions/299886/linewrap-in-org-mode-of-emacs
(add-hook 'text-mode-hook 'visual-line-mode)

;; make emacs give the illusion that child bullet points are indented
;; with this, adaptive-wrap-prefix-mode is not needed
(add-hook 'org-mode-hook 'org-indent-mode)

;; make c-t and c-y shift the current line left and right, respectively in insert-mode
(define-key evil-insert-state-map (kbd "C-t") 'org-metaleft)
(define-key evil-insert-state-map (kbd "C-y") 'org-metaright)

;; spelling
(setq-default ispell-program-name "hunspell")
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Zc will close the current subtree i'm on and only show the parent
(defun org-fold-outer ()
  (interactive)
  (org-beginning-of-line)
  (if (string-match "^*+" (thing-at-point 'line t))
      (outline-up-heading 1))
  (outline-hide-subtree))
(define-key evil-normal-state-map (kbd "Zc") 'org-fold-outer)

;; make org mode bullets pretty
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; make the folds under headings pretty
(setq org-ellipsis " ▼ ")

;; make markdown export mode appear in org mode
(require 'ox-md nil t)

;; automatically load ox-gfm along with Org mode. this package allows me to export github-flavored markdown
(eval-after-load "org"
  '(require 'ox-gfm nil t))
;;;;;;;;;;;; end text files ;;;;;;;;;;;;;


;;;;;;;;;;;;;; vim stuff ;;;;;;;;;;;;;;;;;;;

;; make j and k move visual, not logical lines. this makes it easier to work
;; with lines that are soft-wrapped
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)

;; make C-e go to end-of-line
(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)

;; make c-u work
;; https://stackoverflow.com/questions/14302171/ctrlu-in-emacs-when-using-evil-key-bindings
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; make c-o work again
(define-key evil-insert-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;; make c-w work again
(define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)

;; make d/D/c/C/p/P/x/X delete in normal/visual mode without copying to clipboard
;; https://stackoverflow.com/questions/37787393/change-dd-command-in-evil-mode-to-not-write-to-clipboard
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; make escape behave like it does in vim
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;;;;;;;;;;;;; end vim stuff ;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; file navigation ;;;;;;;;;;;;;;

;; configure ivy: a package in emacs that helps fuzzy-complete your emacs commands (e.g. completion framework)
(use-package ivy
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t) ;; if you are scrolling through results and reach the bottom/top loop back to the top/bottom, respectively
  (setq ivy-count-format "(%d/%d) "))

;; add projectile: a package that can be used to navigate projects, using ivy
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)
(projectile-mode 1)
