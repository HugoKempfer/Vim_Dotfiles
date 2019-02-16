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

""*****************************************************************************
""" Deoplete
""*****************************************************************************
"" Deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"
"*****************************************************************************
"" Tiling management
"*****************************************************************************

let g:suckless_tmap = 1
set splitbelow
set splitright
let g:suckless_tabline = 0
let g:suckless_guitablabel = 0
let g:suckless_min_width = 24      " minimum window width
let g:suckless_inc_width = 4       " width increment
let g:suckless_inc_height = 2      " height increment

"*****************************************************************************
"" Lightline
"*****************************************************************************
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"*****************************************************************************
"" Ale config
"*****************************************************************************
let g:ale_c_parse_makefile = 1
let b:ale_c_parse_makefile = 1

"*****************************************************************************
"" LSP override config
"*****************************************************************************
let g:LanguageClient_diagnosticsDisplay =  {
		\ 1: {
		\ "name": "Error",
		\ "texthl": "ALEError",
		\ "signText": ">>",
		\ "signTexthl": "ALEErrorSign",
		\ },
		\ 2: {
		\ "name": "Warning",
		\ "texthl": "ALEWarning",
		\ "signText": "--",
		\ "signTexthl": "ALEWarningSign",
		\ },
		\ 3: {
		\ "name": "Information",
		\ "texthl": "ALEInfo",
		\ "signText": "ℹ",
		\ "signTexthl": "ALEInfoSign",
		\ },
		\ 4: {
		\ "name": "Hint",
		\ "texthl": "ALEInfo",
		\ "signText": "➤",
		\ "signTexthl": "ALEInfoSign",
		\ },
		\ }
