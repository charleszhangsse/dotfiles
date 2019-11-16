"***************************************************************************************
" Hi, the <leader> is <space> and , :)
"
"    let mapleader = ","
"    nmap <space> <leader>
"
" =============================================================
"@mode: ['all', 'basic', 'theme', 'myself',
"      \   'editor', 'admin', 'coder', 'QA',
"      \
"      \   'vimscript', 'c', 'python', 'latex', 'perl', 'javascript', 'clojure', 'database',
"      \   'golang', 'tcl', 'haskell', 'rust',
"      \   'note', 'script',
"      \]
"
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
      if index(g:vim_layout_load.mode, 'all')
          return 1
      else
          return HasIntersect(add(a:mode, 'all'), g:vim_layout_load.mode)
      endif
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

    " Indexer/Tags/cscope {{{3
        " [Tags](https://zhuanlan.zhihu.com/p/36279445)
        " [C++](https://www.zhihu.com/question/47691414/answer/373700711)
        "
        "Plug 'ludovicchabant/vim-gutentags'        | " autogen tags, bad performance
        "Plug 'skywind3000/gutentags_plus'
        "Plug 'skywind3000/vim-preview'
        "Plug 'whatot/gtags-cscope.vim'

        "Plug 'lyuts/vim-rtags'         | " Bad performance
        "Plug 'w0rp/ale'   | " 1. Not using clang's lint, 2. find references look not work

        " Please install yarn (-- a node package manger) first.
        Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}  | " sometimes find references fail
        "Plug 'neoclide/coc.nvim', {'on': ['<Plug>(coc-definition)', '<Plug>(coc-references)'], 'do': 'yarn install --frozen-lockfile'}  | " Increase stable by only load the plugin after the 1st command call.
        "Plug 'neoclide/coc-rls'
    "}}}

    " Python {{{3
        " https://github.com/neovim/python-client
        " Install https://github.com/davidhalter/jedi
        " https://github.com/zchee/deoplete-jedi
        Plug 'python-mode/python-mode', Cond(Mode(['coder',]) && Mode(['python',]))
        Plug 'davidhalter/jedi-vim', Cond(Mode(['coder',]) && Mode(['python',]))
    "}}}
    "
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
    Plug 'octol/vim-cpp-enhanced-highlight', Cond(Mode(['coder',]) && Mode(['c',]))
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
                  " <leader>t + <option>
                  "| a  annotate         | C  calendar       | Ga ghistory annual | p  projects |
                  "| bd burndown daily   | d  done           | hm history month   | s  summary  |
                  "| bw burndown weekly  | D  delete         | ha history annual  | S  stats    |
                  "| bm burndown monthly | e  edit           | i  (or <CR>) info  | t  tags     |
                  "| cp choose project   | g  grid           | l  back-link       | +  start    |
                  "| ct choose tag       | Gm ghistory month | m  modify          | -  stop     |
    Plug 'xolox/vim-notes', Cond(Mode(['editor',]))  | Plug 'xolox/vim-misc', Cond(Mode(['editor',]))    | " Use as our plugins help
"}}}

