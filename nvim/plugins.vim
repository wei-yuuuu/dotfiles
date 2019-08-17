" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy finding
Plug 'junegunn/fzf'

" Move lines
Plug 'matze/vim-move'

" Commentary
Plug 'tpope/vim-commentary'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" quoting / parenthesizing made simple
Plug 'tpope/vim-surround'
" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" === Javascript Plugins === "
" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "
" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" JavaScript syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'kristijanhusak/vim-hybrid-material'

" Customized vim status line
Plug 'itchyny/lightline.vim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Numbers
Plug 'myusuf3/numbers.vim'

" Initialize plugin system
call plug#end()

