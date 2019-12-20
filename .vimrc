"***************************************************************************************
" 0. Download this vimrc:
"       $ wget --no-check-certificate -O ~/.vimrc https://raw.githubusercontent.com/huawenyu/dotfiles/master/.vimrc
" 1. Auto-Setup-IDE-with-Plugs:
"       $ nvim -u ~/.vimrc
" 2. Hi, the <leader> is <space> and ',' :)
"       let mapleader = ","
"       nmap <space> <leader>
" 3. Help: press 'K'
"    When focus a plug's name, for example, please move cursor to following line, then press 'K':
"       @note:nvim
"       @note:test-vim
" 4. Start slow troubleshooting:
"       $ vi --startuptime /tmp/log.1
" 5. Displaying the current Vim environment
"       @note:vim_runtime
" =============================================================
"@mode: ['all', 'basic', 'theme', 'local', 'editor',
"      \   'admin', 'QA', 'coder',
"      \
"      \   'vimscript', 'c', 'python', 'latex', 'perl', 'javascript', 'clojure', 'database',
"      \   'golang', 'tcl', 'haskell', 'rust',
"      \   'note', 'script',
"      \
"      \   'morecool', 'todo', 'tool',
"      \]
"
"  Sample:
"     'mode': ['all', ],
"     'mode': ['basic', 'theme', 'local', 'editor', ],
"     'mode': ['basic', 'theme', 'local', 'editor', 'advance'],
"     'mode': ['basic', 'theme', 'local', 'editor', 'admin', 'coder', 'c', 'vimscript', 'script'],
let g:vim_confi_option = {
      \ 'mode': ['basic', 'theme', 'local', 'editor', 'advance', 'admin', 'coder', 'c', 'vimscript', 'script', 'tool'],
      \ 'change_leader': 1,
      \ 'theme': 1,
      \ 'conf': 1,
      \ 'debug': 1,
      \ 'folding': 0,
      \ 'upper_keyfixes': 1,
      \ 'auto_install_vimplug': 1,
      \ 'auto_install_plugs': 1,
      \ 'auto_install_tools': 1,
      \ 'plug_note': 'vim.config',
      \ 'plug_patch': 'vim.config',
      \
      \ 'auto_chdir': 0,
      \ 'auto_restore_cursor': 1,
      \ 'auto_qf_height': 1,
      \
      \ 'keywordprg_filetype': 1,
      \}
" =============================================================

if g:vim_confi_option.change_leader
    " Bother when termopen and input space cause a little pause-stop-wait
    let mapleader = "\<Space>"
    "" Bother when in select-mode and use the leader not works, so also provide another leader
    "" Space can be a bit tricky. Why not just map space to <leader>
    "let mapleader = ","
    "nmap <space> <leader>

    " diable Ex mode
    map Q <Nop>
endif

