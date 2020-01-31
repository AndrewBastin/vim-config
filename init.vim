
" Plugins (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-vetur', 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-ccls', 'coc-json', 'coc-yank', 'coc-prettier']

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'dikiaap/minimalist'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'tpope/vim-sleuth'
Plug 'romgrk/winteract.vim'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

" Autocmds
autocmd CursorHold * silent call CocActionAsync('highlight')

" Keybindings
map <C-\> :NERDTreeToggle <CR>
map <C-P> :Files <CR>
map <C-]> :TagbarToggle <CR>
map <C-L> :CocFix <CR>
map <C-S> :CocList<Space>symbols <CR>
map <C-G> :Git <CR>
map <C-F> :Rg <CR>
map <C-T> :term <CR>

nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j
nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l
nmap <leader>w :InteractiveWindow<CR>

" Switching splits when focused on terminal
tnoremap <C-Up> <C-\><C-n><C-W>k
tnoremap <C-Down> <C-\><C-n><C-W>j
tnoremap <C-Left> <C-\><C-n><C-W>h
tnoremap <C-Right> <C-\><C-n><C-W>l

" COC jumps
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>



xmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Configs
set number relativenumber
set nu rnu
set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


" Airline Configs
let g:airline#extensions#whitespace#enabled = 0


" Coloring
syntax on
colorscheme onedark


" Overiding onedark grey background
highlight Normal ctermbg=black


" FileType bindings
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
