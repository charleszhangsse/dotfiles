"***************************************************************************************
" Hi, the <leader> is <space> and , :)
"
"    let mapleader = ","
"    nmap <space> <leader>
"
" =============================================================
"@mode: ['all', 'basic', 'theme', 'myself',
"      \   'editor', 'admin', 'QA', 'coder',
"      \
"      \   'vimscript', 'c', 'python', 'latex', 'perl', 'javascript', 'clojure', 'database',
"      \   'golang', 'tcl', 'haskell', 'rust',
"      \   'note', 'script',
"      \]
"
"  Sample:
"     'mode': ['all', ],
"     'mode': ['basic', 'theme', 'myself', 'editor', ],
"     'mode': ['basic', 'theme', 'myself', 'editor', ],
let g:vim_layout_load = {
      \ 'mode': ['all', ],
      \ 'theme': 1,
      \ 'conf': 1,
      \}
" =============================================================

" Doc {{{1
"   Install neovim {{{2
"   -------------------
"   [doc]("https://github.com/neovim/neovim/wiki/Installing-Neovim)
"
"   Using Plugin-Manage {{{2
"   ------------------------
"   [code](https://github.com/junegunn/vim-plug)
"
"   :help nvim-from-vim
"      $ mkdir ~/.vim
"      $ mkdir ~/.config
"      $ ln -s ~/.vim ~/.config/nvim
"      $ ln -s ~/.vimrc ~/.config/nvim/init.vim
"
"      ### Make **neovim** work with plugs
"      $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"      ### Make **vim** work with plugs
"      $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"      $ vi .vimrc
"        :PlugInstall
"        :checkhealth   ### check deplete's health
"
"            ### After pip install neovim, keep health warning, maybe we're using brew's python.
"            ### Please remove brew's python first:
"            $ brew list python
"            $ brew unlink python@2
"            $ brew unlink python@3
"            $ sudo apt install python-pip
"            $ sudo apt install python3-pip
"
"            $ sudo pip2 install neovim
"            $ sudo pip3 install neovim
"            $ sudo pip2 install --upgrade neovim
"            $ sudo pip3 install --upgrade neovim
"
"   Documentation {{{2
"   -------------------
"   [vimscript-functions](https://devhints.io/vimscript-functions)
"   [vim regex](http://vimregex.com/)
"   [Writing Plugin](http://stevelosh.com/blog/2011/09/writing-vim-plugins/)
"   [Scripting the Vim editor](https://www.ibm.com/developerworks/library/l-vim-script-4/index.html)
"
"   Usage {{{2
"   ----------
"   - 'K' on c-function         ' open man document
"   - :man key-word             ' Open man document of `find`
"   - Vselect then 'g Ctrl-G'   ' Show the number of lines, words and bytes selected.
"   - gn                        ' re-select the next match.
"   - gv                        ' re-select the last match.
"   - search/replace:
"   -     :%s///gc              ' replace occurrences of the last search pattern with confirmation
"   -     :%s/pattern//gn       ' count the number of occurrences of a word
"   -     :%s/\n\{3,}/\r\r/e    ' replace three or more consecutive line endings with two line endings (a single blank line)
"   -     :g/^$/d               ' delete blank lines, remove multi blank line
"   -     :%s/\s\+$//g          ' remove the tail spaces
"   -     :%s/\s\+$//e          ' remove unwanted whitespace from line end
"   -     :%s/^\s\+//e          '   remove from begin
"   -     :%s/^M//g             ' remove windows's CTRL-M characters: type CTRL-V, then CTRL-M
"   -     :s/x/X/g 5            ' substitute 'x' by 'X' in the current line and four following lines
"   -     :23d 4                ' delete lines 23, 24, 25 and 26
"
"   - :VoomToggle markdown      ' outline as markdown
"   - :VoomToggle markdown      ' outline as markdown
"   - <l>ec                     ' eval viml selected
"   - folding:
"   -     'zc' (close), 'zo' (open), and 'za' (toggle) operate on one level of folding
"   -     'zC',  'zO' and 'zA' are similar, but operate on all folding levels
"   -     'zr' reduces folding by one more level of folds, 'zR' to open all folds.
"   -     'zm' gives more folding by closing one more level, 'zM' to close all folds.
"   - Search:
"         /patt1\|patt2
"         /some_\(hold\|put\), <or>  /\vsome(hold|put)
"   Filetype:
"       :setfiletype <Ctrl-D>   ' list all available syntax
"       :setfiletype ip<Tab>    ' Search the syntax begin with `ip`
"   Plug:
"       vip             select the same indent block
"       a+p/n           jump next/prev same indent line
"   Runtime:
"       :set all              ' Check all options values
"       :set filetype?        ' Check this option value
"   Motions, Operators, and Text Objects: Operator-pending mode
"       Ref:  http://codyveal.com/posts/vim-killer-features-part-1-text-objects/
"             https://www.tandrewnichols.me/motions-operators-text-objects-introduction/
"       {operator}[{motion}]{*wise-specifier}
"     -Operators:  :h operator
"       - d:   delete
"       - v:   select
"       - c:   change
"       - y:   yank
"       - >:   indent
"       - <:   outdent
"       - =:   fix indenting
"     -motions:
"       - f/F:  forward/backward find and stop on the char
"       - t/T:  forward/backward find and stop before the char
"       - /:    search ?
"     -wise specifier:
"       - characterwise: vjjjj
"       - wordwise:      vwwww  <or> veee
"       - linewise:      Vjjjjj
"       - blockwise:     <C-v>hhjjjj
"       - Objectwise:  Built-in Text obj, or customize added obj base on Plug 'kana/vim-textobj-user'
"           All text objects come in two forms
"             - a    around, normal(prefixed by 'a')
"             - i    innner, inner (prefixed by 'i')
"
"           Built-in Text Objects:
"             - w       Word by punctuation
"             - W       Word by whitespace
"             - s       Sentence
"             - p       Paragraph
"             - ',`     Quotes
"             - (,),b   Parentheses
"             - [,]     Brackets
"             - {,},B   Braces
"             - <,>     Angle Brackets
"             - t       Tags (e.g. <html>inner</html>)
"
"   Command line move:
"       ctrl-c          quit command mode
"       ctrl-r          paste from vim register
"       ctrl-d          command-line completion
"       ctrl-b          move to the begin
"       ctrl-e          move to the end
"       ctrl-h          delete one letter
"       ctrl-u          delete to begin
"       ctrl-w          delete one word
"
"   Maps check:
"      :verbose map <C-j>          check who map this
"      :map <some-keys> check the map valid or not
"      howto map Shift+F#:
"        - Goto insert mode and hit Ctrl-V Shift-F#, which gotted we can use that to map.
"        - For example: We get "<F15>" when input Shift+F5, so ':nmap <F15> echo "HELLO"<cr>' should be work.
"
"   Registers:
"       \"ry            add the selected text to the register r.
"       \"rp            paste the content of this register r.
"       Ctrl-r r        access the registers in insert/command mode with Ctrl-r + register name.
"   Terminal-mode:
"       - enter terminal mode   i
"       - exit terminal mode    <C-\><C-n>
"       - :help terminal-emulator
"   howto:
"       :bufdo e                ' reload all buffers at once
"       :setfiletype ip<Tab>    ' Search the syntax begin with `ip`
"
" }}}
"***************************************************************************************

