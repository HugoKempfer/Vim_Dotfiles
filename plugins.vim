"*****************************************************************************
"" Languages specific
"*****************************************************************************
Plug 'kylef/apiblueprint.vim'
Plug 'ron-rs/ron.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'udalov/kotlin-vim'
Plug 'janko/vim-test'

"*****************************************************************************
"" Navigation / Buffers
"*****************************************************************************
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }

"*****************************************************************************
"" Editor and UI
"*****************************************************************************
Plug 'vimpostor/vim-lumen'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'rakr/vim-one'
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
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'

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
