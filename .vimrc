" plugins
        call plug#begin()
                Plug 'preservim/nerdtree'               " project tree
                Plug 'morhetz/gruvbox'                  " colors
        Plug 'valloric/youcompleteme'           " completion engine
        Plug 'tpope/vim-fugitive'               " git integration
        Plug 'airblade/vim-gitgutter'           " git lines diff
        Plug 'kien/ctrlp.vim'                   " project search
        Plug 'easymotion/vim-easymotion'        " motions
        Plug 'rking/ag.vim'                     " grep
        Plug 'octol/vim-cpp-enhanced-highlight' " c++ syntax highlight
        Plug 'Raimondi/delimitMate'             " auto closing braces etc
        Plug 'vhdirk/vim-cmake'                 " cmake plugin
        Plug 'bling/vim-airline'                " airline
        Plug 'rhysd/vim-clang-format'           " clang-format
        Plug 'chilledheart/vim-clangd'          " clangd
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'                 " command-line fuzzy finder
    call plug#end()

set clipboard=unnamedplus

" NERDTree
    let g:NERDTreeWinSize = 60

" colors
        colorscheme gruvbox
        set background=dark

        set hlsearch
        set incsearch

        syntax on

" basic options
        set autoindent
        set clipboard=unnamed
        set expandtab
        set number
        set shiftwidth=4
        set tabstop=4

" leader key
    let g:mapleader=','

" YCM options
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_min_num_of_chars_for_completion=1

" cpp-enhanced-highlight
    let g:cpp_class_scope_highlight=1
    let g:cpp_member_variable_highlight=1
    let g:cpp_class_decl_highlight=1
    let g:cpp_posix_standard=1
    let g:cpp_experimental_simple_template_highlight=1
    let g:cpp_experimental_template_highlight=1
    let g:cpp_concepts_highlight=1

" windows moving and creation
    " function
        function! WinMove(key)
            let t:curwin = winnr()
            exec "wincmd ".a:key
            if (t:curwin == winnr())
                if (match(a:key,'[jk]'))
                    wincmd v
                else
                    wincmd s
                endif
                exec "wincmd ".a:key
            endif
        endfunction

    " mappings
        map <silent> <C-h> :call WinMove('h')<CR>
        map <silent> <C-j> :call WinMove('j')<CR>
        map <silent> <C-k> :call WinMove('k')<CR>
        map <silent> <C-l> :call WinMove('l')<CR>


filetype plugin on
map <C-f> :py3f /usr/share/clang/clang-format-12/clang-format.py<cr>

let g:clang_library_path='/usr/lib/llvm-11/lib/libclang.so.1'
let g:clang_complete_select=1
let g:clang_complete_auto=1
let g:clang_complete_copen=0
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
nmap <leader>uq :call g:ClangUpdateQuickFix()<CR>

set updatetime=100
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" key mappings
    " NERDTree
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>

    " easymotion
    map  <Leader> <Plug>(easymotion-prefix)

    :inoremap <C-v> <ESC>"+pa
    :vnoremap <C-c> "+y
    :vnoremap <C-d> "+d

    " escape remapping
    nmap <c-c> <esc>
    imap <c-c> <esc>
    vmap <c-c> <esc>
    omap <c-c> <esc>
    imap jj <esc>

    " enter without inserting mode
    map <Enter> o<esc>
    map <S-Enter> O<esc>
