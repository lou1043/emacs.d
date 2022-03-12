;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; 鼠标放到加粗字符上, 可编辑修饰符, 离开即显示加粗后的效果
;;(package! org-appear
;;  :recipe (:host github :repo "awth13/org-appear"))
;; 鼠标放到 LaTeX 代码上, 可编辑状态, 离开即显示编译后的公式效果
(package! org-fragtog)
;; 通过 orgmode 写博客, 使用此包即可
(package! org-page)
;; 一个快速查询 org 文件相关内容的 query language
(package! org-ql)
;; 中英文字符之间自动插入空格, 增加可阅读性
(package! pangu-spacing)
;; 在 Emacs 中使用 rime, 减少切换中英文状态
(package! rime)
;; 完美解决中英文字符在表格中对齐的问题
(package! valign)
;; 默认的 dired 展现内容太多了, 通过此包可过滤展示需要的内容
(package! dired-narrow)
;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; [[file:config.org::*Rotate (window management)][Rotate (window management):1]]
(package! rotate)
;; Rotate (window management):1 ends here

;; [[file:config.org::*Very large files][Very large files:1]]
(package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el")) :disable t)
;; Very large files:1 ends here

;; [[file:config.org::*Meow][Meow:1]]
(package! meow)
;; Meow:1 ends here

;; [[file:config.org::*Annotate][Annotate:1]]
(package! annotate)
;; Annotate:1 ends here

;; [[file:config.org::*Magit delta][Magit delta:2]]
(package! magit-delta :recipe (:host github :repo "dandavison/magit-delta"))
;; Magit delta:2 ends here

;; [[file:config.org::*Don't use ~spell-fu~!][Don't use ~spell-fu~!:1]]
(disable-packages! spell-fu)
;; Don't use ~spell-fu~!:1 ends here

;; [[file:config.org::*Auto activating snippets][Auto activating snippets:1]]
(package! aas :recipe (:host github :repo "ymarco/auto-activating-snippets"))
;; Auto activating snippets:1 ends here

;; [[file:config.org::*Screenshot][Screenshot:1]]
;;(package! screenshot :recipe (:local-repo "lisp/screenshot"))
;; Screenshot:1 ends here

;; [[file:config.org::*Etrace][Etrace:1]]
(package! etrace :recipe (:host github :repo "aspiers/etrace"))
;; Etrace:1 ends here

;; [[file:config.org::*Etrace][Etrace:2]]
(use-package! etrace
  :after elp)
;; Etrace:2 ends here

;; [[file:config.org::*String inflection][String inflection:1]]
(package! string-inflection)
;; String inflection:1 ends here

;; [[file:config.org::*Info colours][Info colours:1]]
(package! info-colors)
;; Info colours:1 ends here

;; [[file:config.org::*Modus themes][Modus themes:1]]
(package! modus-themes)
;; Modus themes:1 ends here

;; [[file:config.org::*Nano heme][Nano heme:1]]
(package! nano-emacs
  :recipe (:host github :repo "rougier/nano-emacs"))
;; Nano heme:1 ends here

;; [[file:config.org::*Theme magic][Theme magic:1]]
(package! theme-magic)
;; Theme magic:1 ends here

;; [[file:config.org::*Keycast][Keycast:1]]
(package! keycast)
;; Keycast:1 ends here

;; [[file:config.org::*Screencast][Screencast:1]]
(package! gif-screencast)
;; Screencast:1 ends here

;; [[file:config.org::*Prettier page breaks][Prettier page breaks:1]]
(package! page-break-lines :recipe (:host github :repo "purcell/page-break-lines"))
;; Prettier page breaks:1 ends here

;; [[file:config.org::*xkcd][xkcd:1]]
(package! xkcd)
;; xkcd:1 ends here

;; [[file:config.org::*Selectric][Selectric:1]]
(package! selectric-mode)
;; Selectric:1 ends here

;; [[file:config.org::*Wttrin][Wttrin:1]]
;;(package! wttrin :recipe (:local-repo "lisp/wttrin"))
;; Wttrin:1 ends here

;; [[file:config.org::*Spray][Spray:1]]
(package! spray)
;; Spray:1 ends here

;; [[file:config.org::*Elcord][Elcord:1]]
(package! elcord)
;; Elcord:1 ends here

;; [[file:config.org::*Systemd][Systemd:1]]
(package! systemd)
;; Systemd:1 ends here

;; [[file:config.org::*Lean][Lean:1]]
;;(package! lean4-mode :recipe
;;  (:host github
;;   :repo "leanprover/lean4"
;;   :files ("lean4-mode/*.el")))
;; Lean:1 ends here

;; [[file:config.org::*Sage Math][Sage Math:1]]
(package! sage-shell-mode)
(package! ob-sagemath)
;; Sage Math:1 ends here

(package! org-mode :recipe (:host github :repo "emacs-straight/org-mode" :files ("*.el" "lisp/*.el" "etc") :pre-build (with-temp-file (doom-path (straight--repos-dir "org-mode") "org-version.el") (insert "(fset 'org-release (lambda () \"9.5\"))
" (format "(fset 'org-git-version (lambda () \"%s\"))
" (substring (shell-command-to-string "git rev-parse --short HEAD") 0 -1)) "(provide 'org-version)
")) :includes org) :pin nil)
(unpin! org-mode) ; there be bugs
(package! org-contrib
  :recipe (:host nil :repo "https://git.sr.ht/~bzg/org-contrib"
           :files ("lisp/*.el")))
(unpin! org-contrib)

(setq org-id-method 'ts)

(package! org-pretty-table
  :recipe (:host github :repo "Fuco1/org-pretty-table"))

(package! org-appear :recipe (:host github :repo "awth13/org-appear"))

;;(package! valign :recipe (:host github :repo "casouri/valign"))

(package! org-ol-tree :recipe (:host github :repo "Townk/org-ol-tree"))

(package! org-modern)

;; (add-hook 'org-mode-hook #'org-modern-mode)

(package! org-ref)

(package! ob-http)

(package! org-transclusion :recipe (:host github :repo "nobiot/org-transclusion"))

(package! org-graph-view :recipe (:host github :repo "alphapapa/org-graph-view"))

(package! org-chef)

;;(package! org-pandoc-import :recipe
;;  (:local-repo "lisp/org-pandoc-import" :files ("*.el" "filters" "preprocessors")))

;;(package! orgdiff :recipe (:local-repo "lisp/orgdiff"))

;;(package! org-music :recipe (:local-repo "lisp/org-music"))

(package! citar)
(package! citeproc)
(package! org-cite-csl-activate :recipe (:host github :repo "andras-simonyi/org-cite-csl-activate"))

(package! org-super-agenda)

(package! doct
  :recipe (:host github :repo "progfolio/doct"))

(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
(unpin! org-roam)
(package! websocket) ; dependency of `org-roam-ui'

(package! seperate-inline :recipe
  (:host github :repo "ingtshan/separate-inline.el" :files ("lean4-mode/*.el")))

(package! org-pretty-tags)

(package! xenops)


(package! engrave-faces)

;;(package! ox-chameleon :recipe (:local-repo "lisp/ox-chameleon"))

(package! ox-gfm)

;; [[file:config.org::*LAAS][LAAS:1]]
(package! laas)
;; LAAS:1 ends here

;; [[file:config.org::*Graphviz][Graphviz:1]]
(package! graphviz-dot-mode)
;; Graphviz:1 ends here

;; [[file:config.org::*Beancount][Beancount:1]]
(package! beancount :recipe (:host github :repo "beancount/beancount-mode"))
;; Beancount:1 ends here

;; [[file:config.org::*wakatime][wakatime:1]]
(package! wakatime-mode)
;; wakatime:1 ends here

;; [[file:config.org::*Input Method][Input Method:1]]
(package! sis)
;; Input Method:1 ends here

;; [[file:config.org::*Use =emacs-rime=][Use =emacs-rime=:1]]
;;(package! rime)
;; Use =emacs-rime=:1 ends here

;; [[file:config.org::*Ebooks][Ebooks:1]]
;;(package! calibredb)
;; Ebooks:1 ends here

;; [[file:config.org::*Ebooks][Ebooks:2]]
;;(package! nov)
;; Ebooks:2 ends here

;; [[file:config.org::*CalcTeX][CalcTeX:1]]
(package! calctex :recipe (:host github :repo "johnbcoughlin/calctex"
                           :files ("*.el" "calctex/*.el" "calctex-contrib/*.el" "org-calctex/*.el" "vendor")))
;; CalcTeX:1 ends here
;;(package! org-fragtog)

;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
