" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

syntax enable     "Enable syntax processing


" COLOURS {{{
" Additional colour-schemes
	colorscheme badwolf
	set termguicolors
" }}}

" TABBING {{{
" Virtual-spaces per tab (editing) and shift, tab is spaced
	set tabstop=4 softtabstop=0 expandtab shiftwidth=4
" Smart-indenting at new-line, copy indents
	set smartindent autoindent
" }}}

" UI-CONF {{{
" Hightlight matching parentheses, include line-numbers, last command shown
	set showmatch number showcmd 
	set cursorline    "Highlight current line

	filetype indent on    "Load filetype-specific indent files
" Visual autocomplete for ex commands, minimise redraws
	set wildmenu lazyredraw
" }}}

" SEARCHING {{{
" Search automatically, highlight search
	set incsearch hlsearch
" Turn off search highlights using SPACE
	nnoremap <leader><space> :nohlsearch<CR>
" }}}

" FOLDING {{{
" Enable folding, open folds by default, maxed-out folds
	set foldenable foldlevelstart=10 foldnestmax=10
"Open/close folds
	nnoremap <space> za
	set foldmethod=indent   "Fold based on indenting
" }}}

" MOVEMENT {{{
"Vertical movement with visual lines
	nnoremap j gj
	nnoremap k gk

"Movement to line beginning/end 
	nnoremap B ^
	nnoremap E $
"Remove OLD key-bindings
	nnoremap $ <nop>
	nnoremap ^ <nop>

"Highlight last text
	nnoremap gV `[v`]
" }}}

" LEADER-SHORTCUTS {{{
	let mapleader=","     "Change leader
"Simplify ESC-sequence
	inoremap jk <Esc>
"Toggle GUNDO
	nnoremap <leader>u :GundoToggle<CR>

"Edit vimrc/zshrc, Load vimrc bindings
	nnoremap <leader>ev :vsp $MYVIMRC<CR>
	nnoremap <leader>ez :vsp ~/.zshrc<CR>
	nnoremap <leader>sv :source $MYVIMRC<CR>

"Save sessions
	nnoremap <leader>s :mksession<CR>
"Open ag.vim
	nnoremap <leader>a :Ag

"Copy-Paste to Clipboard
	set clipboard=unnamedplus
	noremap <Leader>y "*y
	noremap <Leader>p "*p
	noremap <Leader>Y "+y
	noremap <Leader>P "+p
" }}}

" CtrlP-SETTINGS {{{
	let g:ctrlp_match_window='bottom,order:ttb'   "Match with ttb
	let g:ctrlp_switch_buffer=0         "Open files with buffer
	let g:ctrlp_working_path_mode=0     "Allow changes to cwd
	let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'  "CtrlP-ag utilisation
" }}}

" LAUNCH-CONFIG {{{
	call pathogen#infect()      "Use pathogen
	call pathogen#runtime_append_all_bundles()

"Tmux mode - allows cursor change
if exists('$TMUX')
  let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
endif

"Autographs - Language Specific CONFIG
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rd :call <SID>StripTailingWhitespaces()
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  
  autocmd BufEnter MakerFile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" COMPILER-SPECIFIC {{
" Ex commands to run python3 on vim, use <F9> to run
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" }}}

" BACKUPS {{{
set backup    "Enable backup support
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" CUSTOM-FUNCTIONALITY {{{
" Toggle between number and relative-number
function! ToggleNumber()
  if(&relativenumber==1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

" Strip tailing EOL whitespaces
function! <SID>StripTailingWhitespaces()
  "Save last search & cursor position
  let _s=@/
  let l=line(".")
  let c=col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l,c)
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
