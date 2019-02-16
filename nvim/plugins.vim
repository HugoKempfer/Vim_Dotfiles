Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
Plug 'morhetz/gruvbox'
"Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/Conque-GDB'
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
Plug 'kylef/apiblueprint.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fabi1cazenave/suckless.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'racer-rust/vim-racer'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'arakashic/chromatica.nvim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'



" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'


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