" Helper {{{1
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
        if index(g:vim_layout_load.mode, 'all') >= 0
            return 1
        endif
        return HasIntersect(a:mode, g:vim_layout_load.mode)
    endfunction

    " @Note only work with 'vim-plug'
    " @param type  0, Enable the plug
    "              1, Runtime Loaded/Active the plug
    function! CheckPlug(name, type)
        if (exists("g:plugs") && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir))
            if a:type == 1
                return stridx(&rtp, g:plugs[a:name].dir) >= 0
            endif
            return 1
        endif
        return 0
    endfunction

    function! GetPlugDir(name)
      if (exists("g:plugs") && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir))
          return g:plugs[a:name].dir
      endif
      return ''
    endfunction
" }}}

" VimL Debug{{{1

  set verbose=0
  "set verbose=8
  "set verbosefile=/tmp/vim.log
  set shell=/bin/sh

  let g:decho_enable = 0
  let g:bg_color = 233 | " current background's color value, used by mylog.syntax

  "=====================================================================
  "   " in .vimrc
  "       silent! call logger#init('ALL', ['/dev/stdout', '/tmp/vim.log'])
  "
  "   " At begin of every our vimscript file
  "       silent! let s:log = logger#getLogger(expand('<sfile>:t'))
  "   " Or guard avoid multi-load
  "       if !exists("s:init")
  "           let s:init = 1
  "           silent! let s:log = logger#getLogger(expand('<sfile>:t'))
  "       endif
  "     "
  "
  "   " Use it
  "       silent! call s:log.info('hello world')
  "
  "   " Support current function-name like C's __FUNCTION__
  "       function! ourfile#foobar()
  "           let l:__func__ = substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
  "           silent! call s:log.info(l:__func__, " args=", string(g:gdb.args))
  "       endfunction
  "
  "   " Check log
  "       $ tail -f /tmp/vim.log
  "=====================================================================


  " Old echo type, abandon
  function! Decho(...)
      return
  endfunction
