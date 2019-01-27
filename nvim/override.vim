"*****************************************************************************
"" Default colorscheme
"*****************************************************************************
colorscheme gruvbox

"*****************************************************************************
"" NerdTree
"*****************************************************************************
map <C-e> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-K> :bprev<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-p> :ctrlp_map<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim

"*****************************************************************************
"" Visual
"*****************************************************************************
set colorcolumn=80
highlight ColorColumn guibg=grey
set autoindent
set noexpandtab
let g:indentLine_setColors = 0
set conceallevel=1
let g:indentLine_conceallevel=1
set list lcs=tab:\|\ 

"*****************************************************************************
"" Deoplete
"*****************************************************************************
" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"*****************************************************************************
"" Deoplete
"*****************************************************************************
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

"*****************************************************************************
"" Ale config
"*****************************************************************************
let g:ale_c_parse_makefile = 1
let b:ale_c_parse_makefile = 1
