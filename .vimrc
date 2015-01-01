"基本設定
set shortmess+=I		"起動時のメッセージを消す
set nocompatible		"vi互換モードオフ
set backupdir=$HOME/vimbackup	"バックアップファイルのディレクトリを指定
set noswapfile                  " スワップファイル作らない
set autoread                    " 他で書き換えられたら自動で読み直す
set noswapfile                  " スワップファイル作らない
set hidden                      " 編集中でも他のファイルを開けるようにする
"---------------------------------------------------------------------------------
"表示系
set showmatch			" 閉括弧が入力された時、対応する括弧を強調する
set showcmd                     " 入力中のコマンドをステータスに表示
set showmode                    " INSERTなどのステータスを表示する
set number                      " 行番号の表示
set notitle          
           " タイトルバーに編集中のファイル名などを表示
set ruler                       " カーソル位置情報を表示
"---------------------------------------------------------------------------------
"インデント系
set autoindent                  " ENTER 時に自動でインデント
set smartindent                 " 賢い自動インデント
set expandtab                   " タブ文字の代わりに同じ幅の空白文字を入れる
set tabstop=4                   " タブ文字のインデント幅
set shiftwidth=4                " 「>>」,「<<」操作のシフト幅
"---------------------------------------------------------------------------------
"全角、タブの判別
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_

""全角スペースをハイライト表示
function! ZenkakuSpace()
        highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

    if has('syntax')
        augroup ZenkakuSpace
            autocmd!
            autocmd ColorScheme       * call ZenkakuSpace()
            autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
        augroup END
        call ZenkakuSpace()
    endif
"--------------------------------------------------------------------------------
"Neobundle
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/.vim/bundle/'))
    endif
    " originalrepos on github
    NeoBundle 'Shougo/neobundle.vim'
    let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
    " NeoBundle 'VimClojure'
    " NeoBundle 'Shougo/vimshell'
    " NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'junegunn/vim-easy-align'
    " NeoBundle 'Shougo/neosnippet'
    " NeoBundle 'jpalardy/vim-slime'
    " NeoBundle 'scrooloose/syntastic'
    " NeoBundle 'https://bitbucket.org/kovisoft/slimv'
    NeoBundle 'taglist.vim'
    NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
    NeoBundle 'https://github.com/wesleyche/Trinity.git'
     filetype plugin indent on     " required!
     filetype indent on
     syntax on
     call neobundle#end()

" neocomplcache

" Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Define dictionary.
 let g:neocomplcache_dictionary_filetype_lists = {
     \ 'default' : ''
         \ }

         " Plugin key-mappings.
         inoremap <expr><C-g>     neocomplcache#undo_completion()
         inoremap <expr><C-l>     neocomplcache#complete_common_string()

         " Recommended key-mappings.
         " <CR>: close popup and save indent.
         inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
         function! s:my_cr_function()
           return neocomplcache#smart_close_popup() . "\<CR>"
           endfunction
          " <TAB>: completion.
           inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
           " <C-h>, <BS>: close popup and delete backword char.
           inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><C-y>  neocomplcache#close_popup()
           inoremap <expr><C-e>  neocomplcache#cancel_popup()

