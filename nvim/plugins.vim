Plug 'ron-rs/ron.vim'
Plug 'dpelle/vim-Grammalecte'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
Plug 'morhetz/gruvbox'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fabi1cazenave/suckless.vim'
Plug 'junegunn/fzf'
Plug 'roxma/nvim-yarp'
Plug 'arakashic/chromatica.nvim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'ftilde/vim-ugdb'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'kylef/apiblueprint.vim'
Plug 'junegunn/rainbow_parentheses.vim'

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
