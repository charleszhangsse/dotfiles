" Hi, the <leader> is <space> :)
"
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
"      $ mkdir ~/.config
"      $ ln -s ~/.vim ~/.config/nvim
"      $ ln -s ~/.vimrc ~/.config/nvim/init.vim
"
"      ### Make neovim work with plugs
"      $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"      ### Make vim work with plugs
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
"       ]l, [l          jump next/prev same indent line
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
"   Maps:
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
"
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

  function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
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

" Plug setup: Basic Config, order-sensible {{{2
    Plug 'tpope/vim-sensible'
    Plug 'huawenyu/vim-basic'
"}}}2

" Help {{{2
    " On-demand lazy load
    "Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"}}}2

" ColorTheme {{{2
    Plug 'vim-scripts/holokai'
    Plug 'NLKNguyen/papercolor-theme'      | " set background=light;colorscheme PaperColor
    Plug 'junegunn/seoul256.vim'
    "Plug 'tomasr/molokai'
    "Plug 'darkspectrum'
    "Plug 'dracula/vim'
    "Plug 'morhetz/gruvbox'
    "Plug 'sjl/badwolf'
    "Plug 'jnurmine/Zenburn'
    "Plug 'joshdick/onedark.vim'
    "Plug 'ryu-blacknd/vim-nucolors'
    "Plug 'chriskempson/base16-vim'
    "Plug 'Lokaltog/vim-distinguished'
    "Plug 'flazz/vim-colorschemes'
    "Plug 'nanotech/jellybeans.vim'
    "Plug 'huawenyu/color-scheme-holokai-for-vim'
"}}}

" Mode {{{2
    " Tags/cscope {{{3
        " [Tags](https://zhuanlan.zhihu.com/p/36279445)
        " [C++](https://www.zhihu.com/question/47691414/answer/373700711)
        "
        "Plug 'ludovicchabant/vim-gutentags'        | " autogen tags
        "Plug 'skywind3000/gutentags_plus'
        "Plug 'skywind3000/vim-preview'
        "Plug 'whatot/gtags-cscope.vim'

        "Plug 'lyuts/vim-rtags'
        "Plug 'w0rp/ale'   | " 1. Not using clang's lint, 2. find references look not work

        " Please install yarn (-- a node package manger) first.
        Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}  | " sometimes find references fail
        "Plug 'neoclide/coc.nvim', {'on': ['<Plug>(coc-definition)', '<Plug>(coc-references)'], 'do': 'yarn install --frozen-lockfile'}  | " Increase stable by only load the plugin after the 1st command call.
        Plug 'neoclide/coc-rls'
    "}}}

    " Python {{{3
        " auto-complete
        " https://github.com/neovim/python-client
        " Install https://github.com/davidhalter/jedi
        " https://github.com/zchee/deoplete-jedi
        Plug 'python-mode/python-mode'
        Plug 'davidhalter/jedi-vim'
    "}}}
    "
    " LaTeX {{{3
        "Plug 'lervag/vimtex'  | " A modern vim plugin for editing LaTeX files
    "}}}

    " Perl {{{3
        Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
        Plug 'tpope/vim-cucumber'       | " Auto test framework base on Behaviour Drive Development(BDD)
    "}}}

    " Javascript {{{3
        Plug 'pangloss/vim-javascript'
        Plug 'elzr/vim-json'

        " https://hackernoon.com/using-neovim-for-javascript-development-4f07c289d862
        Plug 'ternjs/tern_for_vim'      | " Tern-based JavaScript editing support.
        Plug 'carlitux/deoplete-ternjs'
    "}}}

    " Clojure {{{3
        Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    "}}}

    " Database {{{3
        Plug 'tpope/vim-dadbod'       | " :DB mongodb:///test < big_query.js
    "}}}

    " Golang {{{3
        Plug 'fatih/vim-go'
        Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    "}}}

    " Tcl {{{3
        "Plug 'LStinson/TclShell-Vim'
    "}}}

    " Haskell {{{3
        Plug 'lukerandall/haskellmode-vim'
        Plug 'eagletmt/ghcmod-vim'
        Plug 'ujihisa/neco-ghc'
        Plug 'neovimhaskell/haskell-vim'
    "}}}

    " Rust {{{3
        Plug 'rust-lang/rust.vim'
    "}}}

    Plug 'vim-scripts/iptables'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-speeddating'
    "Plug 'vim-scripts/tcl.vim'
    "Plug 'vim-syntastic/syntastic'

    " Session management
    "Plug 'xolox/vim-session'
    "Plug 'tpope/vim-obsession'
    Plug 'thaerkh/vim-workspace'

"}}}

" Facade {{{2
    Plug 'Raimondi/delimitMate'
    Plug 'millermedeiros/vim-statline'
    "Plug 'vivien/vim-linux-coding-style'
    "Plug 'MattesGroeger/vim-bookmarks'
    "Plug 'hecal3/vim-leader-guide'
    "Plug 'megaannum/self'
    "Plug 'megaannum/forms'
    "Plug 'mhinz/vim-startify'
    "Plug 'pi314/ime.vim'    | " Chinese input in vim