" Improve {{{2
    "Plug 'liuchengxu/vim-which-key'    | " How to use?
    "Plug 'markonm/traces.vim'         | " Range, pattern and substitute preview for Vim [Just worry about performance]
    "Plug 'lambdalisue/lista.nvim'     | " Cannot work

    "Plug 'derekwyatt/vim-fswitch'
    Plug 'kopischke/vim-fetch'
    Plug 'terryma/vim-expand-region'   | "   W - select region expand; B - shrink

    Plug 'tpope/vim-surround'          | " ds - remove surround; cs - change surround; After Selected, S} - surround the selected; yss - surround the whole line; ysiw' - surround the current word;
    Plug 'tpope/vim-rsi'               | " Readline shortcut for vim

    "Plug 'huawenyu/vim-indentwise'    | " Automatic set indent, shiftwidth, expandtab
    Plug 'ciaranm/detectindent'
    "Plug 'tpope/vim-sleuth'

    Plug 'szw/vim-maximizer'
    Plug 'huawenyu/vim-mark'
    "Plug 'tomtom/tmarks_vim'
    "Plug 'tomtom/quickfixsigns_vim'
    "Plug 'tomtom/vimform_vim'
    "Plug 'jceb/vim-editqf'            | " notes when review source
    "Plug 'huawenyu/highlight.vim'
    Plug 'huawenyu/vim-signature'      | " place, toggle and display marks
    Plug 'romainl/vim-qf'              | " Tame the quickfix window

    " Gen menu
    "Plug 'Timoses/vim-venu'            | " :VenuPrint, customize menu from command-line
    "Plug 'skywind3000/quickmenu.vim'   | " customize menu from size pane
    Plug 'daniel-samson/quickmenu.vim'

    " File/Explore {{{3
        " Plugin 'defx'
        if has('nvim')
          Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
        else
          Plug 'Shougo/defx.nvim'
          Plug 'roxma/nvim-yarp'
          Plug 'roxma/vim-hug-neovim-rpc'
        endif
        Plug 'kristijanhusak/defx-git'
        Plug 'kristijanhusak/defx-icons'

    " }}}

    " Motion {{{3
        "Plug 'justinmk/vim-sneak'    | " s + prefix-2-char to choose the words
        Plug 'easymotion/vim-easymotion'
        Plug 'tpope/vim-abolish'      | " :Subvert/child{,ren}/adult{,s}/g
        Plug 'tpope/vim-repeat'
        "Plug 'vim-utils/vim-vertical-move'
        Plug 'rhysd/accelerated-jk'
        "Plug 'unblevable/quick-scope'
        "Plug 'dbakker/vim-paragraph-motion' | " treat whitespace only lines as paragraph breaks so { and } will jump to them
        "Plug 'vim-scripts/Improved-paragraph-motion'
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'rhysd/clever-f.vim'

        " gA                   shows the four representations of the number under the cursor.
        " crd, crx, cro, crb   convert the number under the cursor to decimal, hex, octal, binary, respectively.
        Plug 'glts/vim-radical' |  Plug 'glts/vim-magnum'  | Plug 'tpope/vim-repeat'
        Plug 'huawenyu/vim-motion'  | " Jump according indent
    "}}}

    " Search {{{3
        Plug 'huawenyu/neovim-fuzzy', Cond(has('nvim'))
        "Plug 'Dkendal/fzy-vim'
        Plug 'mhinz/vim-grepper'    | " :Grepper text
        "Plug 'kien/ctrlp.vim'      | " Bad performance
    "}}}

    " Async {{{3
        "Plug 'tpope/vim-dispatch'
        "Plug 'huawenyu/vim-dispatch'        | " Run every thing. :Dispatch :Make :Start man 3 printf
        "Plug 'radenling/vim-dispatch-neovim', Cond(has('nvim'))
        Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        Plug 'skywind3000/asyncrun.vim'
        Plug 'huawenyu/neomake', Cond(has('nvim'))
        "Plug 'neomake/neomake', Cond(has('nvim'))
    "}}}

    " View/Outline {{{3
        Plug 'scrooloose/nerdtree',         { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }   | " :NERDTreeToggle; <Enter> open-file; '?' Help
        Plug 'scrooloose/nerdcommenter',    { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
        Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
        Plug 'jistr/vim-nerdtree-tabs',     { 'on':  'NERDTreeTabsToggle' }   | " :NERDTreeTabsToggle, Just one NERDTree, always and ever. It will always look the same in all tabs, including expanded/collapsed nodes, scroll position etc.
        Plug 'kien/tabman.vim'         | " Tab management for Vim
        Plug 'jeetsukumaran/vim-buffergator'
        Plug 'huawenyu/vim-rooter'  | " Get or change current dir

        "Plug 'tpope/vim-vinegar'    | " '-' open explore
        Plug 'huawenyu/VOoM'        | " VOom support +python3, :Voomhelp, yy Copy node(s). dd Cut node(s). pp Paste node(s) after the current node or fold.
                                      " <Space>            Expand/contract the current node
                                      " ^^, __, <<, >>     Move up/down, left, right the select nodes
        Plug 'vim-voom/VOoM_extras'
        "Plug 'mhinz/vim-signify'
        " Why search tags from the current file path:
        "   consider in new-dir open old-dir's file, bang!
        "Plug 'huawenyu/vim-autotag' | " First should exist tagfile which tell autotag auto-refresh: ctags -f .tags -R .
        Plug 'vim-scripts/taglist.vim'
        Plug 'majutsushi/tagbar'
        "Plug 'tomtom/ttags_vim'
    "}}}

    " Tools {{{3
        "Plug 'neovim/python-client'
        "Plug 'bbchung/Clamp' | " support C-family code powered by libclang
        "Plug 'apalmer1377/factorus'

        Plug 'tpope/vim-eunuch'  | " Support unix shell cmd: Delete,Unlink,Move,Rename,Chmod,Mkdir,Cfind,Clocate,Lfind,Wall,SudoWrite,SudoEdit
        Plug 'kassio/neoterm', Cond(has('nvim'))        | " a terminal for neovim; :T ls, # exit terminal mode by <c-\\><c-n>

        "Plug 'webdevel/tabulous'
        Plug 'huawenyu/taboo.vim'
        "Plug 'hari-rangarajan/CCTree'

        Plug 'vim-scripts/DrawIt'                       | " \di \ds: start/stop;  draw by direction-key
        Plug 'reedes/vim-pencil'
        Plug 'chrisbra/NrrwRgn'                         | " focus on a selected region. <leader>nr :NR - Open selected into new window; :w - (in the new window) write the changes back
        Plug 'stefandtw/quickfix-reflector.vim'
        Plug 'junegunn/vim-easy-align'                  | " selected and ga=
        Plug 'huawenyu/c-utils.vim'
        Plug 'wsdjeg/SourceCounter.vim'
        Plug 'junegunn/goyo.vim'                        | " :Goyo 80
        "Plug 'junegunn/limelight.vim'                  | " Unsupport colorscheme
    "}}}
"}}}

" Integration {{{2
    Plug 'huawenyu/new.vim', Cond(has('nvim')) | Plug 'huawenyu/new-gdb.vim', Cond(has('nvim'))  | " New GUI gdb-frontend
    "Plug 'huawenyu/neogdb.vim', Cond(has('nvim'))
    "Plug 'huawenyu/neogdb2.vim', Cond(has('nvim')) | Plug 'kassio/neoterm' | Plug 'paroxayte/vwm.vim'
    "Plug 'cpiger/NeoDebug', {'on': 'NeoDebug'}  |" Cond(has('nvim'))
    "Plug 'idanarye/vim-vebugger'
    "Plug 'LucHermitte/lh-vim-lib'
    " NVIM_LISTEN_ADDRESS=/tmp/nvim.gdb vi

    Plug 'rhysd/conflict-marker.vim'            | " [x and ]x jump conflict, `ct` for themselves, `co` for ourselves, `cn` for none and `cb` for both.
    Plug 'ericcurtin/CurtineIncSw.vim'          | " Toggle source/header
    Plug 'junkblocker/patchreview-vim'          | " :PatchReview some.patch
    "Plug 'cohama/agit.vim'    | " :Agit show git log like gitk
    "Plug 'codeindulgence/vim-tig' | " Using tig in neovim
    Plug 'iberianpig/tig-explorer.vim' | Plug 'rbgrouleff/bclose.vim'        | " tig for vim (https://github.com/jonas/tig): should install tig first.
    Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'  | " Awesome git wrapper
      " vim-fugitive: git-base
      "   :Gblame     Show help in blame window and input 'g?'
      "       o       open commit in horizontal split
      "       O       open commit in new tab
      "       ~       reblame at [count]th first grandparent
      "
      "       -       reblame at commit
      "       P       reblame at [count]th parent (like HEAD^[count])
      "   :Glog       Show current file's all history version
      "   :Git        Execute git command
      " gv.vim:       commit browser
      "   :GV         to open commit browser, suppot log options, e.g. :GV -S foobar.
      "   :GV!        will only list commits that affected the current file
      "   :GV?        fills the location list with the revisions of the current file
      "      o/<cr>   on a commit to display the content/diff on the new open side window.

    "Plug 'junegunn/fzf.vim'      | " base-on: https://github.com/junegunn/fzf, create float-windows: https://kassioborges.dev/2019/04/10/neovim-fzf-with-a-floating-window.html
    "Plug 'juneedahamed/svnj.vim'
    Plug 'juneedahamed/vc.vim'| " Support git, svn, ...
    Plug 'vim-scripts/vcscommand.vim' | " CVS, SVN, SVK, git, bzr, and hg within VIM
    Plug 'sjl/gundo.vim'
    Plug 'mattn/webapi-vim'
    Plug 'mattn/gist-vim'        | " :'<,'>Gist -e 'list-sample'

    " share copy/paste between vim(""p)/tmux
    "Plug 'svermeulen/vim-easyclip'  | " change to vim-yoink, similiar: nvim-miniyank, YankRing.vim, vim-yankstack
    "Plug 'bfredl/nvim-miniyank'
    Plug 'svermeulen/vim-yoink', Cond(has('nvim')) | " sometimes delete not copyinto paste's buffer
    Plug 'huawenyu/vimux-script'
    "Plug 'huawenyu/vim-tmux-runner'
    Plug 'huawenyu/vim-tmux-runner', { 'on':  ['VtrLoad', 'VtrSendCommandToRunner', 'VtrSendLinesToRunner', 'VtrSendFile', 'VtrOpenRunner'] }   | " Send command to tmux's marked pane
    Plug 'yuratomo/w3m.vim'
    Plug 'nhooyr/neoman.vim', Cond(has('nvim'))    | " :Nman printf, :Nman printf(3)
    Plug 'szw/vim-dict'
    "Plug 'tyru/current-func-info.vim'           | "[Too slow] Show current function name in statusline
"}}}

" AutoComplete {{{2
    "Plug 'ervandew/supertab'
    "Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', Cond(has('nvim'))         | "{ 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet.vim', Cond(has('nvim'))        | " c-k apply code, c-n next, c-p previous
    Plug 'Shougo/neosnippet-snippets', Cond(has('nvim'))
    Plug 'honza/vim-snippets'
    "Plug 'vim-scripts/CmdlineComplete'
    Plug 'reedes/vim-wordy'
    Plug 'tenfyzhong/CompleteParameter.vim'
"}}}

" Text Objects {{{2, https://github.com/kana/vim-textobj-user/wiki
    " vimwiki                               vah
    Plug 'wellle/targets.vim'           | " Support build-in obj number-repeat/`n`ext/`l`ast: quota `,`, comma `,`, `(` as n

    Plug 'kana/vim-textobj-user'
    "Plug 'kana/vim-repeat'

    Plug 'kana/vim-textobj-indent'      | " vai, vaI
    Plug 'kana/vim-textobj-entire'      | " vae, Select entire buffer

    Plug 'kana/vim-textobj-function'    | " vaf, Support: c, java, vimscript
    " Plug 'machakann/vim-textobj-functioncall'

    Plug 'mattn/vim-textobj-url'        | " vau
    Plug 'kana/vim-textobj-diff'        | " vdh, hunk;  vdH, file;  vdf, file
    " Plug 'thalesmello/vim-textobj-methodcall'
    " Plug 'adriaanzon/vim-textobj-matchit'
    Plug 'glts/vim-textobj-comment'     | " vac, vic
    Plug 'glts/vim-textobj-indblock'    | " vao, Select a block of indentation whitespace before ascii
    Plug 'thinca/vim-textobj-between'   | " vaf
    Plug 'Julian/vim-textobj-brace'     | " vaj
    Plug 'whatyouhide/vim-textobj-xmlattr'  | " vax
"}}}

" ThirdpartLibrary {{{2
    "Plug 'vim-jp/vital.vim'
    "Plug 'google/vim-maktaba'
    Plug 'tomtom/tlib_vim'
"}}}

" Debug {{{2
    " Execute eval script: using singlecompile
    "Plug 'thinca/vim-quickrun'                      | " :QuickRun
    "Plug 'fboender/bexec'                           | " :Bexec
    Plug 'huawenyu/SingleCompile'                     | " :SingleCompile, SingleCompileRun
    Plug 'amiorin/vim-eval'

    Plug 'gu-fan/doctest.vim'     | " doctest for language vimscript, :DocTest
    Plug 'tpope/vim-scriptease'   | " A Vim plugin for Vim plugins
    Plug 'huawenyu/vimlogger'
    "Plug 'vim-scripts/TailMinusF' | " Too slow, :Tail <file>
    Plug 'junegunn/vader.vim'     | " A simple Vimscript test framework
    "Plug 'huawenyu/Decho'
    "Plug 'c9s/vim-dev-plugin'   | " gf: goto-function-define, but when edit vimrc will trigger error
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

