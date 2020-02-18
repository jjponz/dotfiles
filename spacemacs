;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     html
     javascript
     markdown
     yaml
     python
     sql
     django
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     better-defaults
     emacs-lisp
     git
     ;; markdown
     org
     (shell :variables
           shell-default-height 30
           shell-default-shell 'multiterm
           shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     csharp
     ansible
     puppet
     docker
     (elixir :variables elixir-backend 'alchemist)
     lsp
     restclient
     neotree
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(solarized-theme doom-themes editorconfig flycheck-mypy importmagic all-the-icons flatui-theme centaur-tabs)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 25
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers `t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  "Configuramos neotree"
  (setq neo-theme 'icons)

  "Activamos all the icons"
  (require 'all-the-icons)

  "configuramos centau-tabs"
  "Centau-tabs tiene un bug que me freezea el sistema"
  ;; (require 'centaur-tabs)
  ;; (setq centaur-tabs-style "bar"
  ;;       centaur-tabs-height 30
  ;;       centaur-tabs-set-icons t
  ;;       centaur-tabs-set-bar 'under
  ;;       centaur-tabs-show-navigation-buttons t
  ;;       centaur-tabs-set-modified-marker t
  ;;       centaur-tabs-modified-marker "*"
  ;;       x-underline-at-descent-line t)
  ;; (centaur-tabs-headline-match)

  ;; (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
  ;; (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)
  ;; (centaur-tabs-mode t)

  ;; (defun centaur-tabs-hide-tab (x)
  ;;   (let ((name (format "%s" x)))
	;;     (or
	;;      (string-prefix-p "*epc" name)
	;;      (string-prefix-p "*helm" name)
	;;      (string-prefix-p "*Compile-Log*" name)
	;;      (string-prefix-p "*lsp" name)
	;;      (and (string-prefix-p "magit" name)
	;;           (not (file-name-extension name)))
	;;      )))

  "Intenamos que el go to definition vaya correctamente en todos los modos"
  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))

  "Configuramos mypy"
  (require 'flycheck-mypy)
  (flycheck-add-next-checker 'python-flake8 'python-mypy t)

  " Establecemos el backend para company"
  (eval-after-load
      'company
    '(add-to-list 'company-backends 'company-omnisharp))

  "Añadimos flycheck a omnisharp"
  (add-hook 'csharp-mode-hook #'flycheck-mode)

  "Intento que el autocompletado sea fuzzy"
  (setq omnisharp-company-match-type 'company-match-flx)

  "añadimos company al modo omnisharp"
  (add-hook 'csharp-mode-hook #'company-mode)

  "Ruta del ejecutable del omnisharserver"
  (setq-default omnisharp-server-executable-path "~/Dropbox/omnisharp-linux-x64/run")

  "Escapamos a normal mode con kj "
  (setq-default evil-escape-key-sequence "kj")

  "Las tabulaciones son siempre 4 espacios"
  (setq tab-width 4)

  "Corregimos el fallo con emacs 25.1 mediante el cual no nos deja crear ficheros y demas con neotree, cuándo actualicemos emacs probamos a quitar la linea de debajo"
  (setq helm-split-window-inside-p t)

  "<spc> jñ ejecuta avy-goto-word-0"
  (spacemacs/set-leader-keys "jñ" 'avy-goto-word-0)

  "Los archivos de agenda estan en ~/org-mode/"
  (setq org-agenda-files '("~/Dropbox/org-mode"))

  "Al poner el clock in en una tarea, se pone automaticamente en doing"
  (setq org-clock-in-switch-to-state "DOING")

  "C-y activa spacemacs/helm-yas"
  (define-key evil-insert-state-map (kbd "C-y") 'spacemacs/helm-yas)
  
  "Al poner el clockout en una tarea, se pone automaticamente en paused"
  (setq org-clock-out-switch-to-state "PAUSED")

  "El reloj se para cuando una tarea pasa a DONE"
  ;; (setq org-clock-out-when-done t)

  "Plantillas para org-mode"
  (setq org-capture-templates '(("t" "Todo numenalia [inbox]" entry
                                 (file+headline "~/Dropbox/org-mode/numenalia.org" "Inbox")
                                 "* TODO %?\n\tCREATED: %u\n\t:LOGBOOK:\n\t:END:")
                                ("n" "Note numenalia[inbox]" entry
                                 (file+headline "~/Dropbox/org-mode/numenalia.org" "Inbox")
                                 "** %?\n\tCREATED: %u\n%a")
                                ("a" "Todo access [inbox]" entry
                                 (file+headline "~/Dropbox/org-mode/access.org" "Inbox")
                                 "* TODO %?\n\tCREATED: %u\n\t:LOGBOOK:\n\t:END:")
                                ))

  "Personalizo los colores para DOING y PAUSED"
  (setq org-todo-keyword-faces
        '(("DOING" . (:foreground "orange" :weight bold))
          ("TODO" . (:foreground "IndianRed1" :weight bold))
          ("WAIT" . (:foreground "yellow" :weight normal))
          ("INDATE" . (:foreground "IndianRed1" :weight bold))
          ("PAUSED" . (:foreground "yellow"))
          ("NEXT" . (:foreground "red" :weight bold))
          ("DONE" . (:foreground "green" :weight bold))
          ))

  "omitimos los elementos done en la agenda"
  ;; (setq org-agenda-skip-scheduled-if-done t
  ;;       org-agenda-skip-deadline-if-done  t)

  "Configuración inicial del refile"
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))

  "Creación de headers"
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  "ponemos el archivo de agenda al que se va a hacer refile"
  (setq org-refile-use-outline-path 'file)

  (setq org-outline-path-complete-in-steps nil)

  "Vistas para las agendas"
  (setq org-agenda-custom-commands
        `(
          ("w" "Access weekly agenda"
           ((agenda ""
                    ((org-agenda-ndays 7)
                     (org-agenda-skip-scheduled-if-done t)
                     (org-agenda-skip-deadline-if-done t)
                     (org-agenda-files '("~/Dropbox/org-mode/access.org"))
                     (org-agenda-sorting-strategy
                      (quote ((tag-up))))
                     (org-deadline-warning-days 4)))))
          ("z" "Numenalia weekly agenda"
           ((agenda ""
                    ((org-agenda-ndays 7)
                     (org-agenda-files (quote ("~/Dropbox/org-mode/numenalia.org")))
                     (org-agenda-skip-scheduled-if-done t)
                     (org-agenda-skip-deadline-if-done  t)
                     (org-agenda-sorting-strategy
                      (quote ((tag-up))))
                     (org-deadline-warning-days 4)))))
        ("b" agenda "Today's access Deadlines"
         ((org-agenda-span 'day)
          (org-agenda-time-grid nil)
          (org-agenda-show-all-dates nil)
          (org-agenda-skip-scheduled-if-done t)
          (org-agenda-skip-deadline-if-done t)
          (org-agenda-files '("~/Dropbox/org-mode/access.org"))
          (org-agenda-entry-types '(:deadline, :scheduled)) 
          (org-agenda-sorting-strategy
           (quote ((tag-up))))
          (org-deadline-warning-days 0)
          (org-agenda-skip-scheduled-if-deadline-is-shown t) ))
        ("v" agenda "Today's numenalia Deadlines"
         ((org-agenda-span 'day)
          (org-agenda-time-grid nil)
          (org-agenda-show-all-dates nil)
          (org-agenda-skip-scheduled-if-done t)
          (org-agenda-skip-deadline-if-done t)
          (org-agenda-files '("~/Dropbox/org-mode/numenalia.org"))
          (org-agenda-entry-types '(:deadline, :scheduled)) 
          (org-agenda-sorting-strategy
           (quote ((tag-up))))
          (org-deadline-warning-days 0)
          (org-agenda-skip-scheduled-if-deadline-is-shown t) ))
        ))

  "Vamos a ver si conseguimos que los parentesis se coloreen como dios manda"
  (set-face-attribute 'show-paren-match nil :background "#FF0000")
  (set-face-attribute 'show-paren-match nil :foreground "#1D1F21")
  (set-face-attribute 'show-paren-match nil :underline  t        )

  "Al salir de emacs automáticamente para el reloj y guarda el archivo org sobre el que se este ejecutando"
  (defun org-clock-out-maybe ()
    "Stop a currently running clock."
    (org-clock-out nil t)
    (org-save-all-org-buffers))
  (add-hook 'kill-emacs-hook 'org-clock-out-maybe)

  "Añadimos org-clock a modeline"
  (setq spaceline-org-clock-p t)

  "Configuramos que los pomodoro van a ser de 45 minutos"
  (setq org-pomodoro-length 30)

  "Habilitamos paren-mode, modo para encontrar las parejas de los parentesis"
  (show-paren-mode 1)


  "Configuración de doom-themes"
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config) ; all-the-icons fonts must be installed!
  (doom-themes-org-config) ; Corrects (and improves) org-mode's native fontification.
  ;; esto es necesario para correr el doom-dracula
  ;; (load-theme 'flatui)

  "Configuración de los lenguajes de google-translate"
  (setq google-translate-translation-directions-alist
        '(("en" . "es") ("es" . "en"))
  )
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "es")

  "Tabular hace company-complete o tabula"
  (global-set-key (kbd "<backtab>") 'company-complete-common-or-cycle)

  "Habilitamos truncate line al inicio"
  (setq-default truncate-lines t)
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" default))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(ht pfuture flatui-theme ob-elixir flycheck-mix flycheck-credo alchemist elixir-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data importmagic lv flycheck-mypy transient dockerfile-mode docker tablist docker-tramp editorconfig livid-mode skewer-mode json-mode js2-refactor multiple-cursors company-tern web-beautify simple-httpd json-snatcher json-reformat js2-mode js-doc tern coffee-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake puppet-mode minitest chruby bundler inf-ruby mmm-mode markdown-toc markdown-mode gh-md dash jinja2-mode company-ansible ansible-doc ansible doom-city-lights-theme doom-themes all-the-icons memoize yaml-mode jedi jedi-core python-environment epc ctable concurrent deferred elpy find-file-in-project ivy pony-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic company-quickhelp powerline spinner org-category-capture alert log4e gntp org-plus-contrib shut-up hydra parent-mode projectile request gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck pkg-info epl flx magit-popup git-commit let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree highlight f s csharp-mode company bind-map bind-key yasnippet packed helm avy helm-core async auto-complete popup helm-projectile magit xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org sql-indent spaceline solarized-theme smeargle shell-pop restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omnisharp neotree mwim multi-term move-text magit-gitflow macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ ghub fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diminish diff-hl define-word company-statistics column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-column ((t (:background nil))))
 '(org-level-2 ((t (:inherit nil :foreground "#2d9574" :height 1.1))))
 '(org-scheduled-today ((t (:foreground "#bc6ec5" :height 1.0)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (seeing-is-believing ruby-refactor ruby-hash-syntax prettier-js json-navigator hierarchy livid-mode skewer-mode json-mode js2-refactor multiple-cursors company-tern web-beautify simple-httpd json-snatcher json-reformat js2-mode js-doc tern coffee-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake puppet-mode minitest chruby bundler inf-ruby mmm-mode markdown-toc markdown-mode gh-md dash jinja2-mode company-ansible ansible-doc ansible doom-city-lights-theme doom-themes all-the-icons memoize yaml-mode jedi jedi-core python-environment epc ctable concurrent deferred elpy find-file-in-project ivy pony-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic company-quickhelp powerline spinner org-category-capture alert log4e gntp org-plus-contrib shut-up hydra parent-mode projectile request gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flycheck pkg-info epl flx magit-popup git-commit let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree highlight f s csharp-mode company bind-map bind-key yasnippet packed helm avy helm-core async auto-complete popup helm-projectile magit xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org sql-indent spaceline solarized-theme smeargle shell-pop restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omnisharp neotree mwim multi-term move-text magit-gitflow macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ ghub fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diminish diff-hl define-word company-statistics column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-2 ((t (:inherit bold :foreground "#2d9574" :weight normal :height 1.1))))
 '(org-scheduled-previously ((t (:foreground "gold" :slant italic)))))
)