"}}}

" Syntax/Language {{{2
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'justinmk/vim-syntax-extra'
    "Plug 'justinmk/vim-dirvish'
    "Plug 'kovisoft/slimv'
    "Plug 'AnsiEsc.vim'
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'huawenyu/robotframework-vim'
    "Plug 'bpstahlman/txtfmt'
    "Plug 'dhruvasagar/vim-table-mode'
    Plug 'godlygeek/tabular'   | " require by vim-markdown
    Plug 'plasticboy/vim-markdown'

    "
    " http://www.thegeekstuff.com/2009/02/make-vim-as-your-bash-ide-using-bash-support-plugin/
    " Must config to avoid annoy popup message:
    "   $ cat ~/.vim/templates/bash.templates
    "       SetMacro( 'AUTHOR',      'Huawen Yu' )
    "       SetMacro( 'AUTHORREF',   'hyu' )
    "       SetMacro( 'EMAIL',       'wilson.yuu@gmail.com' )
    "       SetMacro( 'COPYRIGHT',   'Copyright (c) |YEAR|, |AUTHOR|' )
    "Plug 'WolfgangMehner/bash-support'
    "Plug 'vim-scripts/DirDiff.vim'
    Plug 'rickhowe/diffchar.vim'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'huawenyu/vim-log-syntax'
    Plug 'Shougo/vinarise.vim' | " Hex viewer
    "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }  | " brew install prettier
"}}}

" Vimwiki {{{2
    " Install:
    "   sudo apt-get install uuid-dev
    "   sudo apt-get install libgnutls-dev
    "   ## Download v2.5 version, not current v2.6 which require the newer g++ compiler.
    "   cd taskwarrior; cmake -DCMAKE_BUILD_TYPE=release .; make; sudo make install
    "   sudo pip3 install --upgrade git+git://github.com/tbabej/tasklib@develop
    " Conf:
    "   <Path>: g:vimwiki_list
    " [Usage:](http://thedarnedestthing.com/vimwiki%20cheatsheet)
    "   ==Wiki==
    "   <leader> ws                     List all wikis
    "   <leader>ww                      Create a new wiki
    "   [number]<leader>ww              Choose a existed defined wiki
    "   <leader> wd                     delete wiki page
    "   <leader> wr                     rename wiki page
    "   :VimwikiTOC                     Insert contents index at wiki's top
    "
    "   ==Search==
    "   :VWS /blog/
    "   :lopen
    "
    "   ==List & Task: todo lists==
    "   <C-Space>                       toggle list item on/off
    "
    "   ==editing==
    "   =                               add header level
    "   -                               remove header level
    "   +                               create/decorate links
    "   glm                             increase indent of list item
    "   gll                             decrease indent of list item
    "   gl* or gl8                      switch or insert '*' symbol
    "   gl# or gl3                      switch or insert '#' symbol
    "   gl-                             switch or insert '-' symbol
    "   gl1                             switch or insert '1.' symbol
    "
    "   ==Diary==
    "   <leader>w<leader>w              open diary index file for wiki
    "   [number]<leader>wi              open diary index file for wiki
    "   <leader>w<leader>i              update current diary index
    "   [number]<leader>w<leader>w      open today’s diary file for wiki
    "   [number]<leader>w<leader>t      open today’s diary file for wiki in new tab
    "   <C-Up>                          open previous day’s diary
    "   <C-Down>                        open next day’s diary
    "
    "   ==navigation==
    "   <Enter>                         follow/create wiki link
    "   <Backspace>                     go back to previous wiki page
    "   <C-S-CR>                        follow/create wiki link in new tab
    "   <Tab>                           go to next link on current page
    "   <S-Tab>                         go to previous link on current page
    "
    "   ==Anchor navigation== :help vimwiki-anchors
    "   Every header, tag, and bold text can be used as an anchor.
    "   To jump to it, use a wikilink: [[file#anchor]], [[#pay rise]]
    "
    "             = My tasks =
    "             :todo-lists:
    "             == Home ==
    "               - [ ] bathe my dog
    "             == Work ==
    "               - [ ] beg for *pay rise*
    "             == Knitting club ==
    "             === Knitting projects ===
    "               - [ ] a *funny pig*
    "               - [ ] a *scary dog*
    "
    "
    "   ==Table==
    "   :VimwikiTable                   create table
    "   gqq                             reformat t able
    "
    "   <A-Left>                        move column left
    "   <A-right>                       move column right
    "   <CR>                            (insert mode) go down/create cell
    "   <Tab>                           (insert mode) go next/create cell
    "   gqq or gww                      reformat table
    "
    "   ==text objects==
    "   ah                              section between 2 headings including empty trailing lines
    "   ih                              section between 2 headings excluding empty trailing lines
    "   a\                              table cell
    "   i\                              inner table cell
    "   ac                              table column
    "   ic                              inner table column
    "

    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }  | " Another choice is [Gollum](https://github.com/gollum/gollum)
    "Plug 'tomtom/vikibase_vim'
    Plug 'mattn/calendar-vim' | " :Calendar

    "Plug 'freitass/todo.txt-vim'     | " Like todo.txt-cli command-line, but here really needed is the wrap of Todo.txt-cli.
    "Plug 'elentok/todo.vim'
    "
    " Require vimwiki, tasklib, [taskwarrior](https://taskwarrior.org/download/)
    " taskwarrior: a command line task management tool, config by ~/.taskrc
    "Plug 'blindFS/vim-taskwarrior'
    Plug 'powerman/vim-plugin-AnsiEsc'

    " Prerequirement: brew install task; sudo pip3 install tasklib; ln -s ~/.task, ~/.taskrc;
    Plug 'tbabej/taskwiki'  | " Only handles *.wiki file contain check lists which beginwith asterisk '*'
                  " <leader>t + <option>
                  "| a  annotate         | C  calendar       | Ga ghistory annual | p  projects |
                  "| bd burndown daily   | d  done           | hm history month   | s  summary  |
                  "| bw burndown weekly  | D  delete         | ha history annual  | S  stats    |
                  "| bm burndown monthly | e  edit           | i  (or <CR>) info  | t  tags     |
                  "| cp choose project   | g  grid           | l  back-link       | +  start    |
                  "| ct choose tag       | Gm ghistory month | m  modify          | -  stop     |

