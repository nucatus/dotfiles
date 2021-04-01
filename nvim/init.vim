call plug#begin()

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

nmap ; :Files<CR>

let mapleader = ","

" --General configurations
" edit and save the vimrc file.
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set number
set relativenumber
set tw=80

autocmd FileType yaml,yml,vim,py setlocal ts=2 sts=2 sw=2 expandtab

" -Plugin configurations
" --Gruvebox configuration
colorscheme gruvbox
set background=dark 

" --COC plugin 
" shortcuts definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" enable COC if for specific file types only
let s:my_coc_file_types = ['c', 'cpp', 'h', 'vim', 'sh', 'py', 'R']

function! s:disable_coc_for_type()
  if index(s:my_coc_file_types, &filetype) == -1
    let b:coc_enabled = 0
  endif
endfunction

augroup CocGroup
  autocmd!
  autocmd BufNew,BufEnter * call s:disable_coc_for_type()
augroup end
" end plugin configuration