" }}}

if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
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
endif

" Auto download the plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins {{{1}}}
call plug#begin('~/.vim/bundle')

" Plug setup: Basic-config/Plugs-customize, order-sensible {{{2
    Plug 'tpope/vim-sensible', Cond(Mode(['basic',]))
    Plug 'huawenyu/vim-basic', Cond(Mode(['basic',]))
    Plug 'huawenyu/vim-myself.before', Cond(Mode(['basic', 'myself']))  | " config the plugs
"}}}2

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
        "Plug 'tyru/current-func-info.vim', Cond(Mode(['coder',]) && Mode(['c',]))           | "[Too slow] Show current function name in statusline
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
        "Plug 'skywind3000/vim-preview', Cond(Mode(['coder',]))
        "Plug 'whatot/gtags-cscope.vim', Cond(Mode(['coder',]))

        "Plug 'lyuts/vim-rtags', Cond(Mode(['coder',]))         | " Bad performance
        "Plug 'w0rp/ale', Cond(Mode(['coder',]))   | " 1. Not using clang's lint, 2. find references look not work

        " Please install yarn (-- a node package manger) first.
        Plug 'neoclide/coc.nvim', Cond(Mode(['coder',]), {'do': 'yarn install --frozen-lockfile'})  | " sometimes find references fail
        "Plug 'neoclide/coc.nvim', Cond(Mode(['coder',]), {'on': ['<Plug>(coc-definition)', '<Plug>(coc-references)'], 'do': 'yarn install --frozen-lockfile'})  | " Increase stable by only load the plugin after the 1st command call.
        "Plug 'neoclide/coc-rls', Cond(Mode(['coder',]))
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
        Plug 'rust-lang/rust.vim', Cond(Mode(['coder',]) && Mode(['rust',]))
    "}}}

    Plug 'vim-scripts/iptables', Cond(Mode(['admin',]))
    Plug 'jceb/vim-orgmode', Cond(Mode(['editor',]) && Mode(['note',]))
    Plug 'tpope/vim-speeddating', Cond(Mode(['editor',]) && Mode(['note',]))

    " Session management
    "Plug 'xolox/vim-session'
    "Plug 'tpope/vim-obsession'
    Plug 'thaerkh/vim-workspace', Cond(Mode(['editor',]))

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
    "Plug 'vim-syntastic/syntastic', Cond(Mode(['coder',]))
    Plug 'Chiel92/vim-autoformat', Cond(Mode(['coder',]))
    Plug 'justinmk/vim-syntax-extra', Cond(Mode(['coder',]) && Mode(['vimscript',]))
    "Plug 'justinmk/vim-dirvish', Cond(Mode(['editor',]))   | " ?
    "Plug 'kovisoft/slimv', Cond(Mode(['editor',]))
    "Plug 'AnsiEsc.vim', Cond(Mode(['editor',]))
    Plug 'powerman/vim-plugin-AnsiEsc', Cond(Mode(['editor',]))
    "Plug 'huawenyu/robotframework-vim', Cond(Mode(['QA',]))
    "Plug 'bpstahlman/txtfmt', Cond(Mode(['editor',]))
    "Plug 'dhruvasagar/vim-table-mode', Cond(Mode(['editor',]))
    Plug 'godlygeek/tabular', Cond(Mode(['editor',]))   | " require by vim-markdown
    Plug 'plasticboy/vim-markdown', Cond(Mode(['editor',]))
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
    Plug 'vimwiki/vimwiki', Cond(Mode(['editor',]), { 'branch': 'dev' })  | " Another choice is [Gollum](https://github.com/gollum/gollum)
    "Plug 'tomtom/vikibase_vim', Cond(Mode(['editor',]))
    Plug 'mattn/calendar-vim', Cond(Mode(['editor',])) | " :Calendar

    "Plug 'freitass/todo.txt-vim', Cond(Mode(['editor',]))     | " Like todo.txt-cli command-line, but here really needed is the wrap of Todo.txt-cli.
    "Plug 'elentok/todo.vim', Cond(Mode(['editor',]))
    "
    " Require vimwiki, tasklib, [taskwarrior](https://taskwarrior.org/download/)
    " taskwarrior: a command line task management tool, config by ~/.taskrc
    "Plug 'blindFS/vim-taskwarrior', Cond(Mode(['editor',]))

    " Prerequirement: brew install task; sudo pip3 install tasklib; ln -s ~/.task, ~/.taskrc;
    Plug 'tbabej/taskwiki', Cond(Mode(['editor',]))  | " Only handles *.wiki file contain check lists which beginwith asterisk '*'
    Plug 'xolox/vim-notes', Cond(Mode(['editor',]))  | Plug 'xolox/vim-misc', Cond(Mode(['editor',]))    | " Use as our plugins help