"}}}

" Improve {{{2
    "Plug 'derekwyatt/vim-fswitch'
    Plug 'kopischke/vim-fetch'
    Plug 'terryma/vim-expand-region'   | "   W - select region expand; B - shrink

    Plug 'tpope/vim-surround'          | " ds - remove surround; cs - change surround; After Selected, S} - surround the selected; yss - surround the whole line; ysiw' - surround the current word;

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
    Plug 'Timoses/vim-venu'            | " :VenuPrint, customize menu from command-line
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

        " gA                   shows the four representations of the number under the cursor.
        " crd, crx, cro, crb   convert the number under the cursor to decimal, hex, octal, binary, respectively.
        Plug 'glts/vim-radical' |  Plug 'glts/vim-magnum'  | Plug 'tpope/vim-repeat'
    "}}}

    " Search {{{3
        Plug 'huawenyu/neovim-fuzzy', Cond(has('nvim'))
        "Plug 'Dkendal/fzy-vim'
        Plug 'mhinz/vim-grepper'    | " :Grepper text
    "}}}

    " Async {{{3
        "Plug 'tpope/vim-dispatch'
        "Plug 'huawenyu/vim-dispatch'        | " Run every thing. :Dispatch :Make :Start man 3 printf
        "Plug 'radenling/vim-dispatch-neovim', Cond(has('nvim'))
        Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        Plug 'skywind3000/asyncrun.vim'
        Plug 'huawenyu/neomake', Cond(has('nvim'))
    "}}}

    " View/Outline {{{3
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }   | " :NERDTreeToggle; <Enter> open-file; '?' Help
        Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }   | " :NERDTreeTabsToggle, Just one NERDTree, always and ever. It will always look the same in all tabs, including expanded/collapsed nodes, scroll position etc.
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
    Plug 'yuratomo/w3m.vim'
    Plug 'nhooyr/neoman.vim', Cond(has('nvim'))    | " :Nman printf, :Nman printf(3)
    Plug 'szw/vim-dict'
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


" Plug-end setup: customize the plugs, must put at the end of plugs {{{2
    Plug 'huawenyu/vim-menu1'
    Plug 'huawenyu/vim-conf-plugs'
"}}}2
call plug#end()


" Configure {{{1}}}

" Plugins Configure {{{1}}}

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:AutoPairsFlyMode = 1

" wildignore {{{2}}}
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

function! ResCur()
    let save_cursor = getcurpos()

    let text = getline('.')
    normal! be
    let end_pos = getcurpos()
    call search('\s\|[,;\(\)]','b')
    call search('\S')
    let start_pos = getcurpos()

    call setpos('.', save_cursor)
endfunction

" Restore cursor {{{2}}}
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * silent! call ResCur()
augroup END

"}
  " Enter to go to end of file, Backspace to go to beginning of file.
  "nnoremap <CR> G
  "nnoremap <BS> gg

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
    "
    " 前半部分 “./.tags; ”代表在文件的所在目录下（不是 “:pwd”返回的 Vim 当前目录）查找名字为 '.tags'的符号文件，
    " 后面一个分号代表查找不到的话向上递归到父目录，直到找到 .tags 文件或者递归到了根目录还没找到，
    " 逗号分隔的后半部分 .tags 是指同时在 Vim 的当前目录（“:pwd”命令返回的目录，可以用 :cd ..命令改变）下面查找 .tags 文件。
    "set tags=./.tags;,.tags
    "
    set tags=./tags,tags,./.tags,.tags;$HOME
"}}}

" Commands {{{1

