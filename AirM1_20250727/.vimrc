set t_Co=256

set encoding=utf8                   " UTF8
syntax enable                       " 語法上色
set number                          " 顯示行號
set softtabstop=4                   " 使得按退格鍵時可以一次刪掉 4 個空格
set expandtab                       " 使用空白取代Tab
set tabstop=4                       " 設定tab長度爲4
set backspace=2                     " 在insert模式啟用backspace鍵，給Mac使用的，Windows and Linux不用設定
set shiftwidth=2                    " 設定縮排長度爲4的方法 

set ic                              " 搜尋不分大小寫
"set scrolloff=3                     " 捲動時保留底下3行

"set relativenumber                  " 顯示相對行號(以游標為中心點，向上下開始編號)
"set ai                              " 設定自動縮排，但貼去不同的地方時可能會亂掉，這時可以手動切換至貼上模式 :set paste 再進行貼上
"set background=dark                 " 啟用暗色背景
"set bg=light                        " 啟用亮色背景
"set cursorline                      " 突出顯示當前行(水平)
"set cursorcolumn                    " 高亮當前列(垂直)

"set ruler                           " 設定尺規，設定完畢右下方會出現一個這樣的東西，顯示檔名、總行數、總字元數、目前第幾行、在第幾個字元、在文章的什麼位置，但你有設定Powerline的時候就用不到了
set showmatch                       " 顯示括號配對情況
set nocompatible                    " 讓vim在非相容模式下工作(不相容vi)
set incsearch                       " 搜索時在未完全輸入完畢要檢索的文本時就開始檢索，可以使用 ctrl+n 來達成自動補完的功能
set hlsearch
set formatoptions+=r                " 自動註解
setglobal fileencoding=utf-8        " 用來設定特定檔案的編碼，使用setglobal 可以設定它的預設值，fileencoding若設定為空字串則表示跟 encoding 所指定的編碼方式相同

set autoindent
set ignorecase
set hidden

"autocmd Filetype html,xml,eruby,javascript,css,scss setlocal ts=4 sts=4 sw=4
"autocmd Filetype ruby,yaml,snippets setlocal ts=2 sts=2 sw=2

" Key Mapping
" inoremap  triger_char  mapping_str
" 映射指令     觸發字元     映射字串
" 註：<LEFT> 為向右鍵字元，<CR>代表換行，<ESC>跳出
" 另外inoremap後面無法再使用"雙引號來註解

let mapleader = ","
let g:mapleader = ","
nnoremap <silent> <leader>e :FZF -m<CR>
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
map <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>g :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

imap kl <Esc>
nnoremap ok :w<CR>

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>l :ls<CR> "通過索引快速跳轉
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

map <C-n> :VimMultipleCursors<CR>
let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"airline{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="luna"
set t_Co=256
set laststatus=2
"}

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'easymotion/vim-easymotion'
"Plug 'jiangmiao/auto-pairs'
"Plug 'KurtPreston/vim-autoformat-rails'
"Plug 'mileszs/ack.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'terryma/vim-multiple-cursors'
"Plug 'wakatime/vim-wakatime'
"Plug 'rstacruz/sparkup'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'tpope/vim-rails'
call plug#end()
"Plug 'Valloric/YouCompleteMe'

"啟用mouse support，可以用滑鼠、觸控板控制游標，以及上下捲動畫面
"set mouse=a
