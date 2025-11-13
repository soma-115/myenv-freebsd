" ------------------------------
" vim-plug の初期設定
" ------------------------------
call plug#begin('~/.vim/plugged')

" NERDTree - ファイルエクスプローラー
Plug 'preservim/nerdtree'

" vim-airline - ステータスラインの強化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

call plug#end()

" ------------------------------
" NERDTree の設定
" ------------------------------
" Vim 起動時に NERDTree を開く（オプション）
autocmd vimenter * NERDTree

" NERDTree をトグルするキー設定（ctrl+e）
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" ------------------------------
" vim-airline の設定
" ------------------------------
" パワーラインフォントがある場合は true にする
let g:airline_powerline_fonts = 1

" テーマを指定（例: 'dark', 'molokai' 等。好みで変更可能）
let g:airline_theme = 'angr'

" airline の拡張情報に git branch を表示する（fugitiveが必要）
let g:airline#extensions#branch#enabled = 1

" ------------------------------
" 見た目や動作の微調整（任意）
" ------------------------------
set number
set cursorline
syntax enable
set hlsearch
set incsearch
set ignorecase
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
