"*****************************************************************************
"" Languages specific
"*****************************************************************************
Plug 'kylef/apiblueprint.vim'
Plug 'ron-rs/ron.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"*****************************************************************************
"" Navigation / Buffers
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/grep.vim'
Plug 'kien/ctrlp.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf'

"*****************************************************************************
"" Editor and UI
"*****************************************************************************
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'fabi1cazenave/suckless.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'arakashic/chromatica.nvim'
Plug 'shinchu/lightline-gruvbox.vim'

"*****************************************************************************
"" Integration
"*****************************************************************************
Plug 'dpelle/vim-Grammalecte'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ftilde/vim-ugdb'

"*****************************************************************************
"" Too lazy to classify
"*****************************************************************************
Plug 'vim-scripts/CSApprox'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/denite.nvim'

if isdirectory('/usr/local/opt/fzf')
		Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
		Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
		let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}
if v:version >= 703
		Plug 'Shougo/vimshell.vim'
endif