"}}}

" Improve {{{2
    "Plug 'liuchengxu/vim-which-key', Cond(Mode(['editor',]))  | " How to use?
    "Plug 'markonm/traces.vim', Cond(Mode(['editor',]))         | " Range, pattern and substitute preview for Vim [Just worry about performance]
    "Plug 'lambdalisue/lista.nvim', Cond(Mode(['editor',]))     | " Cannot work

    "Plug 'derekwyatt/vim-fswitch', Cond(Mode(['editor',]))
    Plug 'kopischke/vim-fetch', Cond(Mode(['editor',]))
    Plug 'terryma/vim-expand-region', Cond(Mode(['editor',]))   | "   W - select region expand; B - shrink

    Plug 'tpope/vim-surround', Cond(Mode(['editor',]))          | " ds - remove surround; cs - change surround; After Selected, S} - surround the selected; yss - surround the whole line; ysiw' - surround the current word;
    Plug 'tpope/vim-rsi', Cond(Mode(['admin',]))               | " Readline shortcut for vim

    "Plug 'huawenyu/vim-indentwise', Cond(Mode(['editor',]))    | " Automatic set indent, shiftwidth, expandtab
    Plug 'ciaranm/detectindent', Cond(Mode(['editor',]))
    "Plug 'tpope/vim-sleuth', Cond(Mode(['editor',]))

    Plug 'szw/vim-maximizer', Cond(Mode(['editor',]))
    Plug 'huawenyu/vim-mark', Cond(Mode(['editor',]))
    "Plug 'tomtom/tmarks_vim', Cond(Mode(['editor',]))
    "Plug 'tomtom/quickfixsigns_vim', Cond(Mode(['editor',]))
    "Plug 'tomtom/vimform_vim', Cond(Mode(['editor',]))
    "Plug 'jceb/vim-editqf', Cond(Mode(['editor',]))            | " notes when review source
    "Plug 'huawenyu/highlight.vim', Cond(Mode(['editor',]))
    Plug 'huawenyu/vim-signature', Cond(Mode(['editor',]))      | " place, toggle and display marks
    Plug 'romainl/vim-qf', Cond(Mode(['editor',]))              | " Tame the quickfix window

    " Gen menu
    "Plug 'Timoses/vim-venu', Cond(Mode(['editor',]))            | " :VenuPrint, customize menu from command-line
    "Plug 'skywind3000/quickmenu.vim', Cond(Mode(['editor',]))   | " customize menu from size pane
    Plug 'daniel-samson/quickmenu.vim', Cond(Mode(['editor',]))

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
        "Plug 'tpope/vim-repeat', Cond(Mode(['editor',]))
        "Plug 'vim-utils/vim-vertical-move', Cond(Mode(['editor',]))
        Plug 'rhysd/accelerated-jk', Cond(Mode(['editor',]))
        "Plug 'unblevable/quick-scope', Cond(Mode(['editor',]))
        "Plug 'dbakker/vim-paragraph-motion', Cond(Mode(['editor',])) | " treat whitespace only lines as paragraph breaks so { and } will jump to them
        "Plug 'vim-scripts/Improved-paragraph-motion', Cond(Mode(['editor',]))
        Plug 'christoomey/vim-tmux-navigator', Cond(Mode(['editor',]))
        Plug 'rhysd/clever-f.vim', Cond(Mode(['editor',]))

        " gA                   shows the four representations of the number under the cursor.
        " crd, crx, cro, crb   convert the number under the cursor to decimal, hex, octal, binary, respectively.
        Plug 'glts/vim-radical', Cond(Mode(['editor',])) |  Plug 'glts/vim-magnum', Cond(Mode(['editor',]))  | Plug 'tpope/vim-repeat', Cond(Mode(['editor',]))
        Plug 'huawenyu/vim-motion', Cond(Mode(['editor',]))  | " Jump according indent
    "}}}

    " Search {{{3
        Plug 'huawenyu/neovim-fuzzy', Cond(has('nvim') && Mode(['editor',]))
        "Plug 'Dkendal/fzy-vim', Cond(Mode(['editor',]))
        Plug 'mhinz/vim-grepper', Cond(Mode(['editor',]))    | " :Grepper text
        "Plug 'kien/ctrlp.vim', Cond(Mode(['editor',]))      | " Bad performance
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
        "Plug 'mhinz/vim-signify', Cond(Mode(['editor',]))
        " Why search tags from the current file path:
        "   consider in new-dir open old-dir's file, bang!
        "Plug 'huawenyu/vim-autotag', Cond(Mode(['coder',])) | " First should exist tagfile which tell autotag auto-refresh: ctags -f .tags -R .
        Plug 'vim-scripts/taglist.vim', Cond(Mode(['coder',]))
        Plug 'majutsushi/tagbar', Cond(Mode(['coder',]))
        "Plug 'tomtom/ttags_vim', Cond(Mode(['coder',]))
    "}}}

    " Tools {{{3
        Plug 'tpope/vim-eunuch', Cond(Mode(['admin',]))  | " Support unix shell cmd: Delete,Unlink,Move,Rename,Chmod,Mkdir,Cfind,Clocate,Lfind,Wall,SudoWrite,SudoEdit
        Plug 'kassio/neoterm', Cond(Mode(['admin',]) && has('nvim'))        | " a terminal for neovim; :T ls, # exit terminal mode by <c-\\><c-n>

        "Plug 'webdevel/tabulous', Cond(Mode(['editor',]))
        Plug 'huawenyu/taboo.vim', Cond(Mode(['editor',]))

        Plug 'vim-scripts/DrawIt', Cond(Mode(['editor',]))                       | " \di \ds: start/stop;  draw by direction-key
        Plug 'reedes/vim-pencil', Cond(Mode(['editor',]))
        Plug 'chrisbra/NrrwRgn', Cond(Mode(['editor',]))                         | " focus on a selected region. <leader>nr :NR - Open selected into new window; :w - (in the new window) write the changes back
        Plug 'stefandtw/quickfix-reflector.vim', Cond(Mode(['editor',]))
        Plug 'junegunn/vim-easy-align', Cond(Mode(['editor',]))                  | " selected and ga=
        Plug 'junegunn/goyo.vim', Cond(Mode(['editor',]))                        | " :Goyo 80
        "Plug 'junegunn/limelight.vim', Cond(Mode(['editor',]))                  | " Unsupport colorscheme
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
    Plug 'tpope/vim-fugitive', Cond(Mode(['editor',])) | Plug 'junegunn/gv.vim', Cond(Mode(['editor',]))  | " Awesome git wrapper
    "Plug 'junegunn/fzf.vim', Cond(Mode(['editor',]))          | " base-on: https://github.com/junegunn/fzf, create float-windows: https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html
    "Plug 'juneedahamed/svnj.vim', Cond(Mode(['editor',]))
    Plug 'juneedahamed/vc.vim', Cond(Mode(['editor',]))        | " Support git, svn, ...
    Plug 'vim-scripts/vcscommand.vim', Cond(Mode(['editor',])) | " CVS, SVN, SVK, git, bzr, and hg within VIM
    Plug 'sjl/gundo.vim', Cond(Mode(['editor',]))
    Plug 'mattn/webapi-vim', Cond(Mode(['editor',]))
    Plug 'mattn/gist-vim', Cond(Mode(['editor',]))             | " :'<,'>Gist -e 'list-sample'

    " share copy/paste between vim(""p)/tmux
    "Plug 'svermeulen/vim-easyclip', Cond(Mode(['editor',]))  | " change to vim-yoink, similiar: nvim-miniyank, YankRing.vim, vim-yankstack
    "Plug 'bfredl/nvim-miniyank', Cond(Mode(['editor',]))
    Plug 'svermeulen/vim-yoink', Cond(Mode(['editor',]) && has('nvim')) | " sometimes delete not copyinto paste's buffer
    Plug 'huawenyu/vimux-script', Cond(Mode(['admin',]) && has('nvim'))
    "Plug 'huawenyu/vim-tmux-runner', Cond(Mode(['admin',]) && has('nvim'))
    Plug 'huawenyu/vim-tmux-runner', Cond(Mode(['admin',]) && has('nvim'), { 'on':  ['VtrLoad', 'VtrSendCommandToRunner', 'VtrSendLinesToRunner', 'VtrSendFile', 'VtrOpenRunner'] })   | " Send command to tmux's marked pane
    Plug 'yuratomo/w3m.vim', Cond(Mode(['admin',]))
    Plug 'nhooyr/neoman.vim', Cond(Mode(['admin',]) && has('nvim'))    | " :Nman printf, :Nman printf(3)
    Plug 'szw/vim-dict', Cond(Mode(['editor',]))
