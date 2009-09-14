(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/ecb-2.32")

(setq default-frame-alist
      '((height . 40) (width . 100) (tool-bar-lines . 0)))

(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue2)

;; From Wangyin's Page
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill-column 70)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq enable-recursive-minibuffers t)
(setq scroll-step 1
     scroll-margin 3
     scroll-conservatively 10000)
(setq default-major-mode 'text-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs @ %b")
(auto-image-file-mode)
(global-font-lock-mode t)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)
   ("\\.pro$" . prolog-mode)
   ("\\.m$" . mercury-mode)
   ("\\.cs$" . csharp-mode)
   ("\\.w$" . cweb-mode)
   ("\\.m$" . objc-mode)))
(setq user-full-name "Feng Liu")
(setq user-mail-address "liufeng@cnliufeng.com")
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; From Wangyin's elisp.html
;; session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; desktop.el
(load "desktop")
(desktop-load-default)
(desktop-read)

;; ibuffer.el
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; browse-kill-ring.el
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; ido.el
(require 'ido)
(ido-mode t)

;; table.el
(autoload 'table-insert "table" "WYGIWYS table editor")

;; temp sign
(global-set-key [(control ?\~)] 'ska-point-to-register)
(global-set-key [(control ?\`)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored position."
 (interactive)
 (setq zmacs-region-stays t)
 (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position that was
stored with ska-point-to-register."
 (interactive)
 (setq zmacs-region-stays t)
 (let ((tmp (point-marker)))
       (jump-to-register 8)
       (set-register 8 tmp)))

;; hippie-expand
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
     '(try-expand-dabbrev
       try-expand-dabbrev-visible
       try-expand-dabbrev-all-buffers
       try-expand-dabbrev-from-kill
       try-complete-file-name-partially
       try-complete-file-name
       try-expand-all-abbrevs
       try-expand-list
       try-expand-line
       try-complete-lisp-symbol-partially
       try-complete-lisp-symbol))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(canlock-password "4062afc35d164e61ec1bb80227c43dd68b9fcaed")
 '(ecb-options-version "2.32")
 '(lisp-program-name "sbcl")
 '(prolog-program-name "swipl")
 '(scheme-program-name "scheme48"))

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "java")))

;; Emacs Muse mode setup
(require 'muse-mode)

(require 'muse-html)         ;添加html格式的支持
(require 'muse-latex)        ; 添加latex格式的支持
(require 'muse-texinfo)      ; 添加texinfo格式的支持
(require 'muse-docbook)      ; 添加docbook格式的支持
(require 'muse-wiki nil t)   
(require 'muse-project)      ; 添加wiki project的支持

;设置编码方式为utf-8
(setq muse-html-meta-content-type (concat "text/html; charset=utf-8"))

;新建一个wiki工程
(setq muse-project-alist
      '(("MyWiki"
         ("~/Sites/wiki" :default "index")
         (:base "html" :path "~/Sites/wiki/publish"))))
(define-key muse-mode-map [tab] 'indent-for-tab-command)
(require 'org)
(define-key muse-mode-map (kbd "<tab>") 'indent-for-tab-command)
(setq muse-colors-autogen-headings 'outline)

;(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
;(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
;(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
;(setq prolog-system 'swi)

;; C-Sharp mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

(autoload 'cweb-mode "cweb-mode" "Major mode for edting CWEB code." t)

;; Smart Compile
(require 'smart-compile)

(setq recentf-exclude '("^/[^/:]+:"))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;;;; This kind of comments are made my me.

;; Cedet settings

;;;;;(load-file "/Applications/Emacs.app/Contents/Resources/site-lisp/cedet/common/cedet.el")
;; * This enables the database and idle reparse engines
;;;;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;;;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;;;;;(require 'ecb)
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; )