" Environment {{{1
    " Platform identification {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
        silent function! UNIXLIKE()
            return !WINDOWS()
        endfunction
        silent function! FREEBSD()
          let s:uname = system("uname -s")
          return (match(s:uname, 'FreeBSD') >= 0)
        endfunction

        if LINUX()
              let s:uname = system("uname -a")
        else
              let s:uname = ""
        endif

        silent function! UBUNTU()
            return (match(s:uname, 'Ubuntu') >= 0)
        endfunction
        "Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu
        "Linux .*.fc29.x86_64 #
        "Linux .el7.x86_64 #
        silent function! CENTOS()
            " echo match("Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu", 'Linux .*\.el\d\+x86_64 #')
            return (match(s:uname, 'Linux .*\.el\d\+\.') >= 0)
        endfunction
        silent function! FEDORA()
            " echo match("Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu", 'Linux .*\.el\d\+x86_64 #')
            return (match(s:uname, 'Linux .*\.fc\d\+\.') >= 0)
        endfunction
    " }


    " Basics {
        set nocompatible        " Must be first line
        if UNIXLIKE()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }


    " Debug {
        " This is old style debug, suggest using log style: @note:nvim (~Press 'K'~)
        set verbose=0
        "set verbose=8
        "set verbosefile=/tmp/vim.log

        let g:decho_enable = 0
        let g:bg_color = 233 | " current background's color value, used by mylog.syntax

        " Old echo type, abandon
        function! Decho(...)
            return
        endfunction
    " }


    " Setup python
    if LINUX()
        let s:uname = system("uname")

        let g:python_host_prog = '/usr/bin/python'
        let g:python3_host_prog = '/usr/bin/python3'

        if s:uname == "Darwin\n"
            let g:python_host_prog='/usr/bin/python'
            let g:python3_host_prog='/usr/bin/python3'
        endif

        " [Using-pyenv](https://github.com/tweekmonster/nvim-python-doctor/wiki/Advanced:-Using-pyenv)
        "   pyenv install 3.6.7
        "   pyenv virtualenv 3.6.7 neovim3
        "   pyenv activate neovim3
        "   pip install neovim
        if !empty(glob($HOME.'/.pyenv/versions/neovim2'))
            let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
            let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
        endif

        " https://github.com/neovim/neovim/issues/2094
        " Test this cause start slow 1~2secs, reproduce by:
        "       $ vi --startuptime /tmp/log.1
        "if !has('python3')
        "    echomsg "AutoInstall: pynvim"
        "    call system("pip3 install --user pynvim")
        "else
        "    call system("pip3 install --user --upgrade pynvim")
        "endif
    endif


    " Plug related:
    function! Cond(cond, ...)
        let opts = get(a:000, 0, {})
        return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
    endfunction

    function! HasIntersect(list1, list2) abort
        let result = copy(a:list1)
        call filter(result, 'index(a:list2, v:val) >= 0')
        return !empty(result)
    endfunction

    function! Mode(mode) abort
        if index(g:vim_confi_option.mode, 'all') >= 0
            return 1
        endif
        return HasIntersect(a:mode, g:vim_confi_option.mode)
    endfunction

    function! CheckPythonModule(name)
        if !executable('python') | return -1 | endif
        let importStr = system("python -c 'import ". a:name. "'")
        if stridx(importStr, 'No module named') >= 0 | return 0 | endif
        return 1
    endfunction

    " @Note only work with 'vim-plug'
    " @param type  0, Have the plug
    "              1, Select the plug
    "              2, Runtime Loaded the plug
    function! CheckPlug(name, type)
        if (exists("g:plugs") && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir))
            if a:type == 0
                return 1
            elseif a:type == 1
                if has_key(g:plugs[a:name], 'on') && empty(g:plugs[a:name]['on'])
                    return 0
                else
                    return 1
                endif
            elseif a:type == 2
                return stridx(&rtp, g:plugs[a:name].dir) >= 0
            endif
        endif
        return 0
    endfunction

    function! PlugGetDir(name)
        if (exists("g:plugs") && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir))
            return g:plugs[a:name].dir
        endif
        return ''
    endfunction


    " @see PlugForce
    function! PlugPatch(info)
        if empty(g:vim_confi_option.plug_patch) | return | endif

        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            !./install.py
        endif
    endfunction


    " Plug Force update with discard local change:
    "   1. git stash after save patch
    "   2. update
    "   3. patch again
    function! PlugForce()
        if !empty(g:vim_confi_option.plug_patch) && CheckPlug(g:vim_confi_option.plug_patch, 1)
            let dir_patch_repo = PlugGetDir(g:vim_confi_option.plug_patch)
            let dir_patch_tmp = dir_patch_repo. "../patch_tmp"
            call system(printf("rm -fr %s && mkdir -p %s", dir_patch_tmp, dir_patch_tmp))
            let dirties = filter(copy(g:plugs),
                  \ {_, v -> len(system(printf("cd %s && git diff --no-ext-diff --name-only", shellescape(v.dir))))})
            if len(dirties)
                call map(copy(dirties),
                      \ {name, v -> system(printf("cd %s && git diff HEAD > %s/%s.patch",
                      \                         shellescape(v.dir),
                      \                         dir_patch_tmp, name))})

                " Add patch to git-repo
                call system(printf("cd %s && rm -fr ./patch && cp -fr %s ./patch && git add ./patch",
                      \         dir_patch_repo, dir_patch_tmp))

                " Discard all local change & update
                call map(values(copy(dirties)),
                      \ {_, v -> system(printf("cd %s && git checkout -f", shellescape(v.dir)))})
                PlugUpdate --sync
                execute 'PlugInstall!' join(keys(dirties))

                " patch backto plugs
                call map(dirties,
                      \ {name, v -> system(printf("cd %s && patch -p1 < %s/%s.patch",
                      \                         shellescape(v.dir),
                      \                         dir_patch_tmp, name))})
                "call system(printf("rm -fr %s", dir_patch_tmp))
                return
            endif
        endif

        PlugUpdate
    endfunction
    command! PlugForce call PlugForce()


" }}}

" Use before config if available {
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }


" Auto download the plug
if g:vim_confi_option.auto_install_vimplug
    if LINUX()
        if empty(glob('~/.vim/autoload/plug.vim'))
            echomsg "AutoInstall: download vim-plug; mkdir .vim,.config/nvim; softlink .vimrc to init.vim"

            call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
            call system("curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")

            call system("touch ~/.vimrc; mkdir ~/.vim; mkdir ~/.config")
            call system("ln -s ~/.vim ~/.config/nvim")
            call system("ln -s ~/.vimrc ~/.config/nvim/init.vim")

            if UBUNTU()
                call system("sudo apt install python3-pip")
                call system("sudo apt install python3-distutils")
            elseif CENTOS() || FEDORA()
                call system("sudo yum install python3-pip")
                call system("sudo yum install python3-distutils")
            endif

            call system("pip3 install --user setuptools")
            call system("pip install --user pynvim")
            call system("pip3 install --user pynvim")

            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    endif
endif


if g:vim_confi_option.auto_install_tools
    if LINUX()
        if !CheckPythonModule('vim-vint')
            " https://github.com/mattn/efm-langserver
            " https://github.com/neoclide/coc.nvim/wiki/Language-servers
            " https://github.com/igorshubovych/markdownlint-cli
            "
            "call system("pip install --user vim-vint")
        endif
    endif
endif



" Plugins {{{1}}}
call plug#begin('~/.vim/bundle')

" Plugs Global {{{2
    " Disable all plugins's auto-maps
    "let g:no_plugin_maps = 1
"}}}

" Plug setup: Basic-config/Plugs-customize, order-sensible {{{2
    Plug 'tpope/vim-sensible', Cond(Mode(['basic',]))
    "Plug 'huawenyu/vim-basic', Cond(Mode(['basic',]), { 'do': function('PlugPatch')})
    Plug 'huawenyu/vim-basic', Cond(Mode(['basic',]))
    Plug 'huawenyu/vim.config', Cond(Mode(['basic', 'local']))  | " config the plugs
    Plug 'huawenyu/vim.command', Cond(Mode(['basic', 'local']))  | " config the plugs
"}}}