"}}}

" AutoComplete {{{2
    "Plug 'ervandew/supertab', Cond(Mode(['editor',]))
    "Plug 'Shougo/denite.nvim', Cond(Mode(['editor',]))
    Plug 'Shougo/deoplete.nvim', Cond(Mode(['editor',]) && has('nvim'))         | "{ 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet.vim', Cond(Mode(['editor',]) && has('nvim'))        | " c-k apply code, c-n next, c-p previous
    Plug 'Shougo/neosnippet-snippets', Cond(Mode(['editor',]) && has('nvim'))
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
    Plug 'amiorin/vim-eval', Cond(Mode(['admin',]))

    Plug 'gu-fan/doctest.vim', Cond(Mode(['admin',]))     | " doctest for language vimscript, :DocTest
    Plug 'tpope/vim-scriptease', Cond(Mode(['admin',]))   | " A Vim plugin for Vim plugins
    Plug 'huawenyu/vimlogger', Cond(Mode(['admin',]))
    "Plug 'vim-scripts/TailMinusF', Cond(Mode(['admin',])) | " Too slow, :Tail <file>
    Plug 'junegunn/vader.vim', Cond(Mode(['coder',]) && Mode(['vimscript',]))     | " A simple Vimscript test framework
    "Plug 'huawenyu/Decho', Cond(Mode(['coder',]) && Mode(['vimscript',]))
    "Plug 'c9s/vim-dev-plugin', Cond(Mode(['coder',]) && Mode(['vimscript',]))   | " gf: goto-function-define, but when edit vimrc will trigger error
