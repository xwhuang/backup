
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(global-font-lock-mode t nil (font-lock))
 '(safe-local-variable-values (quote ((indent-tabs-mode . 1))))
 '(send-mail-function (quote smtpmail-send-it)))
;;end custom-set-variables

(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))

(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq delete-auto-save-files t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq require-final-newline t)

;;set hotkey
(define-key global-map "\C-g" 'goto-line)
;;end set hotkey

(global-auto-revert-mode)
(global-unset-key "\C-z")
(require 'hl-line)
(global-hl-line-mode t)
(setq-default make-backup-files nil)
(global-set-key [f1] 'info) 
(global-set-key [f2] 'undo)
(global-set-key (kbd "C-x h")
'(lambda () "myhome" (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C-x l")
'(lambda () "myend" (interactive) (move-to-window-line -1)))
(global-set-key [(f3)] 'find-tag-regexp)
(global-set-key [(f4)] 'shell-command)
(global-set-key [(f5)] 'linum-mode)
(global-set-key [(f7)] 'compile)
(global-set-key [(f9)] 'other-window)
(global-set-key [(f10)] 'delete-other-windows)
;;(global-set-key [(f12)] 'split-window-vertically)

(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq line-number-mode t)

;;-------------------------------

(defun linux-c-mode()
  (interactive)
  (c-mode)  (c-set-style "K&R")
  (setq tab-width 4)
  ;;(setq indent-tabs-mode t)
  (setq comment-start "/**< ")
  (setq c-basic-offset 4))
  (setq auto-mode-alist (cons '("\\.[chyl]$" . linux-c-mode) auto-mode-alist))


;;add c++-mode
(defun cpp-mode()
  (interactive)
  (c-mode)  (c-set-style "K&R")
  (indent-tabs-mode . nil) ; use spaces rather than tabs
  (setq tab-width 4)
  (setq comment-start "/**< ")
  (setq c-basic-offset 4))
(setq auto-mode-alist (cons '("\\.cpp$" . cpp-mode) auto-mode-alist))

;;set prefix
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")

;;2012-04-06
;; 一打开就起用 text 模式。 
(setq default-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;让emacs打开图片
(setq auto-image-file-mode t)

;;改变标题栏
(setq frame-title-format "emacs@%b")

;;关闭启动画面
(setq inhibit-startup-message t)

(display-time-mode 1);显示时间，格式如下 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 

(global-set-key (kbd "M-SPC") 'set-mark-command)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-buffer-file-coding-system 'utf-8)            ;缓存文件编码
(setq default-file-name-coding-system 'utf-8)              ;文件名编码
(setq default-keyboard-coding-system 'utf-8)               ;键盘输入编码
(setq default-sendmail-coding-system 'utf-8)               ;发送邮件编码
(setq default-terminal-coding-system 'utf-8)               ;终端编码

;;============
(setq load-path (cons "/usr/local/share/emacs/site-lisp/doxymacs/" load-path)) 
;;(load "doxymacs")
(load "lzayre")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)
(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq java-mode-hook '(lambda () (gtags-mode 1)))
(global-set-key (kbd "M-g f s") 'gtags-find-symbol)
(global-set-key (kbd "M-g f t") 'gtags-find-tag)
(global-set-key (kbd "M-g f p") 'gtags-find-pattern)
(global-set-key (kbd "M-g f r") 'gtags-find-rtag)

(add-hook 'c-mode-hook
          '(lambda ()
             (gtags-mode 1)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (gtags-mode 1)))

(add-hook 'find-file-hook
  '(lambda ()
     (when (and (buffer-file-name)
                (file-exists-p (buffer-file-name))
        (file-writable-p (buffer-file-name)))
       (message "Toggle to read-only for existing file")
       (toggle-read-only 1))))

;;for org-mode latex
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                 "xelatex -interaction nonstopmode %f"))


(ffap-bindings)

;;for rfc.el
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(require 'rfc)
(setq rfc-url-save-directory "~/work/rfc")
(setq rfc-index-url "http://www.ietf.org/rfc/rfc-index.txt")
;;(setq rfc-index-url "http://www.ietf.org/id")
(setq rfc-archive-alist (list (concat rfc-url-save-directory "/rfc.zip")
                              rfc-url-save-directory
                              "http://www.ietf.org/rfc/"))
(setq rfc-insert-content-url-hook '(rfc-url-save))
(defvar rfc-index-mode-map nil
  "Keymap for RFC index mode")

(if rfc-index-mode-map
    nil
  (setq rfc-index-mode-map (make-sparse-keymap))
  (suppress-keymap rfc-index-mode-map)
  (let ((map rfc-index-mode-map))
    (define-key map "\C-m" 'rfc-index-goto-nearest)
    (define-key map "g" 'rfc-goto-number)
    (define-key map "\C-j" 'rfc-index-follow-nearest)
    (define-key map "f" 'rfc-index-follow-number)
    (define-key map "o" 'rfc-index-follow-obsoleted)
    (define-key map "O" 'rfc-index-follow-obsoletes)
    (define-key map "u" 'rfc-index-follow-updates)
    (define-key map "U" 'rfc-index-follow-updated)
    (define-key map [mouse-2] 'rfc-index-mouse-2)
    (define-key map "n" 'scroll-up)
    (define-key map "p" 'scroll-down)
    (define-key map " " 'scroll-up)
    (define-key map "\C-?" 'scroll-down)
    (define-key map "s" 'isearch-forward)
    (define-key map "r" 'isearch-backward)
    (define-key map "q" 'rfc-index-kill-buffer)
    ))

;;set slime
;(add-to-list 'load-path "/home/xwhuang/work/lisp/slime-2.4")
;(require 'slime-autoloads)
;(setq inferior-lisp-program "//opt/mysbcl/bin/sbcl")
;(setq slime-contribs '(slime-fancy))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (sh . t)))

;;font-latex.el
(setq font-latex-do-multi-line nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-meta-line ((t (:inherit font-lock-comment-face :weight extra-bold)))))

;;
(defun get-name ()
  (let ((name (read-from-minibuffer "Enter your name: ")))
    (setq xname name)
    (insert xname)))

(global-set-key [(f12)] 'get-name)


;;for zone
(require 'zone)
(global-set-key (kbd "C-z z") 'zone)

(global-set-key (kbd "C-z s") 'slime)

(defun set-ffap-c-path ()
  (interactive)
  (let ((c-path (read-from-minibuffer "Enter c-path: ")))
    (setq ffap-c-path c-path)))

(defun xpdf ()
  (interactive)
  (let ((files
         (if (eq major-mode 'dired-mode)
             (dired-get-marked-files)
           (let ((default-directory (read-directory-name "dir: ")))
             (mapcar #'expand-file-name 
                     (file-expand-wildcards "*.org"))))))
    (mapc
     (lambda (f)
       (with-current-buffer
           (find-file-noselect f)
         (org-latex-export-to-pdf)))
     files)))

;;for test
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