" ColorTheme {{{2
    Plug 'vim-scripts/holokai', Cond(Mode(['theme',]))
    Plug 'NLKNguyen/papercolor-theme', Cond(Mode(['theme',]))  | " set background=light;colorscheme PaperColor
    Plug 'junegunn/seoul256.vim', Cond(Mode(['theme',]))
    "Plug 'tomasr/molokai', Cond(Mode(['theme',]))
    "Plug 'darkspectrum', Cond(Mode(['theme',]))
    "Plug 'dracula/vim', Cond(Mode(['theme',]))
    "Plug 'morhetz/gruvbox', Cond(Mode(['theme',]))
    "Plug 'sjl/badwolf', Cond(Mode(['theme',]))
    "Plug 'jnurmine/Zenburn', Cond(Mode(['theme',]))
    "Plug 'joshdick/onedark.vim', Cond(Mode(['theme',]))
    "Plug 'ryu-blacknd/vim-nucolors', Cond(Mode(['theme',]))
    "Plug 'chriskempson/base16-vim', Cond(Mode(['theme',]))
    "Plug 'Lokaltog/vim-distinguished', Cond(Mode(['theme',]))
    "Plug 'flazz/vim-colorschemes', Cond(Mode(['theme',]))
    "Plug 'nanotech/jellybeans.vim', Cond(Mode(['theme',]))
    "Plug 'huawenyu/color-scheme-holokai-for-vim', Cond(Mode(['theme',]))
"}}}