"}}}


" Plug-end setup: depend on plugins, should put at the end of plugs {{{2
    Plug 'huawenyu/vim-myself.after', Cond(Mode(['basic', 'myself'])) | " Use plugs config our self IDE
"}}}2
call plug#end()


" Configure {{{1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"}}}


"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" tags {{{2

    " # Issue using tags:
    "   olddir/tags
    "   newdir/tags
    "   cd newdir; vi ../olddir/file1 and 'ptag func'		# which will open the file in olddir
    " # If using 'set cscopetag', this issue not exist.
    " But if auto-update the tags with current file, we must using tags not 'set cscopetag'.
    " And the follow one-line can fix the issue.
    set notagrelative

    " http://arjanvandergaag.nl/blog/combining-vim-and-ctags.html
    set tags=./tags,tags,./.tags,.tags;$HOME
"}}}

" Plugs Global {{{1
    " Disable all plugins's auto-maps
    "let g:no_plugin_maps = 1
"}}}

" VimL Debug{{{1
  silent! call logger#init('ALL', ['/tmp/vim.log'])
  "silent! call logger#init('ERROR', ['/tmp/vim.log'])
  silent! let s:log = logger#getLogger(expand('<sfile>:t'))

  "   " in .vimrc
  "   call logger#init('ALL', ['/dev/stdout', '~/.vim/log.txt'])
  "
  "   " in every script
  "   silent! let s:log = logger#getLogger(expand('<sfile>:t'))
  "
  "   " start logger: trace,debug,info,warn,error,fatal
  "   silent! call s:log.info('hello world')
  "   " Check log
  "   $ tail -f /tmp/vim.log
"}}}

