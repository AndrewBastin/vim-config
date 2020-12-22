
" Plugins (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'npm install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-vetur', 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-python']

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'AndrewBastin/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'tpope/vim-sleuth'
Plug 'romgrk/winteract.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pantharshit00/vim-prisma'
Plug 'prettier/vim-prettier'
Plug 'voldikss/vim-floaterm'
Plug 'wakatime/vim-wakatime'

call plug#end()

" Autocmds
autocmd CursorHold * silent call CocActionAsync('highlight')

" Custom commands
command Config execute "e ~/.config/nvim/init.vim"

" Keybindings
map <C-\> :NERDTreeToggle <CR>
map <C-P> :GFiles <CR>
map <C-]> :TagbarToggle <CR>
map <C-L> :CocFix <CR>
map <C-S> :CocList<Space>symbols <CR>
map <C-G> :Git <CR>
map <C-T> :term <CR>

nmap ?? :Rg <CR>
nmap \\ :BLines <CR>
nmap \. :CocList<Space>outline <CR>
nmap \? :BCommits <CR>

nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j
nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l
nmap <leader>w :InteractiveWindow<CR>

" Switching splits when focused on terminal
tnoremap <leader>tt <C-\><C-n> :FloatermToggle<CR>
tnoremap <leader>tn <C-\><C-n> :FloatermNew fish<CR>
tnoremap <leader>tt <C-\><C-n> :FloatermToggle<CR>
tnoremap <leader>tp <C-\><C-n> :FloatermNext<CR>
tnoremap <leader>to <C-\><C-n> :FloatermPrev<CR>

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
set cursorline

" Floaterm configs
let g:floaterm_shell = "fish"
let g:floaterm_title = "terminal ($1/$2)"
let g:floaterm_keymap_new = "<Leader>tn"
let g:floaterm_keymap_prev = "<Leader>to"
let g:floaterm_keymap_next = "<Leader>tp"
let g:floaterm_keymap_toggle =  "<Leader>tt"

" Airline Configs
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Neovide Configs
let g:neovide_fullscreen=v:true


" Coloring
syntax on
colorscheme onedark
highlight CursorLine ctermbg=233 

" Overiding onedark grey background
highlight Normal ctermbg=black
highlight FloatermBorder ctermbg=black ctermfg=202

" FileType bindings
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