" Mode {{{2
    " REPL (Read, Eval, Print, Loop) {{{3
    "  - Command Line Tool: https://github.com/BenBrock/reple
        "Plug 'sillybun/vim-repl', Cond(Mode(['coder',]))  | " Not work
        "Plug 'rhysd/reply.vim', Cond(Mode(['coder',]))
    "}}}

    " Script {{{3
    " Take current text file as script
        "
    "}}}

    " C/Cplus {{{3
        Plug 'wsdjeg/SourceCounter.vim', Cond(Mode(['coder',]))
        Plug 'huawenyu/c-utils.vim', Cond(Mode(['coder',]) && Mode(['c',]))
        Plug 'octol/vim-cpp-enhanced-highlight', Cond(Mode(['coder',]) && Mode(['c',]))
        Plug 'tenfyzhong/CompleteParameter.vim', Cond(Mode(['coder',]) && Mode(['c',]))
        "Plug 'WolfgangMehner/c-support', Cond(Mode(['coder',]) && Mode(['c',]))            | "[Start Slow]
        "Plug 'tyru/current-func-info.vim', Cond(Mode(['coder',]) && Mode(['c',]))          | "[Bad performance] Show current function name in statusline
        "Plug 'bbchung/Clamp', Cond(Mode(['coder',]) && Mode(['c',]))   | " support C-family code powered by libclang
        "Plug 'apalmer1377/factorus', Cond(Mode(['coder',]) && Mode(['c',]))
        "Plug 'hari-rangarajan/CCTree', Cond(Mode(['coder',]) && Mode(['c',]))
    "}}}

    " Indexer/Tags/cscope {{{3
        " [Tags](https://zhuanlan.zhihu.com/p/36279445)
        " [C++](https://www.zhihu.com/question/47691414/answer/373700711)
        "
        "Plug 'ludovicchabant/vim-gutentags', Cond(Mode(['coder',]))        | " autogen tags, bad performance
        "Plug 'skywind3000/gutentags_plus', Cond(Mode(['coder',]))
        "Plug 'huawenyu/vim-preview', Cond(Mode(['coder',]))
        "Plug 'whatot/gtags-cscope.vim', Cond(Mode(['coder',]))

        "Plug 'lyuts/vim-rtags', Cond(Mode(['coder',]))         | " Bad performance
        "Plug 'w0rp/ale', Cond(Mode(['coder',]))   | " 1. Not using clang's lint, 2. find references look not work

        " Please install yarn (-- a node package manger) first.
        " @note:ccls
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        "Plug 'neoclide/coc.nvim', Cond(Mode(['coder',]), {'do': 'yarn install --frozen-lockfile'})  | " sometimes find references fail
        "Plug 'neoclide/coc.nvim', Cond(Mode(['coder',]), {'on': ['<Plug>(coc-definition)', '<Plug>(coc-references)'], 'do': 'yarn install --frozen-lockfile'})  | " Increase stable by only load the plugin after the 1st command call.
        "Plug 'neoclide/coc-rls', Cond(Mode(['coder',]))

        Plug 'liuchengxu/vista.vim', Cond(Mode(['coder',]))    | " tagbar kinds support Language Server Protocol
    "}}}

    " Python {{{3
        " https://github.com/neovim/python-client
        " Install https://github.com/davidhalter/jedi
        " https://github.com/zchee/deoplete-jedi
        "Plug 'neovim/python-client', Cond(Mode(['coder',]) && Mode(['python',]))
        Plug 'python-mode/python-mode', Cond(Mode(['coder',]) && Mode(['python',]))
        Plug 'davidhalter/jedi-vim', Cond(Mode(['coder',]) && Mode(['python',]))
    "}}}

    " LaTeX {{{3
        "Plug 'lervag/vimtex', Cond(Mode(['editor',]) && Mode(['latex',]))  | " A modern vim plugin for editing LaTeX files
    "}}}

    " Perl {{{3
        Plug 'vim-perl/vim-perl', Cond(Mode(['coder',]) && Mode(['perl',]), { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' })
        Plug 'tpope/vim-cucumber', Cond(Mode(['coder',]) && Mode(['perl',]))  | " Auto test framework base on Behaviour Drive Development(BDD)
    "}}}

    " Javascript {{{3
        Plug 'pangloss/vim-javascript', Cond(Mode(['coder',]) && Mode(['javascript',]))
        Plug 'maksimr/vim-jsbeautify', Cond(Mode(['coder',]) && Mode(['javascript',]))
        Plug 'elzr/vim-json', Cond(Mode(['coder',]) && Mode(['javascript',]))

        " https://hackernoon.com/using-neovim-for-javascript-development-4f07c289d862
        Plug 'ternjs/tern_for_vim', Cond(Mode(['coder',]) && Mode(['javascript',]))      | " Tern-based JavaScript editing support.
        Plug 'carlitux/deoplete-ternjs', Cond(Mode(['coder',]) && Mode(['javascript',]))
    "}}}

    " Clojure {{{3
        Plug 'tpope/vim-fireplace', Cond(Mode(['coder',]) && Mode(['clojure',]), { 'for': 'clojure' })
    "}}}

    " Database {{{3
        Plug 'tpope/vim-dadbod', Cond(Mode(['coder',]) && Mode(['database',]))       | " :DB mongodb:///test < big_query.js
    "}}}

    " Golang {{{3
        Plug 'fatih/vim-go', Cond(Mode(['coder',]) && Mode(['golang',]))
        Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    "}}}

    " Tcl {{{3
        "Plug 'LStinson/TclShell-Vim', Cond(Mode(['coder',]) && Mode(['tcl',]))
        "Plug 'vim-scripts/tcl.vim', Cond(Mode(['coder',]) && Mode(['tcl',]))
    "}}}

    " Haskell {{{3
        Plug 'lukerandall/haskellmode-vim', Cond(Mode(['coder',]) && Mode(['haskell',]))
        Plug 'eagletmt/ghcmod-vim', Cond(Mode(['coder',]) && Mode(['haskell',]))
        Plug 'ujihisa/neco-ghc', Cond(Mode(['coder',]) && Mode(['haskell',]))
        Plug 'neovimhaskell/haskell-vim', Cond(Mode(['coder',]) && Mode(['haskell',]))
    "}}}

    " Rust {{{3
        Plug 'racer-rust/vim-racer', Cond(Mode(['coder',]) && Mode(['rust',]))
        Plug 'rust-lang/rust.vim', Cond(Mode(['coder',]) && Mode(['rust',]))
    "}}}

    Plug 'vim-scripts/iptables', Cond(Mode(['admin',]))
    "Plug 'jceb/vim-orgmode', Cond(Mode(['editor',]) && Mode(['note',]))
    "Plug 'tpope/vim-speeddating', Cond(Mode(['editor',]) && Mode(['note',]))
    Plug 'tpope/vim-commentary', Cond(Mode(['editor',]))

    " Session management
    Plug 'thaerkh/vim-workspace', Cond(Mode(['editor',]))
        "Plug 'xolox/vim-session'
        "Plug 'vim-ctrlspace/vim-ctrlspace', Cond(Mode(['editor',]))    | "[Bad performance], confuse
        "Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession' | "[Conflict: cause 'vi -t tag' fail]

"}}}

" Facade {{{2
    Plug 'Raimondi/delimitMate'
    Plug 'millermedeiros/vim-statline'
    Plug 'huawenyu/vim-linux-coding-style'
    "Plug 'MattesGroeger/vim-bookmarks'
    "Plug 'hecal3/vim-leader-guide'
    "Plug 'megaannum/self'
    "Plug 'megaannum/forms'
    "Plug 'mhinz/vim-startify'
    "Plug 'pi314/ime.vim'    | " Chinese input in vim
"}}}

" Syntax/Language {{{2
    Plug 'vim-syntastic/syntastic', Cond(Mode(['editor',]))
    Plug 'Chiel92/vim-autoformat', Cond(Mode(['coder',]))
    Plug 'justinmk/vim-syntax-extra', Cond(Mode(['coder',]) && Mode(['vimscript',]))
    "Plug 'justinmk/vim-dirvish', Cond(Mode(['editor',]))   | " ?
    "Plug 'kovisoft/slimv', Cond(Mode(['editor',]))
    "Plug 'AnsiEsc.vim', Cond(Mode(['editor',]))
    Plug 'powerman/vim-plugin-AnsiEsc', Cond(Mode(['editor',]))
    "Plug 'huawenyu/robotframework-vim', Cond(Mode(['QA',]))
    "Plug 'bpstahlman/txtfmt', Cond(Mode(['editor',]))
    "Plug 'dhruvasagar/vim-table-mode', Cond(Mode(['editor',]))
    Plug 'tmux-plugins/vim-tmux', Cond(Mode(['editor',]))  | " The syntax of .tmux.conf

    Plug 'vim-scripts/awk.vim', Cond(Mode(['admin',]) && Mode(['script',]))
    "Plug 'WolfgangMehner/vim-support', Cond(Mode(['admin',]) && Mode(['vimscript',]))   | " The syntax of vimscript, but too many keymap
    "Plug 'WolfgangMehner/awk-support', Cond(Mode(['admin',]) && Mode(['script',]))

    "
    " http://www.thegeekstuff.com/2009/02/make-vim-as-your-bash-ide-using-bash-support-plugin/
    " Must config to avoid annoy popup message:
    "   $ cat ~/.vim/templates/bash.templates
    "       SetMacro( 'AUTHOR',      'name' )
    "       SetMacro( 'AUTHORREF',   'name' )
    "       SetMacro( 'EMAIL',       'name@mail.com' )
    "       SetMacro( 'COPYRIGHT',   'Copyright (c) |YEAR|, |AUTHOR|' )
    "Plug 'WolfgangMehner/bash-support', Cond(Mode(['admin',]) && Mode(['script',]))
    "Plug 'vim-scripts/DirDiff.vim', Cond(Mode(['editor',]))
    Plug 'rickhowe/diffchar.vim', Cond(Mode(['editor',]))
    Plug 'chrisbra/vim-diff-enhanced', Cond(Mode(['editor',]))
    Plug 'huawenyu/vim-log-syntax', Cond(Mode(['editor',]))
    Plug 'Shougo/vinarise.vim', Cond(Mode(['editor',])) | " Hex viewer
    "Plug 'prettier/vim-prettier', Cond(Mode(['editor',]), { 'do': 'yarn install' })  | " brew install prettier
"}}}

" Vimwiki {{{2
    "Plug 'tomtom/vikibase_vim', Cond(Mode(['editor',]))
    "Plug 'tpope/vim-markdown', Cond(Mode(['editor',]))     | " Look no pretty code-fence
    Plug 'plasticboy/vim-markdown', Cond(Mode(['editor',]))
        Plug 'godlygeek/tabular', Cond(Mode(['editor',]))   | "[Look like 'vim-easy-align' is better and more powerful]
    Plug 'vimwiki/vimwiki', Cond(Mode(['editor',]), { 'branch': 'dev' })  | " Another choice is [Gollum](https://github.com/gollum/gollum)
    Plug 'mattn/calendar-vim', Cond(Mode(['editor',])) | " :Calendar

    "Plug 'freitass/todo.txt-vim', Cond(Mode(['editor',]))     | " Like todo.txt-cli command-line, but here really needed is the wrap of Todo.txt-cli.
    "Plug 'elentok/todo.vim', Cond(Mode(['editor',]))
    "
    " Require vimwiki, tasklib, [taskwarrior](https://taskwarrior.org/download/)
    " taskwarrior: a command line task management tool, config by ~/.taskrc
    "Plug 'blindFS/vim-taskwarrior', Cond(executable('task') && Mode(['editor',]))

    " Prerequirement: brew install task; sudo pip3 install tasklib; ln -s ~/.task, ~/.taskrc;
    Plug 'tbabej/taskwiki', Cond(executable('task') && Mode(['editor',]))  | " Only handles *.wiki file contain check lists which beginwith asterisk '*'
    Plug 'huawenyu/vim-notes', Cond(Mode(['editor',])) | Plug 'xolox/vim-misc', Cond(Mode(['editor',]))    | " Use as our plugins help
    Plug 'pbrisbin/vim-mkdir', Cond(Mode(['editor',]))
"}}}

" Improve {{{2
    "Plug 'liuchengxu/vim-which-key', Cond(Mode(['editor',]))   | " Cannot work
    "Plug 'lambdalisue/lista.nvim', Cond(Mode(['editor',]))     | " Cannot work
    "Plug 'markonm/traces.vim', Cond(Mode(['editor',]))         | " Range, pattern and substitute preview for Vim [Just worry about performance]

    "Plug 'derekwyatt/vim-fswitch', Cond(Mode(['editor',]))
    Plug 'kopischke/vim-fetch', Cond(Mode(['editor',]))
    Plug 'terryma/vim-expand-region', Cond(Mode(['editor',]))   | "   W - select region expand; B - shrink

    Plug 'tpope/vim-surround', Cond(Mode(['editor',]))          | " ds - remove surround; cs - change surround; After Selected, S} - surround the selected; yss - surround the whole line; ysiw' - surround the current word;
    Plug 'tpope/vim-rsi', Cond(Mode(['admin',]))               | " Readline shortcut for vim

    "Plug 'nathanaelkane/vim-indent-guides', Cond(Mode(['editor',]) && Mode(['advance',])) | "[Color issue]
    "Plug 'huawenyu/vim-indentwise', Cond(Mode(['editor',]))    | " Automatic set indent, shiftwidth, expandtab
    Plug 'ciaranm/detectindent', Cond(Mode(['editor',]))
    "Plug 'tpope/vim-sleuth', Cond(Mode(['editor',]))

    "Plug 'szw/vim-maximizer', Cond(Mode(['editor',]))
    Plug 'ervandew/maximize', Cond(Mode(['editor',]))
    Plug 'huawenyu/vim-mark', Cond(Mode(['editor',]))
    "Plug 'tomtom/tmarks_vim', Cond(Mode(['editor',]))
    "Plug 'tomtom/quickfixsigns_vim', Cond(Mode(['editor',]))
    "Plug 'tomtom/vimform_vim', Cond(Mode(['editor',]))
    "Plug 'jceb/vim-editqf', Cond(Mode(['editor',]))            | " when review source
    "Plug 'huawenyu/highlight.vim', Cond(Mode(['editor',]))
    Plug 'huawenyu/vim-signature', Cond(Mode(['editor',]))      | " place, toggle and display marks
    Plug 'romainl/vim-qf', Cond(Mode(['editor',]))              | " Tame the quickfix window

    " Gen menu
    "Plug 'Timoses/vim-venu', Cond(Mode(['editor',]))            | " :VenuPrint, customize menu from command-line
    Plug 'skywind3000/quickmenu.vim', Cond(Mode(['editor',]))   | " customize menu from size pane

    " File/Explore {{{3
        " Plugin 'defx'
        if has('nvim')
            Plug 'Shougo/defx.nvim', Cond(Mode(['editor',]), { 'do': ':UpdateRemotePlugins' })
        else
            Plug 'Shougo/defx.nvim', Cond(Mode(['editor',]))
            Plug 'roxma/nvim-yarp', Cond(Mode(['editor',]))
            Plug 'roxma/vim-hug-neovim-rpc', Cond(Mode(['editor',]))
        endif
        Plug 'kristijanhusak/defx-git', Cond(Mode(['editor',]))
        Plug 'kristijanhusak/defx-icons', Cond(Mode(['editor',]))

    " }}}

    " Motion {{{3
        "Plug 'justinmk/vim-sneak', Cond(Mode(['editor',]))    | " s + prefix-2-char to choose the words
        Plug 'easymotion/vim-easymotion', Cond(Mode(['editor',]))
        Plug 'tpope/vim-abolish', Cond(Mode(['editor',]))      | " :Subvert/child{,ren}/adult{,s}/g
        " gA                   shows the four representations of the number under the cursor.
        " crd, crx, cro, crb   convert the number under the cursor to decimal, hex, octal, binary, respectively.
        Plug 'tpope/vim-repeat', Cond(Mode(['editor',])) | Plug 'glts/vim-radical', Cond(Mode(['editor',])) |  Plug 'glts/vim-magnum', Cond(Mode(['editor',]))
        "Plug 'vim-utils/vim-vertical-move', Cond(Mode(['editor',]))
        "Plug 'rhysd/accelerated-jk', Cond(Mode(['editor',]))   | " Cause h/j cannot move If sometimes not load the plug
        "Plug 'unblevable/quick-scope', Cond(Mode(['editor',]))
        "Plug 'dbakker/vim-paragraph-motion', Cond(Mode(['editor',])) | " treat whitespace only lines as paragraph breaks so { and } will jump to them
        "Plug 'vim-scripts/Improved-paragraph-motion', Cond(Mode(['editor',]))
        Plug 'christoomey/vim-tmux-navigator', Cond(Mode(['editor',]))
        Plug 'rhysd/clever-f.vim', Cond(Mode(['editor',]))

        Plug 'huawenyu/vim-motion', Cond(Mode(['editor',]))  | " Jump according indent
    "}}}

    " Search {{{3
        Plug 'mhinz/vim-grepper', Cond(Mode(['editor',]))    | " :Grepper text

        " [Create float-windows](https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html)
        Plug 'junegunn/fzf', Cond(Mode(['editor',]) && Mode(['advance',]), { 'dir': '~/.fzf', 'do': './install --all' })
        Plug 'junegunn/fzf.vim', Cond(Mode(['editor',]) && Mode(['advance',]) && CheckPlug('fzf', 1))
        Plug 'huawenyu/fzf-cscope.vim', Cond(Mode(['coder',]) && Mode(['advance',]))

        "Plug 'huawenyu/neovim-fuzzy', Cond(has('nvim') && Mode(['editor',]))
        "Plug 'Dkendal/fzy-vim', Cond(Mode(['editor',]))

        " http://blog.owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before
        "Plug 'ctrlpvim/ctrlp.vim', Cond(Mode(['editor',]) && Mode(['todo',]))
            "Plug 'nixprime/cpsm', Cond(Mode(['editor',]), {'do': 'env PY3=ON ./install.sh'})
            "Plug 'ryanoasis/vim-devicons', Cond(Mode(['editor',]) && Mode(['morecool',]))
    "}}}

    " Async {{{3
        "Plug 'tpope/vim-dispatch', Cond(Mode(['admin',]))
        "Plug 'huawenyu/vim-dispatch', Cond(Mode(['admin',]))        | " Run every thing. :Dispatch :Make :Start man 3 printf
        "Plug 'radenling/vim-dispatch-neovim', Cond(has('nvim') && Mode(['admin',]))
        Plug 'Shougo/vimproc.vim', Cond(Mode(['admin',]), {'do' : 'make'})
        Plug 'skywind3000/asyncrun.vim', Cond(Mode(['admin',]))
        Plug 'huawenyu/neomake', Cond(has('nvim') && Mode(['coder',]))
        "Plug 'neomake/neomake', Cond(has('nvim') && Mode(['coder',]))
    "}}}

    " View/Outline {{{3
        Plug 'scrooloose/nerdtree', Cond(Mode(['editor',]), { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] })   | " :NERDTreeToggle; <Enter> open-file; '?' Help
        Plug 'scrooloose/nerdcommenter', Cond(Mode(['editor',]), { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] })
        Plug 'Xuyuanp/nerdtree-git-plugin', Cond(Mode(['editor',]), { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] })
        Plug 'jistr/vim-nerdtree-tabs', Cond(Mode(['editor',]), { 'on':  'NERDTreeTabsToggle' })   | " :NERDTreeTabsToggle, Just one NERDTree, always and ever. It will always look the same in all tabs, including expanded/collapsed nodes, scroll position etc.
        Plug 'kien/tabman.vim', Cond(Mode(['editor',]))        | " Tab management for Vim
        Plug 'jeetsukumaran/vim-buffergator', Cond(Mode(['editor',]))
        Plug 'huawenyu/vim-rooter', Cond(Mode(['editor',]))  | " Get or change current dir

        "Plug 'tpope/vim-vinegar', Cond(Mode(['editor',]))   | " '-' open explore
        Plug 'huawenyu/VOoM', Cond(Mode(['editor',]))        | " VOom support +python3, :Voomhelp, yy Copy node(s). dd Cut node(s). pp Paste node(s) after the current node or fold.
                                      " <Space>            Expand/contract the current node
                                      " ^^, __, <<, >>     Move up/down, left, right the select nodes
        Plug 'vim-voom/VOoM_extras', Cond(Mode(['editor',]))
        " Why search tags from the current file path:
        "   consider in new-dir open old-dir's file, bang!
        "Plug 'huawenyu/vim-autotag', Cond(Mode(['coder',])) | " First should exist tagfile which tell autotag auto-refresh: ctags -f .tags -R .
        Plug 'vim-scripts/taglist.vim', Cond(Mode(['coder',]))
        Plug 'majutsushi/tagbar', Cond(Mode(['coder',]))
        "Plug 'tomtom/ttags_vim', Cond(Mode(['coder',]))
    "}}}

    " Tools {{{3
        Plug 'tpope/vim-eunuch', Cond(Mode(['admin',]))  | " Support unix shell cmd: Delete,Unlink,Move,Rename,Chmod,Mkdir,Cfind,Clocate,Lfind,Wall,SudoWrite,SudoEdit
        Plug 'tpope/vim-dotenv', Cond(Mode(['admin',]))  | " Basic support for .env and Procfile
        Plug 'kassio/neoterm', Cond(Mode(['admin',]) && has('nvim'))        | " a terminal for neovim; :T ls, # exit terminal mode by <c-\\><c-n>

        "Plug 'webdevel/tabulous', Cond(Mode(['editor',]))
        Plug 'gcmt/taboo.vim', Cond(Mode(['editor',]))

        Plug 'vim-scripts/DrawIt', Cond(Mode(['editor',]))                       | " \di \ds: start/stop;  draw by direction-key
        Plug 'reedes/vim-pencil', Cond(Mode(['editor',]))
        Plug 'chrisbra/NrrwRgn', Cond(Mode(['editor',]))                         | " focus on a selected region. <leader>nr :NR - Open selected into new window; :w - (in the new window) write the changes back
        Plug 'stefandtw/quickfix-reflector.vim', Cond(Mode(['editor',]))
        Plug 'junegunn/vim-easy-align', Cond(Mode(['editor',]))                  | " tablize selected and ga=
        Plug 'junegunn/goyo.vim', Cond(Mode(['editor',]))                        | " :Goyo 80
        "Plug 'junegunn/limelight.vim', Cond(Mode(['editor',]))                  | " Unsupport colorscheme
        Plug 'jamessan/vim-gnupg', Cond(Mode(['admin',]))                        | " implements transparent editing of gpg encrypted files.

        Plug 'FooSoft/vim-argwrap', Cond(Mode(['coder',]))
        Plug 'sk1418/blockit', Cond(Mode(['editor',]))                           | " :Block -- Draw a Box around text region
    "}}}
