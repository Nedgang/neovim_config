if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

" Required:
call plug#begin('~/.config/nvim/bundle/')

" Live actualisation
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif


" MY BUNDLES HERE :
" Refer to |:Plug-examples|.

" Languages forge
        " prolog support
		Plug 'mndrix/prolog.vim'
        " ASP support
                Plug 'aluriak/asp.vim'
        " Rust support
                Plug 'rust-lang/rust.vim'
        " TOML support
                Plug 'cespare/vim-toml'
        " markdown support
                Plug 'tpope/vim-markdown'
        " python
                Plug 'kh3phr3n/python-syntax'
                let python_highlight_all = 1
                Plug 'hynek/vim-python-pep8-indent'
        " latex
                Plug 'lervag/vimtex'
        " SPARQL
                Plug 'Omer/vim-sparql'
        " Snakemake
                Plug 'ibab/vim-snakemake'
" features
        " liste des fonctions/variables
		Plug 'vim-scripts/taglist.vim'
        " powerful file explorator (need unite)
		Plug 'Shougo/vimfiler.vim'
        " commenter des portions de code à la volée
		Plug 'aluriak/nerdcommenter'
        " lines of same indentation as text objects
                Plug 'michaeljsmith/vim-indent-object'
        " support de git
		Plug 'tpope/vim-fugitive'
        " multiple line insertion
		Plug 'terryma/vim-multiple-cursors'
        " complementation (synergies: vimshell, unite)
		Plug 'Shougo/neocomplcache.vim'
        " syntax checker
                "Plug 'scrooloose/syntastic'
        " complete abbreviations and research
                Plug 'tpope/vim-abolish'
        " vim bookmarks
		Plug 'MattesGroeger/vim-bookmarks'
        " snippets (synergies: neocomplcache)
                Plug 'Shougo/neosnippet'
                Plug 'Shougo/neosnippet-snippets'
        " subvertion with {} and coercition
                Plug 'tpope/vim-abolish'
        " . repeat whole maps
		Plug 'tpope/vim-repeat'
        " necessary for efficiency Unite, with options for automatize compilation
		Plug 'Shougo/vimproc.vim', { 'do': 'make' }
        " powerful finder of whatever you want
		Plug 'Shougo/unite.vim'
                Plug 'bronson/vim-visual-star-search'
        " Terminal in vim (need Unite)
		Plug 'Shougo/vimshell.vim'
        " dates management
                Plug 'tpope/vim-speeddating'
        " coloured and efficient HUI
                Plug 'bling/vim-airline'
                Plug 'vim-airline/vim-airline-themes'
        " vim tabularize
                Plug 'godlygeek/tabular'
        " vim snippets
                Plug 'Shougo/neosnippet'
                Plug 'Shougo/neosnippet-snippets'
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

" Configuration indent line
let g:indentLine_char = '|'

call plug#end()

" Required:
filetype plugin indent on

" vimrc begin here

"""""""""
" VIMRC "
"""""""""
" set tagbar shortcut
    nmap <F8> :TagbarToggle<CR>

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
nmap ®® <Plug>BookmarkToggle
nmap ®i <Plug>BookmarkAnnotate
nmap ®o <Plug>BookmarkAnnotate TODO<cr>
nmap ®a <Plug>BookmarkShowAll
nmap ®þ <Plug>BookmarkNext
nmap ®ß <Plug>BookmarkPrev
nmap ®c <Plug>BookmarkClear
nmap ®d <Plug>BookmarkClear
nmap ®x <Plug>BookmarkClearAll

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

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
" error in source code highlighted in blue
highlight SyntasticError        ctermbg=blue ctermfg=NONE
highlight SyntasticWarning      ctermbg=blue ctermfg=NONE
" sign in sign column are in red and yellow
highlight SyntasticErrorSign    cterm=bold ctermbg=NONE ctermfg=red
highlight SyntasticWarningSign  ctermbg=NONE ctermfg=yellow
" current line in error buffer is highlighted in blue
highlight Search                ctermbg=blue ctermfg=NONE

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
noremap <F1> :TlistToggle<cr>
noremap <F2> :VimFilerBuffer<cr>
noremap <F4> :VimShellTab<cr>
noremap <F6> :Gstatus<cr>
noremap <F7> :Gcommit<cr>
noremap <F9> :VimShellInteractive make<cr>

" NerdTree shortcut
noremap <F3> :NERDTreeToggle<CR>


" paste (before|after) and leave cursor at the beginning 
noremap œ P`[
noremap Œ p`[

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

" NEOCOMPLCACHE settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_max_list = 20

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Use delimiter completion.
let g:neocomplcache_enable_auto_delimiter = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() 
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode (Not recommended)
inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"

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

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" setup: vimtex
let g:vimtex_mappings_enabled = 0
let g:vimtex_latexmk_background = 1
let g:vimtex_quickfix_autojump = 1
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_syntax_minted = [
      \ { 'lang' : 'c', },
      \ { 'lang' : 'cpp', },
      \ { 'lang' : 'python', },
      \]
map <leader>ls <plug>(vimtex-view)
map <leader>la <plug>(vimtex-%)
map <leader>lu <plug>(vimtex-create-cmd)
map <leader>li <plug>(vimtex-close-env)
map <leader>le <plug>(vimtex-errors)
map <leader>lw <plug>(vimtex-change-env)
map <leader>lc :VimtexWordCount<cr>
" text objects (Environment, delimiter, Paragraph ; exclusive (a) and inclusive (i))
map <leader>lea <plug>(vimtex-ae)
map <leader>lei <plug>(vimtex-ie)
map <leader>lda <plug>(vimtex-ad)
map <leader>ldi <plug>(vimtex-id)
map <leader>lpa <plug>(vimtex-ap)
map <leader>lpi <plug>(vimtex-ip)

