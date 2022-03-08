;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; 简洁好看的主题
(package! nano-emacs
  :recipe (:host github :repo "rougier/nano-emacs"))
;; 鼠标放到加粗字符上, 可编辑修饰符, 离开即显示加粗后的效果
(package! org-appear
  :recipe (:host github :repo "awth13/org-appear"))
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