"}}}

" Integration {{{2
    Plug 'huawenyu/new.vim', Cond(Mode(['coder',]) && has('nvim')) | Plug 'huawenyu/new-gdb.vim', Cond(Mode(['coder',]) && has('nvim'))  | " New GUI gdb-frontend
    "Plug 'huawenyu/neogdb.vim', Cond(Mode(['coder',]) && has('nvim'))
    "Plug 'huawenyu/neogdb2.vim', Cond(Mode(['coder',]) && has('nvim')) | Plug 'kassio/neoterm', Cond(Mode(['editor',]) && has('nvim')) | Plug 'paroxayte/vwm.vim', Cond(Mode(['editor',]) && has('nvim'))
    "Plug 'cpiger/NeoDebug', Cond(Mode(['coder',]) && has('nvim'), {'on': 'NeoDebug'})
    "Plug 'idanarye/vim-vebugger', Cond(Mode(['coder',]))
    "Plug 'LucHermitte/lh-vim-lib', Cond(Mode(['admin',]))
    " NVIM_LISTEN_ADDRESS=/tmp/nvim.gdb vi

    Plug 'rhysd/conflict-marker.vim', Cond(Mode(['coder',]))            | " [x and ]x jump conflict, `ct` for themselves, `co` for ourselves, `cn` for none and `cb` for both.
    Plug 'ericcurtin/CurtineIncSw.vim', Cond(Mode(['coder',]))          | " Toggle source/header
    Plug 'junkblocker/patchreview-vim', Cond(Mode(['coder',]))          | " :PatchReview some.patch
    "Plug 'cohama/agit.vim', Cond(Mode(['editor',]))    | " :Agit show git log like gitk
    "Plug 'codeindulgence/vim-tig', Cond(Mode(['editor',])) | " Using tig in neovim
    Plug 'iberianpig/tig-explorer.vim', Cond(Mode(['editor',])) | Plug 'rbgrouleff/bclose.vim', Cond(Mode(['editor',]))        | " tig for vim (https://github.com/jonas/tig): should install tig first.
    Plug 'tpope/vim-fugitive', Cond(Mode(['editor',]))   | " Gdiff, Gblame, or from shell 'git dt' to code view
        Plug 'junegunn/gv.vim', Cond(Mode(['editor',]))  | " Awesome git wrapper

    "Plug 'juneedahamed/svnj.vim', Cond(Mode(['editor',]))
    "Plug 'juneedahamed/vc.vim', Cond(Mode(['editor',]))        | " Bad performance: Support git, svn, ...
    "Plug 'vim-scripts/vcscommand.vim', Cond(Mode(['editor',])) | " Bad performance: CVS, SVN, SVK, git, bzr, and hg within VIM
    "Plug 'sjl/gundo.vim', Cond(Mode(['editor',]))              | " Looks no use
    Plug 'mattn/webapi-vim', Cond(Mode(['editor',]))            | " Looks no use
    Plug 'mattn/gist-vim', Cond(Mode(['editor',]))              | " :'<,'>Gist -e 'list-sample'

    " share copy/paste between vim(""p)/tmux
    "Plug 'svermeulen/vim-easyclip', Cond(Mode(['editor',]))  | " change to vim-yoink, similiar: nvim-miniyank, YankRing.vim, vim-yankstack
    "Plug 'bfredl/nvim-miniyank', Cond(Mode(['editor',]))
    "Plug 'svermeulen/vim-yoink', Cond(Mode(['editor',]) && has('nvim')) | " sometimes delete not copyinto paste's buffer
    Plug 'huawenyu/vimux-script', Cond(Mode(['admin',]) && has('nvim'))
    "Plug 'huawenyu/vim-tmux-runner', Cond(Mode(['admin',]) && has('nvim'))
    Plug 'huawenyu/vim-tmux-runner', Cond(Mode(['admin',]) && has('nvim'), { 'on':  ['VtrLoad', 'VtrSendCommandToRunner', 'VtrSendLinesToRunner', 'VtrSendFile', 'VtrOpenRunner'] })   | " Send command to tmux's marked pane
    Plug 'yuratomo/w3m.vim', Cond(executable('w3m') && Mode(['admin',]) && Mode(['tool',]))
    Plug 'szw/vim-dict', Cond(Mode(['editor',]) && Mode(['tool',]))
    Plug 'szw/vim-g', Cond(Mode(['editor',]) && Mode(['tool',]))
    "Plug 'google/vim-searchindex', Cond(Mode(['editor',]) && Mode(['tool',]))
    Plug 'ianva/vim-youdao-translater', Cond(Mode(['editor',]) && Mode(['tool',]))  | " Youdao dictionay
