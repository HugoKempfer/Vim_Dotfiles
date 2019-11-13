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
						\ 'colorscheme': 'gruvbox',
						\ 'active': {
						\   'left': [ [ 'mode', 'paste' ],
						\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
						\ },
						\ 'component_function': {
						\   'cocstatus': 'coc#status',
						\   'gitbranch': 'fugitive#head'
						\ },
						\ }

"*****************************************************************************
"" Haskell
"*****************************************************************************
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"*****************************************************************************
"" COC
""*****************************************************************************
set hidden

inoremap <silent><expr> <TAB>
						\ pumvisible() ? "\<C-n>" :
						\ <SID>check_back_space() ? "\<TAB>" :
						\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
		if &filetype == 'vim'
				execute 'h '.expand('<cword>')
		else
				call CocAction('doHover')
		endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Error signs
highlight link CocErrorSign GruvboxRed
highlight link CocWarningSign GruvboxOrange
highlight link CocInfoSign GruvboxBlue
highlight link CocHintSign GruvboxCyan

"*****************************************************************************
"" Haskell
"*****************************************************************************
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"*****************************************************************************
"" Chromatica (better syntax highlighting)
"*****************************************************************************
let g:chromatica#enable_at_startup=1

"*****************************************************************************
"" Rainbow brackets
"*****************************************************************************
"
augroup rainbow
		autocmd!
		autocmd FileType c,cpp,rs,dart RainbowParentheses
augroup END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"
"*****************************************************************************
"" Grammalecte
"*****************************************************************************
let g:grammalecte_cli_py='/usr/bin/grammalecte-cli.py'
nmap <leader>gv :GrammalecteCheck<cr>
nmap <leader>gvc :GrammalecteClear<cr>
