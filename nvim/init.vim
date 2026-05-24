" Turn off backup file help file obvious than
set nobackup
set nowb
set noswapfile
" On normal, insert, visual, command
set mouse=a
" Use tab == 4 space
set expandtab
set tabstop=4
set shiftwidth=4
" Hiden symbol tab and space at head and tail
set list
set listchars=tab:\¦\
" Fold code follow language
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=5
" Show number on the left
set number
" Search not distinguish uppercase and lowercase
set ignorecase
" autocomplete always show whether just one symbol
set completeopt=menuone,noinsert,noselect
" Auto save file when using command
set autowrite
set autowriteall
" When we runing file it run command g++ name.cpp -o name
set makeprg=g++\ %\ -o\ %:r
" Format errors compiler to notification
set errorformat=%f:%l:%c:%m
" Auto pairs (), {}, []
let g:AutoPairsMapCR = 0
" Auto save when press escape
autocmd InsertLeave * silent! write
autocmd BufLeave,FocusLost * silent! write
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
" Regulate highlight syntax to 5000 so it avoid lag
set synmaxcol=5000
" Not draw screen when running
set lazyredraw
""''""""""""

      
autocmd BufNewFile,BufRead *.json set foldmethod=indent

syntax on

" =========================
" Clipboard
" =========================
if has('win32')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" =========================
" Auto reload file
" =========================
autocmd CursorHold,CursorHoldI * checktime
autocmd FocusGained,BufEnter * checktime

" =========================
" Floaterm
" =========================
nnoremap <F9> :FloatermToggle<CR>

let g:floaterm_shell = '/bin/zsh'

" =========================
" Resize pane
" =========================
nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" =========================
" Search highlighted text
" =========================
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap /<CR> :noh<CR>

" =========================
" Popup menu
" =========================
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" =========================
" Move line
" =========================
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" =========================
" Word movement
" =========================
inoremap <C-Right> <Esc>ea
inoremap <C-Left> <Esc>bi

" =========================
" coc.nvim Enter confirm
" =========================
inoremap <silent><expr> <CR> coc#pum#visible()
            \ ? coc#pum#confirm()
            \ : "\<CR>"


call plug#begin(stdpath('config').'/plugged')

  Plug 'm4xshen/autoclose.nvim'

  Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" File browser
  Plug 'preservim/nerdTree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'unkiwii/vim-nerdtree-sync'
  Plug 'jcharum/vim-nerdtree-syntax-highlight', {'branch': 'escape-keys'}

" File search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'

" Code intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag'

" Code syntax highlight
  Plug 'sheerun/vim-polyglot'
  
" Debugging
  Plug 'puremourning/vimspector'

" Source code version control 
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  Plug 'samoshkin/vim-mergetool'

" Fold 
  Plug 'tmhedberg/SimpylFold'

" Extension
"  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Exchange text 
  Plug 'tommcdo/vim-exchange'
  Plug 'mg979/vim-visual-multi'
  Plug 'terryma/vim-multiple-cursors'

" Snippet C++
  Plug 'SirVer/ultisnips'

  
" LSP + Autocomplete
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'

" Fuzzy finder để list hàm
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

" Highlight C++ ngon hơn
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Run code
  Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

  
  Plug 'terryma/vim-multiple-cursors'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" 1. Kích hoạt Theme
set termguicolors
let g:nightflyTransparent = 0
colorscheme nightfly


let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" Dòng này quan trọng: Tab cuối không nhảy nữa mà thoát snippet
let g:UltiSnipsRemoveSelectModeMappings = 0

" Default mapping
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_select_all_word_key = '<A-g>'

let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-b>'
let g:multi_cursor_prev_key            = '<C-g>'
let g:multi_cursor_skip_key            = '<C-t>'
let g:multi_cursor_quit_key            = '<Esc>'
" 2. Tùy chỉnh lại màu chữ cho đẹp hơn (Cách 1)
" 3. Cấu hình Airline & Bufferline
" --- Tùy chỉnh màu sắc đậm và sắc nét (Style Gitpod Dark) ---
" Đặt đoạn này dưới dòng colorscheme nightfly

highlight Normal       guifg=#FFFFFF            " Chữ thường trắng tinh cho rõ
highlight Comment      guifg=#484848  gui=bold  " Comment LightGreen
highlight Constant     guifg=#2FDBEB  gui=bold  " Number  Deepskyblue
highlight String       guifg=#E0FFFF            " String  LightCyan
highlight Function     guifg=#FFFF00  gui=bold  " Tên Function Yellow
highlight Keyword      guifg=#ED1ADC  gui=bold  " const, let, using (Tím hồng)
highlight Statement    guifg=#C586C0  gui=bold  " return, if, else (Ép màu đậm)
highlight Type         guifg=#05E605  gui=bold  " int, float, namespace (Xanh ngọc)
highlight Identifier   guifg=#2B92FF            " cout, std, biến (Xanh sky)
highlight PreProc      guifg=#FFFFFF            " #include White
highlight Operator     guifg=#00CED1            " Các dấu << >> ; =

highlight cppStatement guifg=#C586C0 gui=bold
highlight cppModifier  guifg=#C586C0 gui=bold




let g:airline_theme='nightfly'

autocmd VimEnter * call s:setup_bufferline()
function! s:setup_bufferline() abort
lua<<EOF
require("bufferline").setup{
  options = {
    indicator = { style = 'none' },
    diagnostics = "coc",
  }
}
EOF
endfunction

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Close buffer without exiting vim 
nnoremap <silent> <leader>bd :bp \| sp \| bn \| bd<CR>

" Other settings
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor


nnoremap <F5> :call RunCpp()<CR>


function! RunCpp()
  let file = expand('%')
  let out  = expand('%:r') 
  let errors = system('g++ ' . file . ' -o ' . out . ' 2>&1')
  if v:shell_error != 0
    cexpr errors
    copen
  else
let cmd = 'zsh -c "./' . out . ' && echo \"\" && echo \"[Press any key to close]\"; read -k1 2>/dev/null; exit"'
    belowright split
    resize 15
    execute 'terminal ' . cmd
    startinsert
  endif
endfunction

tnoremap <Esc> <C-\><C-q>


nnoremap <F6> :w<CR>:!g++ % -o %:r -L/usr/local/lib -I/usr/local/include -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 && ./%:r<CR>


lua << EOF
require("autoclose").setup()
EOF

nnoremap <C-b> :NERDTreeToggle<CR>

nnoremap <C-.> :bnext<CR>
nnoremap <C-,> :bprevious<CR>



let g:VM_maps = {}
let g:VM_maps['Add Cursor At Pos'] = '<Space>' 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