"}}}

" AutoComplete {{{2
    "Plug 'ervandew/supertab', Cond(Mode(['editor',]))
    "Plug 'Shougo/denite.nvim', Cond(Mode(['editor',]))
    "Plug 'ycm-core/YouCompleteMe', Cond(Mode(['editor',]))

    Plug 'Shougo/deoplete.nvim', Cond(Mode(['editor',]) && has('nvim'))         | "{ 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet.vim', Cond(Mode(['editor',]) && has('nvim'))        | " c-k apply code, c-n next, c-p previous, :NeoSnippetEdit
    Plug 'Shougo/neosnippet-snippets', Cond(Mode(['editor',]) && has('nvim'))
    Plug 'huawenyu/vim-snippets.local', Cond(Mode(['editor',]) && has('nvim'))

    "Plug 'ncm2/ncm2', Cond(Mode(['editor',]) && has('nvim'))                   | " Compare to deoplete, it's slower
    "Plug 'SirVer/ultisnips', Cond(Mode(['editor',]) && has('nvim'))
    Plug 'honza/vim-snippets', Cond(Mode(['editor',]) && has('nvim'))

    Plug 'reedes/vim-wordy', Cond(Mode(['editor',]) && has('nvim'))
    "Plug 'vim-scripts/CmdlineComplete', Cond(Mode(['admin',]) && has('nvim'))
