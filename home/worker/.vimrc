set shiftwidth=4  

set softtabstop=4 

set tabstop=4 

set number

set cursorline

syn on

set fileformat=unix

set laststatus=2

set showtabline=2

set autoindent

set smartindent

set fillchars+=vert:\ 

"Coc.nvim

set hidden

set nobackup

set nowritebackup

set updatetime=300

set shortmess+=c

set signcolumn=yes

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

func! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
endfunc

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

filetype plugin indent on

inoremap <C-c> <ESC>:

inoremap ( ()<ESC>i

inoremap [ []<ESC>i

inoremap { {}<ESC>i

""inoremap < <><ESC>i

colorscheme oceandeep

filetype on

set encoding=utf-8

set rtp+=/usr/share/powerline/bindings/vim/

autocmd vimenter * NERDTree

autocmd vimenter * vert res -5

set t_Co=256

bel ter

res 7

autocmd VimEnter * wincmd l

autocmd VimEnter * wincmd k

func SkipPair(chara)  
	if getline('.')[col('.') - 1] == a:chara[0]  
	    return "\<ESC>la"  
    else  
	    return a:chara
	endif 
endfunc

func SSkip(chara)
	return SkipPair(join([a:chara, "\<Left>"], ""))
endfunc

inoremap ) <c-r>=SkipPair(')')<CR>
inoremap ] <c-r>=SkipPair(']')<CR>
inoremap } <c-r>=SkipPair('}')<CR>
inoremap ' <c-r>=SSkip("''")<CR>
inoremap " <c-r>=SSkip('""')<CR>

func EnterIn()
	if getline('.')[col('.') - 2] == '{'
	call feedkeys("\n\n\<Up>\t")
		return "\t"
	else
		return "\n"
	endif
endfunc

inoremap <CR> <c-r>=EnterIn()<CR>

func Strt()
	let pwdn=expand('%:p')
	write
	wincmd l
	call term_sendkeys(bufnr("%"), ".L ")
	call term_sendkeys(bufnr("%"), pwdn)
	call term_sendkeys(bufnr("%"), "\<CR>")
endfunc

func Sppm(fn)
	call setline(line('$') + 1,"i")
	call timer_start(300, { tid -> execute(a:fn)})
endfunc

func Spm()
	bel lopen
	wincmd j
	bd!
	resize +3
	vert ter zsh -c "root; zsh"
	wincmd x
	call cursor(line('$'),0)
	call feedkeys("dd")
	call timer_start(300, { tid -> execute('call feedkeys("i")')})
endfunc

func Tpm()
	bel lopen
	wincmd j
	bd!
	resize +3
	wincmd j
	vert ter
	wincmd =
	wincmd k
	call cursor(line('$'),0)
	call feedkeys("dd")
	call timer_start(300, { tid -> execute('call feedkeys("i")')})
endfunc

map <S-t> :call Sppm('call Spm()')<CR>
map <S-d> :call Sppm('call Tpm()')<CR>
map <S-y> :call Strt()<CR><CR>

map <C-N> :tabnew<CR>:NERDTree<CR>:vertical resize -5<CR>:wincmd l<CR>:bel ter<CR><C-w><S-n>:resize 7 <CR><S-i><C-w><C-k>

"map <C-X> :windo bd!<CR><C-w><S-n>:tabclose!<CR>

map <C-X> :windo bd!<CR>

map <C-L> :tabn<CR>

map <C-H> :tabp<CR>

map <C-E> :qa!<CR>  

map <C-r> :w<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#disable_auto_complete = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {'default' : '','vimshell' : $HOME.'/.vimshell_hist','scheme' : $HOME.'/.gosh_completions'}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
set backspace=indent,eol,start
