;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; 通过 Emacs-china 的仓库来安装包, 提升安装速度
;; FIXME
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; user
;; FIXME
(setq user-full-name "lou1043"
      user-mail-address "icewarden@pm.me")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ui
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 关掉 Doom 自己的 Theme
(setq doom-theme nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用 nano-emacs theme
(require 'disp-table)
(require 'nano-faces)
(require 'nano-colors)
(require 'nano-theme)
(require 'nano-help)
(require 'nano-modeline)
(nano-faces)
(nano-theme)

(setq display-line-numbers-type nil
      evil-default-cursor t
      custom-blue "#718591"
      custom-yellow "#BDA441")

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (set-cursor-color custom-blue))))
  (set-cursor-color custom-blue))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fonts
(setq doom-font (font-spec :family "JetBrains Mono" :weight 'light :size 18)
      doom-big-font (font-spec :family "JetBrains Mono" :weight 'light :size 35)
      doom-variable-pitch-font (font-spec :family "CMU Typewriter Text" :size 22)
      doom-unicode-font (font-spec :family "LXGW WenKai" :weight 'light :size 20)
      doom-serif-font (font-spec :family "CMU Typewriter Text" :weight 'light :size 22))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; FIXME
(setq org-directory "~/org/")
(setq org-noter-notes-search-path '("~/notes/path/"))
(after! org
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (sml . t)
     (gnuplot . t))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Coding system for HTML export.
  (setq org-html-coding-system 'utf-8)
  (setq org-html-doctype "html5")
  (setq org-html-head
        "<link rel='stylesheet' type='text/css' href='https://gongzhitaao.org/orgcss/org.css'/> ")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; better defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 打开文件时, 光标自动定位到上次停留的位置
(save-place-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vim
(after! evil-escape
  (setq evil-escape-key-sequence "fd"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 关闭 Doom rss 切割图片的功能, 展示完整图片吧
(setq +rss-enable-sliced-images nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1) ;; minimal chrome
(tool-bar-mode -1) ;; no toolbar
(scroll-bar-mode -1) ;; disable scroll bars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No fringe
(fringe-mode '(0 . 0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 窗口滚动时, 光标所在行不要顶到边缘, 留两行的 Buffer
(setq scroll-margin 2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line cursor and no blink
(set-default 'cursor-type  '(bar . 3))
(blink-cursor-mode 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paren mode is part of the theme
(show-paren-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Underline line at descent position, not baseline position
(setq x-underline-at-descent-line t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smooth mouse scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))  ; scroll two lines at a time
      mouse-wheel-progressive-speed nil             ; don't accelerate scrolling
      mouse-wheel-follow-mouse t                    ; scroll window under mouse
      scroll-step 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rime
(use-package! rime
  :custom
  (default-input-method "rime")
;; FIXME
;;  (rime-librime-root "~/Documents/emacs/depend/librime/dist")
;;  (rime-emacs-module-header-root "/usr/local/opt/emacs-mac/include")
  :config
  (define-key rime-mode-map (kbd "C-i") 'rime-force-enable)
  (setq rime-disable-predicates
        '(rime-predicate-evil-mode-p
          rime-predicate-after-alphabet-char-p
          rime-predicate-current-input-punctuation-p
          rime-predicate-current-uppercase-letter-p
          rime-predicate-punctuation-line-begin-p))
  ;; FIXME
  (setq rime-user-data-dir "~/.config/fcitx5/rime/")
  (setq rime-show-candidate 'posframe))
;;  (setq rime-user-data-dir "~/.local/share/fcitx5/rime/"))
;;  (setq rime-user-data-dir "~/Library/Rime"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vlaign
(use-package! valign
  :config
  (setq valign-fancy-bar t)
  (add-hook 'org-mode-hook #'valign-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pangu-spacing
(use-package! pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  ;; 在中英文符号之间, 真正地插入空格
  (setq pangu-spacing-real-insert-separtor t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lang
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP－CC
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex
;; FIXME
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2021/bin/x86_64-linux"))
(setq exec-path (append exec-path '("/usr/local/texlive/2021/bin/x86_64-linux")))

(setq org-highlight-latex-and-related '(native script entities))

;; (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

(pdf-loader-install)

(setq Tex-command-default "XeLaTeX")
(setq org-latex-pdf-process
      '(
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "rm -fr %b.out %b.log %b.tex auto"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("ctexart" "\\documentclass[11pt,titlepage]{ctexart}

% Document title
\\usepackage{titling}

% Page Margins: important
% https://ctan.math.illinois.edu/macros/latex/contrib/geometry/geometry.pdf
% \\usepackage[scale=0.8,centering]{geometry}
\\usepackage{geometry}
\\geometry{
    a4paper,% 210 * 297mm
    nomarginpar,% 即\marginparwidth=0pt and \marginparsep=0pt
    hcentering,% 将 hmarginratio 设为 1:1，即 left=right
    left=28mm,% 注意 left=right
    top=37.00mm,% Word 模板页眉顶端距离 20mm
    width=156mm,
    height=225mm,
    }

% Page head and foot
% lhead/chead/rhead
% lfoot/cfoot/rfoot
\\usepackage{fancyhdr}
\\pagestyle{fancy}
\\rfoot{\\title}
\\renewcommand\\headrulewidth{0.6pt}
\\renewcommand\\footrulewidth{0.6pt}


% Format of section and subsection headers
% [rm sf tt bf up it sl sc]
% Select the corresponding family/series/shape. Default is bf.
\\usepackage{titlesec}

% for use notin math symbol
\\usepackage{unicode-math}

% 使用 UTF-8 编码输入文字
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}

% Hyperlinks and bookmarks
\\usepackage{hyperref}
\\hypersetup{colorlinks=true,linkcolor=blue}

% xcolor is more powerful than color
% \\color{red!70}  %70 percent red color
% \\textcolor{red}
% \\colorbox{gray}
\\usepackage[rgb]{xcolor}

% Include graphics
\\usepackage{graphicx}

\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}

% List items
\\usepackage{enumerate}
%% \\usepackage{enumitem}

% Line spread
\\usepackage{parskip}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-latex-default-class "ctexart")
  (setq org-latex-compiler "xelatex"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:




;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