"}}}

" Text Objects {{{2, https://github.com/kana/vim-textobj-user/wiki
    " vimwiki                               vah
    Plug 'wellle/targets.vim', Cond(Mode(['editor',]))           | " Support build-in obj number-repeat/`n`ext/`l`ast: quota `,`, comma `,`, `(` as n

    Plug 'kana/vim-textobj-user', Cond(Mode(['editor',]))
    "Plug 'kana/vim-repeat', Cond(Mode(['editor',]))

    Plug 'kana/vim-textobj-indent', Cond(Mode(['editor',]))      | " vai, vaI
    Plug 'kana/vim-textobj-entire', Cond(Mode(['editor',]))      | " vae, Select entire buffer

    Plug 'kana/vim-textobj-function', Cond(Mode(['coder',]))    | " vaf, Support: c, java, vimscript
    " Plug 'machakann/vim-textobj-functioncall', Cond(Mode(['coder',]))

    Plug 'mattn/vim-textobj-url', Cond(Mode(['editor',]))        | " vau
    Plug 'kana/vim-textobj-diff', Cond(Mode(['coder',]))        | " vdh, hunk;  vdH, file;  vdf, file
    " Plug 'thalesmello/vim-textobj-methodcall', Cond(Mode(['coder',]))
    " Plug 'adriaanzon/vim-textobj-matchit', Cond(Mode(['editor',]))
    Plug 'glts/vim-textobj-comment', Cond(Mode(['coder',]))     | " vac, vic
    Plug 'glts/vim-textobj-indblock', Cond(Mode(['editor',]))    | " vao, Select a block of indentation whitespace before ascii
    Plug 'thinca/vim-textobj-between', Cond(Mode(['editor',]))   | " vaf
    Plug 'Julian/vim-textobj-brace', Cond(Mode(['editor',]))     | " vaj
    Plug 'whatyouhide/vim-textobj-xmlattr', Cond(Mode(['coder',]))  | " vax
