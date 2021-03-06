(load "server")
(unless (server-running-p) (server-start))

;;(setq url-proxy-services
;;   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;     ("http" . "proxy.iiit.ac.in:8080")
;;     ("https" . "proxy.iiit.ac.in:8080")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; don't need to refresh and annoy the world each time you launch.
;; (package-refresh-contents)
(package-initialize)

(require 'cl)

;;allow GC to use memory
(setq gc-cons-threshold 20000000)

;; spell check
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")


;;parens niceness
(electric-pair-mode 1)
(show-paren-mode t)


;;hide cruft
;; (tool-bar-mode -1)
(setq inhibit-startup-screen t)

;;save files
;; store all backup and autosave files in the tmp dir
;;(setq backup-directory-alist
;;      `((".*" . ,temporary-file-directory)))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))
;;(setq backup-by-copying t)


;;disable tabs
(setq-default indent-tabs-mode nil)
;;(infer-indentation-style)

;;indentation
(define-key global-map (kbd "RET") 'newline-and-indent)

;;font
;;(add-to-list 'default-frame-alist '(font . "Hack-17"))

;; line  by line scrolling
(setq scroll-step 1)
;; spaces for tab
(setq-default indent-tabs-mode nil) 

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)


(defun install-all-packages ()
  "install / update all packages I care about"
  (interactive)
  (package-initialize)
  (package-refresh-contents)
  (let ((ps '(ivy key-chord intero
              powerline company racer projectile
              counsel-projectile leuven-theme)))
    (dolist (p ps)
      (when (not (package-installed-p p))
        (package-install p))))
)




;;disallow org from reformatting source blocks
(setq org-src-preserve-indentation t)


(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer

;;org-mode
(global-set-key (kbd "C-c a") 'org-agenda)


;; powerline
(require 'powerline)
(powerline-default-theme)

;; company - autocomplete
(require 'company)
;; (add-hook 'c++-mode-hook 'company-mode)
;; (add-hook 'c-mode-hook 'company-mode)
(setq company-idle-delay 0.0)
(global-set-key (kbd "C-/") 'company-complete)

;;gitconfig
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

;; DISABLE IRONY TILL WE CAN BUILD IT
;;C/C++ (1/4 of my life)
;; (require 'irony)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)




;;markdown
;; (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
;; (add-hook 'markdown-mode-hook
;;           (lambda ()
;;             (visual-line-mode t)
;;             (writegood-mode t)))
;; 
;; (setq markdown-command "pandoc --smart -f markdown -t html")

;; ivy, swiper
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)


;;projectile
(projectile-mode)
(setq projectile-enable-caching t)

;; sublime text like bindings
(global-set-key (kbd "C-c @") 'swiper)



;;proof general
;;(load "~/.emacs.d/lisp/PG/generic/proof-site")

;;flyspell
(require 'flyspell)
(flyspell-mode +1)
;; spell checking in comments
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; make sure spell checking works
;; (setq-default ispell-program-name "aspell")
;; (ispell-change-dictionary "en_GB" t)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(coq-prog-name "/usr/local/bin/coqtop")
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "d5f17ae86464ef63c46ed4cb322703d91e8ed5e718bf5a7beb69dd63352b26b2" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "d29231b2550e0d30b7d0d7fc54a7fb2aa7f47d1b110ee625c1a56b30fea3be0f" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(delete-selection-mode nil)
 '(hl-sexp-background-color "#efebe9")
 '(ivy-height 40)
 '(package-selected-packages
   (quote
    (intero company-irony haskell-mode haskell-emacs web-mode solarized-theme smex racket-mode racer projectile material-theme markdown-preview-mode magit key-chord js2-mode ido-vertical-mode flx-ido evil company badwolf-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; colorscheme
(require 'leuven-theme)
(load-theme 'leuven)

;; Prettify
(require 'pretty-mode)
(global-pretty-mode t)

(pretty-activate-groups
 '(:sub-and-superscripts :greek :arithmetic-nary))

(global-prettify-symbols-mode 1)

(add-hook
 'org-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(;;Syntax
           ("`->" . #x27F6)
           ("`<-" . #x27F5)
           ("`|-" . #x22A2)
           ("`==>" . #x21D2)
           ("`<==>" . #x21D4)
           ("`\\/" . #x2228)
           ("`/\\" . #x2227)
           ("`top" . #x22A4)
           ("`bottom" . #x22A5)
           ("`forall" . #x2200)
           ("`exists" . #x2203)
           ("`~" . #x00AC)
           ("`in" . #x2208)
           ("`nin" . #x2209)
           ("`subset" . #x2282)
           ("`superset" . #x2283)
           ("`nsubset" . #x2284)
           ("`nsuperset" . #x2285)
           ("`subseq" . #x2286)
           ("`superseq" . #x2287)
           ("`<>" . #x2260)
           ("`almosteq" . #x2248)
           ("`<=" . #x2264)
           ("`>=" . #x2265)
           ("`Int" . #x2124)
           ("`Real" . #x211D)
           ("`models" . #x22A8)
           ("`nmodels" . #x22AD)
           ("`eqq" . #x2630)
           ("`a" . "α")
("`b" . "β")
("`g" . "γ")
("`d" . "δ")
("`e" . "ε")
("`z" . "ζ")
("`h" . "η")
("`q" . "θ")
("`i" . "ι")
("`k" . "κ")
("`l" . "λ")
("`m" . "μ")
("`n" . "ν")
("`x" . "ξ")
("`o" . "ο")
("`p" . "π")
("`r" . "ρ")
("`s" . "σ")
("`t" . "τ")
("`u" . "υ")
("`f" . "ϕ")
("`j" . "φ")
("`c" . "χ")
("`y" . "ψ")
("`w" . "ω")
("`A" . "Α")
("`B" . "Β")
("`G" . "Γ")
("`D" . "Δ")
("`E" . "Ε")
("`Z" . "Ζ")
("`H" . "Η")
("`Q" . "Θ")
("`I" . "Ι")
("`K" . "Κ")
("`L" . "Λ")
("`M" . "Μ")
("`N" . "Ν")
("`X" . "Ξ")
("`O" . "Ο")
("`P" . "Π")
("`R" . "Ρ")
("`S" . "Σ")
("`T" . "Τ")
("`U" . "Υ")
("`F" . "Φ")
("`J" . "Φ")
("`C" . "Χ")
("`Y" . "Ψ")
("`W" . "Ω")
           ))))

;; Fstar
(setq-default fstar-executable "/home/wistfulshadow/Gnomon/FStar/bin/fstar.exe")
(setq-default fstar-smt-executable "/home/wistfulshadow/Base/z3-4.5.1.1f29cebd4df6-x64-debian-8.5/bin/z3")

;; Proof General
(load "~/.emacs.d/lisp/PG/generic/proof-site")
