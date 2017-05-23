" Required:
call plug#begin('~/.config/nvim/bundle/')

" Live actualisation
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif


" MY BUNDLES HERE :
" Refer to |:Plug-examples|.

" Languages forge
        " ASP support
                Plug 'aluriak/asp.vim'
        " Rust support
                Plug 'rust-lang/rust.vim'
                Plug 'racer-rust/vim-racer'
        " markdown support
                Plug 'tpope/vim-markdown'
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
                Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
        " python
                Plug 'vim-python/python-syntax', { 'for': 'python' }
                let g:python_highlight_all = 1
                Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
        " SPARQL
                Plug 'Omer/vim-sparql'
        " Snakemake
                Plug 'ibab/vim-snakemake'
" features
        " liste des fonctions/variables
		Plug 'vim-scripts/taglist.vim'
        " commenter des portions de code à la volée
		Plug 'aluriak/nerdcommenter'
        " lines of same indentation as text objects
                Plug 'michaeljsmith/vim-indent-object'
        " multiple line insertion
		Plug 'terryma/vim-multiple-cursors'
        " vim snippets
                Plug 'Shougo/neosnippet'
                Plug 'Shougo/neosnippet-snippets'
        " complementation (synergies: neosnippet)
                Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
                let g:deoplete#enable_at_startup = 1
        " vim bookmarks
		Plug 'MattesGroeger/vim-bookmarks'
        " subvertion with {} and coercition
                Plug 'tpope/vim-abolish'
        " . repeat whole maps
		Plug 'tpope/vim-repeat'
        " coloured and efficient HUI
                Plug 'bling/vim-airline'
                Plug 'vim-airline/vim-airline-themes'
        " vim tabularize
                Plug 'godlygeek/tabular'

        " vim indent guides
                Plug 'Yggdroot/indentLine' 
        " git support: commit in vim + gitconfig indent and syntax
                Plug 'tpope/vim-fugitive'
                Plug 'tpope/vim-git'
                Plug 'airblade/vim-gitgutter'
        " tagbar
                Plug 'majutsushi/tagbar'
        " nerdTree, activated on command
                Plug 'scrooloose/nerdtree'
        " Colors themes
                Plug 'flazz/vim-colorschemes'

" Configuration indent line
let g:indentLine_char = '|'

call plug#end()

" Required:
filetype plugin indent on

" vimrc begin here

"""""""""
" VIMRC "
"""""""""
"set colorscheme
colorscheme vividchalk

" pour que l'indentation avec tab soit la même qu'avec les chevrons
set shiftwidth=4        "indentation = N cases
set smarttab            "chevrons équivalent à la touche tab
set nu                  "affichage des numéros de ligne
set autoindent          "indentation gardée après saut de ligne
set expandtab           "pas de tab, uniquement des espaces

" conceal setup (no conceal at all, especially in latex)
set conceallevel=0
let g:tex_conceal= ''

" Mark efficiently tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Details
set nomodeline          " security about modelines
set mouse=a             " mouse for all modes
set pastetoggle=<F10>   " Use <F10> to toggle between 'paste' and 'nopaste'
set wildmenu            " Better command-line completion

" Status line
set statusline=%{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

" airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
"to fix the font and lot of strange characters and colors
let g:airline_theme='dark'
set encoding=utf-8
set t_Co=256

" session manager have the default comportement, except that is not save the
" local and global mappings/options.
set sessionoptions=blank,buffers,sesdir,winpos,folds,help,tabpages,winsize

" Abolish
cabbrev S Subvert
nmap lr <Plug>Coerce

" Remap and shortcuts for vim-bookmarks
nmap te <Plug>BookmarkToggle
nmap ti <Plug>BookmarkAnnotate
nmap tt <Plug>BookmarkAnnotate TODO<cr>
nmap ta <Plug>BookmarkShowAll
nmap tn <Plug>BookmarkNext
nmap tm <Plug>BookmarkPrev
nmap ts <Plug>BookmarkClear
nmap tc <Plug>BookmarkClearAll

"Enables line centering when jumping to bookmark
let g:bookmark_center = 1
"color of sign column
highlight SignColumn ctermbg=NONE
highlight BookmarkSign ctermbg=NONE ctermfg=LightGreen

" vimfiler module definitions
let g:vimfiler_as_default_explorer = 1

" For multiple cursors :
let g:multi_cursor_exit_from_insert_mode = 0 " don't quit with escape in insert mode
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
        set conceallevel=2 concealcursor=i
endif

" Touche leader
let mapleader = ","

"Abbréviations d'ordre générales
ab actual source ~/.vimrc
ab tq tabclose

" Fx assigns
noremap <F2> :Gstatus<cr>
noremap <F3> :Gcommit<cr>
noremap <F4> :NERDTreeToggle<CR>
    nmap <F8> :TagbarToggle<CR>

" Modif selon type de fichier
filetype plugin indent on       "Indentation selon extension de fichier (nécessaire pour vundle)
syntax on                       "affichage des couleurs
au BufNewFile,BufRead *.pde setf arduino
au BufNewFile,BufRead *.mkd setf mkd
au BufNewFile,BufRead *.adb setf ada*/
au BufNewFile,BufRead *.ads setf ada*/
au BufNewFile,BufRead *.py  setf python 
au BufNewFile,BufRead *.rs  setf rust
au BufNewFile,BufRead *.tex set encoding=utf-8
au BufNewFile,BufRead *.rb set shiftwidth=2
au BufNewFile,BufRead {M,m}akefile set noexpandtab


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Highlight carac past column 80
augroup vimrc_autocmds
        autocmd!
        autocmd FileType python highlight Excess guibg=Green ctermbg=Grey
        autocmd FileType python match Excess /\%80v.*/
        autocmd FileType python set nowrap
        autocmd FileType rust highlight Excess guibg=Green ctermbg=Grey
        autocmd FileType rust match Excess /\%80v.*/
        autocmd FileType rust set nowrap
augroup END