"}}}

" ThirdpartLibrary {{{2
    "Plug 'vim-jp/vital.vim'
    "Plug 'google/vim-maktaba'
    Plug 'tomtom/tlib_vim', Cond(Mode(['coder',]) && Mode(['vimscript',]))
"}}}

" Debug {{{2
    " Execute eval script: using singlecompile
    "Plug 'thinca/vim-quickrun', Cond(Mode(['admin',]))                      | " :QuickRun
    "Plug 'fboender/bexec', Cond(Mode(['admin',]))                           | " :Bexec
    Plug 'huawenyu/SingleCompile', Cond(Mode(['admin',]))                     | " :SingleCompile, SingleCompileRun
    Plug 'amiorin/vim-eval', Cond(Mode(['coder',]) && Mode(['vimscript',]))
    Plug 'mhinz/vim-lookup', Cond(Mode(['coder',]) && Mode(['vimscript',]))

    Plug 'gu-fan/doctest.vim', Cond(Mode(['admin',]))     | " doctest for language vimscript, :DocTest
    Plug 'tpope/vim-scriptease', Cond(Mode(['admin',]))   | " A Vim plugin for Vim plugins
        "Plug 'thinca/vim-ref', Cond(Mode(['editor',]) && Mode(['tool',]))   |"[Not good] Man with 'K', should after vim-scriptease to override 'K' map
    Plug 'huawenyu/vimlogger', Cond(Mode(['admin',]))
    "Plug 'vim-scripts/TailMinusF', Cond(Mode(['admin',])) | " Too slow, :Tail <file>
    Plug 'junegunn/vader.vim', Cond(Mode(['coder',]) && Mode(['vimscript',]))     | " A simple Vimscript test framework
    "Plug 'tyru/restart.vim', Cond(Mode(['editor',]))       | " Not work under terminal
    "Plug 'huawenyu/Decho', Cond(Mode(['coder',]) && Mode(['vimscript',]))
    "Plug 'c9s/vim-dev-plugin', Cond(Mode(['coder',]) && Mode(['vimscript',]))   | " gf: goto-function-define, but when edit vimrc will trigger error
"}}}

call plug#end()


if g:vim_confi_option.debug
    silent! call logger#init('ALL', ['/dev/stdout', '/tmp/vim.log'])
endif


if filereadable(expand("~/.vimrc.after"))
    source ~/.vimrc.after
endif