command! -nargs=* Wrap set wrap linebreak nolist
"command! -nargs=* Wrap PencilSoft
"command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
command! -nargs=+ -bang -complete=shellcmd
      \ Make execute ':NeomakeCmd make '. <q-args>

command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

command! -nargs=* C0  setlocal autoindent cindent expandtab   tabstop=4 shiftwidth=4 softtabstop=4
command! -nargs=* C08 setlocal autoindent cindent expandtab   tabstop=8 shiftwidth=2 softtabstop=8
command! -nargs=* C2  setlocal autoindent cindent expandtab   tabstop=2 shiftwidth=2 softtabstop=2
command! -nargs=* C4  setlocal autoindent cindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
command! -nargs=* C8  setlocal autoindent cindent noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

" Autocmd {{{2

    function! AdjustWindowHeight(minheight, maxheight)
        let l = 1
        let n_lines = 0
        let w_width = winwidth(0)
        while l <= line('$')
            " number to float for division
            let l_len = strlen(getline(l)) + 0.0
            let line_width = l_len/w_width
            let n_lines += float2nr(ceil(line_width))
            let l += 1
        endw
        let exp_height = max([min([n_lines, a:maxheight]), a:minheight])
        if (abs(winheight(0) - exp_height)) > 2
            exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
        endif
    endfunction

    function! Indent(linenum, islog)
        if a:islog
            let cur_str = getline(a:linenum)
            if cur_str =~? '^T@'
                " Non-greed: replace '.*' with '.\{-}'
                let cur_str2 = substitute(cur_str, '^T@.\{-}-  ', '  ', '')
                let off_set = match(cur_str, cur_str2)
                let indent = match(cur_str2, '\S')
                return off_set + indent
            endif
        endif
        return indent(a:linenum)
    endfunction

    " Jump to the next or previous line that has the same level or a lower
    " level of indentation than the current line.
    "
    " exclusive (bool): true: Motion is exclusive
    "                   false: Motion is inclusive
    " fwd (bool): true: Go to next line
    "             false: Go to previous line
    " lowerlevel (bool): true: Go to line with lower indentation level
    "                    false: Go to line with the same indentation level
    " skipblanks (bool): true: Skip blank lines
    "                    false: Don't skip blank lines
    function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
        let line = line('.')
        let column = col('.')
        let lastline = line('$')

        " check logfile
        let is_log = 0
        let cur_str = getline('.')
        if cur_str =~? '^T@'
            let is_log = 1
        endif

        " indent by cursor position (only by-space), or by builtin indent (by-space/tab)
        if is_log
            let indent = column - 1
        else
            let indent = Indent(line, is_log)
        endif

        let stepvalue = a:fwd ? 1 : -1
        while (line > 0 && line <= lastline)
            let line = line + stepvalue

            " if logfile, skip non-log lines
            if is_log == 1
                let cur_str = getline(line)
                if cur_str !~? '^T@'
                    continue
                endif
            endif

            if ( ! a:lowerlevel && Indent(line, is_log) == indent ||
                        \ a:lowerlevel && Indent(line, is_log) < indent)
                if (! a:skipblanks || strlen(getline(line)) > 0)
                    if (a:exclusive)
                        let line = line - stepvalue
                    endif
                    "exe line
                    " column different when tabs
                    "   exe "normal " column . "|"
                    "exe "normal " column . "l"
                    call cursor(line, column)
                    return
                endif
            endif
        endwhile
    endfunction

    " Moving back and forth between lines of same or lower indentation.
    nnoremap <silent> <a-p> :call NextIndent(0, 0, 0, 1)<CR>
    nnoremap <silent> <a-n> :call NextIndent(0, 1, 0, 1)<CR>
    nnoremap <silent> <a-P> :call NextIndent(0, 0, 1, 1)<CR>
    nnoremap <silent> <a-N> :call NextIndent(0, 1, 1, 1)<CR>
    vnoremap <silent> <a-p> <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
    vnoremap <silent> <a-n> <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
    vnoremap <silent> <a-P> <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
    vnoremap <silent> <a-N> <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
    onoremap <silent> <a-p> :call NextIndent(0, 0, 0, 1)<CR>
    onoremap <silent> <a-n> :call NextIndent(0, 1, 0, 1)<CR>
    onoremap <silent> <a-P> :call NextIndent(1, 0, 1, 1)<CR>
    onoremap <silent> <a-N> :call NextIndent(1, 1, 1, 1)<CR>
    "nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
    "nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
    "nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
    "nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
    "vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
    "vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
    "vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
    "vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
    "onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
    "onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
    "onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
    "onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

    function SelectIndent()
        let cur_line = line(".")
        let cur_ind = indent(cur_line)
        let line = cur_line
        while indent(line - 1) >= cur_ind
            let line = line - 1
        endw
        " Select above line
        let line = line - 1
        exe "normal " . line . "G"
        exe "normal V"
        let line = cur_line
        while indent(line + 1) >= cur_ind
            let line = line + 1
        endw
        " Select below line
        let line = line + 1
        exe "normal " . line . "G"
    endfunction
    nnoremap vip :call SelectIndent()<CR>

    " Maximizes the current window if it is not the quickfix window.
    function! SetIndentTabForCfiletype()
        " auto into terminal-mode
        if &buftype == 'terminal'
            startinsert
            return
        elseif &buftype == 'quickfix'
            call AdjustWindowHeight(2, 10)
            return
        endif

        let my_ft = &filetype
        if (my_ft == "c" || my_ft == "cpp" || my_ft == "diff" )
            execute ':C8'

            " If logfile reset NonText bright, this will override it.
            "" The 'NonText' highlighting will be used for 'eol', 'extends' and 'precedes'
            "" The 'SpecialKey' for 'nbsp', 'tab' and 'trail'.
            "hi NonText          ctermfg=238
            "hi SpecialKey       ctermfg=238
        elseif (my_ft == 'vimwiki')
            execute ':C0'
        endif
    endfunction

    function! OnEventBufEnter()
        " auto into terminal-mode
        if &buftype == 'terminal'
            startinsert
        else
            stopinsert
        endif

        "call SetIndentTabForCfiletype()
    endfunction

    "" Easier and better than plugin 'autotag'
    "let s:retag_time = localtime()
    "function! RetagFile()
    "    if   (!filereadable(g:autotagTagsFile))
    "       \ || (localtime() - s:retag_time) < s:autotag_inter
    "        return
    "    endif
    "    let cdir = getcwd()
    "    let file = expand('%:p')
    "    let ext = expand('%:e')
    "    if g:asyncrun_status =~ 'running' || empty(ext) || file !~ cdir. '/'
    "        return
    "    elseif index(g:autotagExcSuff, ext) < 0
    "        execute ":AsyncRun tagme ". expand('%:p')
    "    endif
    "endfunction

     function! ToggleCalendar()
       execute ":Calendar"
       if exists("g:calendar_open")
         if g:calendar_open == 1
           execute "q"
           unlet g:calendar_open
         else
           g:calendar_open = 1
         end
       else
         let g:calendar_open = 1
       end
     endfunction


    augroup fieltype_automap
        " Voom/VOom:
        " <Enter>             selects node the cursor is on and then cycles between Tree and Body.
        " <Tab>               cycles between Tree and Body windows without selecting node.
        " <C-Up>, <C-Down>    move node or a range of sibling nodes Up/Down.
        " <C-Left>, <C-Right> move nodes Left/Right (promote/demote).
        "
        autocmd!

        "autocmd VimLeavePre * cclose | lclose
        autocmd InsertEnter,InsertLeave * set cul!
        " Sometime crack the tag file
        "autocmd BufWritePost,FileWritePost * call RetagFile()

        " current position in jumplist
        autocmd CursorHold * normal! m'

        autocmd BufEnter * call OnEventBufEnter()

        " Always show sign column
        autocmd BufEnter * sign define dummy
        autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

        autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
        autocmd BufNewFile,BufRead *.c.rej,*.c.orig,h.rej,*.h.orig,patch.*,*.diff,*.patch set ft=diff
        autocmd BufNewFile,BufRead *.c,*.c,*.h,*.cpp,*.C,*.CXX,*.CPP set ft=c
        autocmd BufNewFile,BufRead *.wiki set syntax=markdown
        "autocmd BufNewFile,BufRead *.wiki set ft=markdown
        autocmd BufWritePre [\,:;'"\]\)\}]* throw 'Forbidden file name: ' . expand('<afile>')

        "autocmd filetype vimwiki  nnoremap <buffer> <a-o> :VoomToggle vimwiki<CR>
        autocmd filetype vimwiki  nnoremap <buffer> <a-'> :VoomToggle markdown<CR>
        "autocmd filetype vimwiki  nnoremap <a-n> :VimwikiMakeDiaryNote<CR>
        "autocmd filetype vimwiki  nnoremap <a-i> :VimwikiDiaryGenerateLinks<CR>
        "autocmd filetype vimwiki  nnoremap <a-c> :call ToggleCalendar()<CR>

        autocmd filetype markdown nnoremap <buffer> <a-'> :VoomToggle markdown<CR>
        autocmd filetype python   nnoremap <buffer> <a-'> :VoomToggle python<CR>

        autocmd filetype qf call AdjustWindowHeight(2, 10)
        autocmd filetype c,cpp,diff C8
        autocmd filetype zsh,bash C2
        autocmd filetype vim,markdown C08
        autocmd filetype vimwiki,txt C0

        "autocmd filetype log nnoremap <buffer> <leader>la :call log#filter(expand('%'), 'all')<CR>
        "autocmd filetype log nnoremap <buffer> <leader>le :call log#filter(expand('%'), 'error')<CR>
        "autocmd filetype log nnoremap <buffer> <leader>lf :call log#filter(expand('%'), 'flow')<CR>
        "autocmd filetype log nnoremap <buffer> <leader>lt :call log#filter(expand('%'), 'tcp')<CR>
    augroup END

"}}}
"}}}


" Key maps {{{1}}}
  " Bother when termopen and input space cause a little pause-stop-wait
  "let mapleader = "\<Space>"
  " Bother when in select-mode and use the leader not works, so also provide another leader
  " Space can be a bit tricky. Why not just map space to <leader>
  let mapleader = ","
  nmap <space> <leader>

  " diable Ex mode
  map Q <Nop>

  "" Stop that stupid window from popping up
  "map q: :q
  nmap ql :ls<cr>
  nmap qw :R! ~/tools/dict <C-R>=expand('<cword>') <cr>

  "" Disable F1 built-in help key by: re-replace last search
  "map <F1> :<c-u>%s///gc<cr>
  "imap <F1> :<c-u>%s//<C-R>0/gc<cr>

  " map <leader><Esc> :AnsiEsc<cr>
  nnoremap <C-c> <silent> <C-c>
  nnoremap <buffer> <Enter> <C-W><Enter>
  nnoremap <C-q> :<c-u>qa!<cr>

  nnoremap <C-s> :ToggleWorkspace<cr>
  " restore-session: vim -S
  "nnoremap <C-s> :Obsess
  "nnoremap <C-s> :Savews<cr>

  inoremap <S-Tab> <C-V><Tab>

if exists('g:loaded_accelerated')
  " Accelerated_jk
  " when wrap, move by virtual row
  "let g:accelerated_jk_enable_deceleration = 1
  let g:accelerated_jk_acceleration_table = [1,2,3]

  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
  "nmap j <Plug>(accelerated_jk_gj_position)
  "nmap k <Plug>(accelerated_jk_gk_position)
else
  nnoremap j gj
  nnoremap k gk
endif

  " Substitue for MaboXterm diable <c-h>
  nnoremap <leader>h <c-w>h
  nnoremap <leader>j <c-w>j
  nnoremap <leader>k <c-w>k
  nnoremap <leader>l <c-w>l

  " Replace by vim-tmux-navigator
  "nnoremap <c-h> <c-w>h
  "nnoremap <c-j> <c-w>j
  "nnoremap <c-k> <c-w>k
  "nnoremap <c-l> <c-w>l

  if has("nvim")
    let b:terminal_scrollback_buffer_size = 2000
    let g:terminal_scrollback_buffer_size = 2000

    " i: enter interact-mode, 'esc' exit interact-mode and enter vi-mode
    " But so far conflict with gdb mode
    "tnoremap <Esc> <C-\><C-n>
    tnoremap <leader>h <C-\><C-n><c-w>h
    tnoremap <leader>j <C-\><C-n><c-w>j
    tnoremap <leader>k <C-\><C-n><c-w>k
    tnoremap <leader>l <C-\><C-n><c-w>l

    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l
  endif

  " Automatically jump to end of text you pasted
  "vnoremap <silent> y y`]
  vnoremap <silent> p p`]
  nnoremap <silent> p p`]
  " Paste in insert mode
  inoremap <silent> <a-p> <c-r>"

  " vp doesn't replace paste buffer
  function! RestoreRegister()
      let @" = s:restore_reg
      let @+ = s:restore_reg | " sometime other plug use this register as paste-buffer
      return ''
  endfunction
  function! s:Repl()
      let s:restore_reg = @"
      return "p@=RestoreRegister()\<cr>"
  endfunction
  vnoremap <silent> <expr> p <sid>Repl()

  nnoremap <silent> <a-o> <C-o>
  nnoremap <silent> <a-i> <C-i>

  nnoremap <silent> <a-w> :MaximizerToggle<CR>
  nnoremap <silent> <a-e> :NERDTreeTabsToggle<cr>
  nnoremap <silent> <a-f> :NERDTreeFind<cr>
  nnoremap <silent> <a-u> :GundoToggle<CR>

  nnoremap <silent> <a-'> :VoomToggle<cr>
  nnoremap <silent> <a-;> :<c-u>call <SID>ToggleTagbar()<CR>
  "nnoremap <silent> <a-;> :TMToggle<CR>
  "nnoremap <silent> <a-.> :BuffergatorToggle<CR>
  "nnoremap <silent> <a-,> :VoomToggle<CR>
  "nnoremap <silent> <a-[> :Null<CR>
  "nnoremap <silent> <a-]> :Null<CR>
  "nnoremap <silent> <a-\> :Null<CR>

  "nnoremap <silent> <a-n> :lnext<cr>
  "nnoremap <silent> <a-p> :lpre<cr>
  nnoremap <silent> <c-n> :cn<cr>
  nnoremap <silent> <c-p> :cp<cr>

  nnoremap <silent> <leader>n :cn<cr>
  nnoremap <silent> <leader>p :cp<cr>

  function! s:JumpI(mode)
      if v:count == 0
          if a:mode
              let ans = input("FuzzySymbol ", utils#GetSelected(''))
              exec 'FuzzySymb '. ans
          else
              FuzzySymb
          endif
      else
      endif
  endfunction
  function! s:JumpO(mode)
      if v:count == 0
          if a:mode
              let ans = input("FuzzyOpen ", utils#GetSelected(''))
              exec 'FuzzyOpen '. ans
          else
              FuzzyOpen
          endif
      else
          exec ':silent! b'. v:count
      endif
  endfunction
  function! s:JumpH(mode)
  endfunction
  function! s:JumpJ(mode)
      if v:count == 0
          if a:mode
              let ans = input("FuzzyFunction ", utils#GetSelected(''))
              exec 'FuzzyFunc '. ans
          else
              FuzzyFunc
          endif
      else
          exec 'silent! '. v:count. 'wincmd w'
      endif
  endfunction
  function! s:JumpK(mode)
      if v:count == 0
      else
          exec 'normal! '. v:count. 'gt'
      endif
  endfunction
  function! s:JumpComma(mode)
      if v:count == 0
          "silent call utils#Declaration()
          call utils#Declaration()
      else
      endif
  endfunction

  " Must install fzy tool(https://github.com/jhawthorn/fzy)
  nnoremap <silent> <leader>i  :<c-u>call <SID>JumpI(0)<cr>
  vnoremap          <leader>i  :<c-u>call <SID>JumpI(1)<cr>
  nnoremap <silent> <leader>o  :<c-u>call <SID>JumpO(0)<cr>
  vnoremap          <leader>o  :<c-u>call <SID>JumpO(1)<cr>
  "nnoremap <silent> <leader>h  :<c-u>call <SID>JumpH(0)<cr>
  "vnoremap          <leader>h  :<c-u>call <SID>JumpH(1)<cr>
  "nnoremap <silent> <leader>j  :<c-u>call <SID>JumpJ(0)<cr>
  "vnoremap          <leader>j  :<c-u>call <SID>JumpJ(1)<cr>
  nnoremap          <leader>f  :ls<cr>:b<Space>
  nnoremap <silent> <leader>;  :<c-u>call <SID>JumpComma(0)<cr>
  vnoremap          <leader>;  :<c-u>call <SID>JumpComma(1)<cr>

  " Toggle source/header
  "nnoremap <silent> <leader>a  :<c-u>FuzzyOpen <C-R>=printf("%s\\.", expand('%:t:r'))<cr><cr>
  nnoremap <silent> <leader>a  :<c-u>call CurtineIncSw()<cr>

  " Set log
  "nnoremap <silent> <leader>ll :<c-u>call log#log(expand('%'))<CR>
  "vnoremap <silent> <leader>ll :<c-u>call log#log(expand('%'))<CR>
  " Lint: -i ignore-error and continue, -s --silent --quiet

  "bookmark
  nnoremap <silent> <leader>mm :silent! call mark#MarkCurrentWord(expand('cword'))<CR>
  "nnoremap <leader>mf :echo(statusline#GetFuncName())<CR>
  "nnoremap <leader>mo :BookmarkLoad Default
  "nnoremap <leader>ma :BookmarkShowAll <CR>
  "nnoremap <leader>mg :BookmarkGoto <C-R><c-w>
  "nnoremap <leader>mc :BookmarkDel <C-R><c-w>
  "
  map W <Plug>(expand_region_expand)
  map B <Plug>(expand_region_shrink)

  nnoremap <silent> <leader>v] :NeomakeSh! tagme<cr>
  nnoremap <silent> <leader>vi :call utils#VoomInsert(0) <CR>
  vnoremap <silent> <leader>vi :call utils#VoomInsert(1) <CR>

  nnoremap <silent> <leader>gg :<C-\>e utilgrep#Grep(2,0)<cr><cr>
  vnoremap <silent> <leader>gg :<C-\>e utilgrep#Grep(2,1)<cr><cr>
  nnoremap <silent> <leader>vv :<C-\>e utilgrep#Grep(1,0)<cr><cr>
  vnoremap <silent> <leader>vv :<C-\>e utilgrep#Grep(1,1)<cr><cr>

  function! SelectedReplace()
      let l:save_cursor = getcurpos()
      let sel_str = utils#GetSelected('')
      let nr = winnr()
      if getwinvar(nr, '&syntax') == 'qf'
          call setpos('.', l:save_cursor)
          return "%s/\\<". sel_str. '\>/'. sel_str. '/gI'
      else
          normal [[ma%mb
          call signature#sign#Refresh(1)
          redraw
          call setpos('.', l:save_cursor)
          return "'a,'bs/\\<". sel_str. '\>/'. sel_str. '/gI'
      endif
  endfunction

  " script-eval
  "vnoremap <silent> <leader>ee :<c-u>call vimuxscript#ExecuteSelection(1)<CR>
  "nnoremap <silent> <leader>ee :<c-u>call vimuxscript#ExecuteSelection(0)<CR>
  "nnoremap <silent> <leader>eg :<c-u>call vimuxscript#ExecuteGroup()<CR>

  "" execute file that I'm editing in Vi(m) and get output in split window
  "nnoremap <silent> <leader>x :w<CR>:silent !chmod 755 %<CR>:silent !./% > /tmp/vim.tmpx<CR>
  "            \ :tabnew<CR>:r /tmp/vim.tmpx<CR>:silent !rm /tmp/vim.tmpx<CR>:redraw!<CR>
  nnoremap <silent> <leader>ee :call SingleCompileSplit() \| SCCompileRun<CR>
  nnoremap <silent> <leader>eo :SCViewResult<CR>
  "vnoremap <silent> <unique> <leader>ee :NR<CR> \| :w! /tmp/1.c<cr> \| :e /tmp/1.c<cr>

  autocmd FileType javascript nnoremap <buffer> <leader>ee  :DB mongodb:///test < %
  autocmd FileType javascript vnoremap <buffer> <leader>ee  :'<,'>w! /tmp/vim.js<cr><cr> \| :DB mongodb:///test < /tmp/vim.js<cr><cr>

  function! SingleCompileSplit()
    if winwidth(0) > 200
       let g:SingleCompile_split = "vsplit"
       let g:SingleCompile_resultsize = winwidth(0)/2
    else
       let g:SingleCompile_split = "split"
       let g:SingleCompile_resultsize = winheight(0)/3
    endif
  endfunction

  " vim-eval
  let g:eval_viml_map_keys = 0
  autocmd FileType vim nnoremap <buffer> <leader>ec <Plug>eval_viml
  autocmd FileType vim vnoremap <buffer> <leader>ec <Plug>eval_viml_region

  " Test
  "nnoremap <silent> <leader>t :<c-u>R <C-R>=printf("python -m doctest -m trace --listfuncs --trackcalls %s \| tee log.test", expand('%:p'))<cr><cr>
  autocmd FileType python nnoremap <buffer> <leader>tt :<c-u>R <C-R>=printf("python -m doctest %s \| tee log.test", expand('%:p'))<cr><cr>
  autocmd FileType python nnoremap <buffer> <leader>tr :<c-u>R <C-R>=printf("python -m trace --trace %s \|  grep %s", expand('%:p'), expand('%'))<cr><cr>

  autocmd FileType c nnoremap <buffer> <leader>tt :<c-u>AsyncRun! tagme<cr>

  vnoremap <silent> <leader>yy :<c-u>call utils#GetSelected("/tmp/vim.yank")<CR>
  nnoremap <silent> <leader>yy  :<c-u>call vimuxscript#Copy() <CR>
  nnoremap <silent> <leader>yp :r! cat /tmp/vim.yank<CR>

  xnoremap * :<C-u>call utils#VSetSearch('/')<CR>/<C-R>=@/<CR>
  xnoremap # :<C-u>call utils#VSetSearch('?')<CR>?<C-R>=@/<CR>
  vnoremap // y:vim /\<<C-R>"\C/gj %

  " Search-mode: hit cs, replace first match, and hit <Esc>
  "   then hit n to review and replace
  vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
        \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
  onoremap s :normal vs<CR>

  nnoremap gf :<c-u>call utils#GotoFileWithLineNum()<CR>
  nnoremap <silent> <leader>gf :<c-u>call utils#GotoFileWithPreview()<CR>

  "autocmd WinEnter * if !utils#IsLeftMostWindow() | let g:tagbar_left = 0 | else | let g:tagbar_left = 1 | endif
  function! s:ToggleTagbar()
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
      let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
      let nerdtree_open = 0
    endif

    if nerdtree_open
      let g:tagbar_left = 0
      "let g:tagbar_vertical = 25
      "let NERDTreeWinPos = 'left'
    else
      if utils#IsLeftMostWindow()
        let g:tagbar_left = 1
      else
        let g:tagbar_left = 0
      endif
      "let g:tagbar_vertical = 0
    endif

    TagbarToggle
    "let tagbar_open = bufwinnr('__Tagbar__') != -1
    "if tagbar_open
    "  TagbarClose
    "else
    "  TagbarOpen
    "endif

    "" Jump back to the original window
    "let w:jumpbacktohere = 1
    "for window in range(1, winnr('$'))
    "  execute window . 'wincmd w'
    "  if exists('w:jumpbacktohere')
    "    unlet w:jumpbacktohere
    "    break
    "  endif
    "endfor
  endfunction

  function! s:R(cap, ...)
      if a:cap
          tabnew
          setlocal buftype=nofile bufhidden=hide syn=diff noswapfile
          exec ":r !". join(a:000)
      else
          tabnew | enew | exec ":term ". join(a:000)
      endif
  endfunction
  " :R ls -l   grab command output int new buffer
  " :R! ls -l   only show output in another tab
  "command! -nargs=+ -bang -complete=shellcmd R call s:R(<bang>1, <q-args>)
  command! -nargs=+ -bang -complete=shellcmd R execute ':NeomakeRun! '.<q-args>

  nnoremap <f3> :VimwikiFollowLink
"}

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
  "   " start logger
  "   silent! call s:log.info('hello world')
  "   " Check log
  "   $ tail -f /tmp/vim.log
"}}}

