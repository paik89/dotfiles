set term=screen-256color
set directory^=$HOME/.vim/tmp//

set encoding=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1
"set notermguicolors
"set background=dark

"
" .vimrc
"
" Vim configuration resource file. Specifies desired
" behavior for the vim editor.
"
:syntax on

:set showmode " Tell you if you're in insert mode
":set nowrap " Do not wrap lines longer than the window
:set wrapscan " Wrap to the top of the file while searching
:set ruler " Show the cursor position all the time
:set showmatch " Show matching [] () {} etc...
:set formatoptions+=ro " Automatically insert the comment character when
" you hit (r) or o/O (o) in a block comment.
:set backspace=2 " makes backspace work like you expect

:set ignorecase " makes searches case-insensitive
" Disable paren highlighting
" let loaded_matchparen = 1

:set tabstop=4 " Set the tabstop to 4 spaces
:set shiftwidth=4 " Shiftwidth should match tabstop
" :set cindent
" :set autoindent
:set smartindent " Let vim help you with your code indention
"filetype plugin indent on " load indent for auto indentation using gg=G

set mps+=<:>

" set linebreak
" set showbreak=+++\

" turn off autoindent during paste use the following command
" set paste
" set nopaste
" Paste Toggle mode using <Insert> key
set pastetoggle=<Ins>

" set mouse=a

" set textwidth=95
:set nobackup
:set nows
:set history=999

:set sw=4
:set sts=4
:set nocompatible
:set sc
:set sm
" set ic
:set ls=2
:set wmnu
:set scrolloff=2
:filet on
:set noexpandtab
:set incsearch
:set hlsearch

:set fileformats=unix

set tags=./tags,tags,/usr/src/linux/tags

" Change the highlight color for Comment and Special
" to Cyan. Blue is too dark for a black background.
" :highlight Comment term=bold ctermfg=cyan guifg=cyan
" :highlight Special term=bold ctermfg=cyan guifg=cyan
" :highlight Constant term=bold ctermfg=red guifg=cyan

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
" :autocmd BufNewFile,BufRead [Mm]akefile*,*.mk set noexpandtab

" map gs :call IwhiteToggle()<CR>

if &diff
	" diff mode
	set diffopt+=iwhite
endif

"===============================================================
"        Add File Header
"===============================================================
function AddHeaderV()
let s:line=0
call append(s:line,    "// +FILEHEADER+ ")
call append(s:line+1,  "//=================================================================================")
call append(s:line+2,  "// Company:  Innowireless")
call append(s:line+3,  "// Module Name:")
call append(s:line+4,  "// --------------------------------------------------------------------------------")
call append(s:line+5,  "// Version Control Information:")
call append(s:line+6,  "// $LastChangedDate$")
call append(s:line+7,  "// $LastChangedRevision$")
call append(s:line+8,  "// $LastChangedBy$")
call append(s:line+9,  "// $Id$")
call append(s:line+10, "// $HeadURL$")
call append(s:line+11, "//---------------------------------------------------------------------------------")
call append(s:line+12, "// Description:") 
call append(s:line+13, "//") 
call append(s:line+14, "//") 
call append(s:line+15, "//=================================================================================")
call append(s:line+16, "// -FILEHEADER- ")
call append(s:line+17, "")
call append(s:line+18, "module (")
call append(s:line+19, ");")
call append(s:line+20, "")
call append(s:line+21, "/*---------------------------------------------------------------------------------")
call append(s:line+22, "	Local Variable")
call append(s:line+23, "---------------------------------------------------------------------------------*/")
call append(s:line+24, "")
call append(s:line+25, "/*---------------------------------------------------------------------------------")
call append(s:line+26, "	Function")
call append(s:line+27, "---------------------------------------------------------------------------------*/")
call append(s:line+28, "")
call append(s:line+29, "endmodule")
unlet s:line
endfunction

function AddHeaderS()
let s:line=0
call append(s:line,    "// +FILEHEADER+ ")
call append(s:line+1,  "//=================================================================================")
call append(s:line+2,  "// Company:  Innowireless")
call append(s:line+3,  "// Module Name:")
call append(s:line+4,  "// --------------------------------------------------------------------------------")
call append(s:line+5,  "// Version Control Information:")
call append(s:line+6,  "// $LastChangedDate$")
call append(s:line+7,  "// $LastChangedRevision$")
call append(s:line+8,  "// $LastChangedBy$")
call append(s:line+9,  "// $Id$")
call append(s:line+10, "// $HeadURL$")
call append(s:line+11, "//---------------------------------------------------------------------------------")
call append(s:line+12, "// Description:") 
call append(s:line+13, "//") 
call append(s:line+14, "//") 
call append(s:line+15, "//=================================================================================")
call append(s:line+16, "// -FILEHEADER- ")
call append(s:line+17, "")
unlet s:line
endfunction

"===============================================================
"        Add Comment Lines
"===============================================================
function AddComment()
let curr_line = line('.')
call append(curr_line,  "//----------------------------------------------------------------")
call append(curr_line+1,"//")
call append(curr_line+2,"//----------------------------------------------------------------")
endfunction

"===============================================================
"        Add F/F boardy
"===============================================================
function AddFF()
let curr_line = line('.')
call append(curr_line,  "always @(negedge rst_sw_n or posedge clk) begin")
call append(curr_line+1,"	if (!rst_sw_n) begin")
call append(curr_line+2,"	end")
call append(curr_line+3,"	else begin")
call append(curr_line+4,"	end")
call append(curr_line+5,"end")
call append(curr_line+6,"")
endfunction

" If opening new file with these file extentions
" then execute corresponding functions
:autocmd BufNewFile *.v,*.vh,*.sv execute AddHeaderV()
nmap ,av :call AddHeaderV()<cr>12kA
nmap ,ah :call AddHeaderS()<cr>5kA
nmap ,ac :call AddComment()<cr>
nmap ,af :call AddFF()<cr>

"colorscheme darkblue
"colorscheme slate
"colorscheme torte

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" let Vundle manage Vundle, required

" Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf' }
Plugin 'junegunn/fzf.vim'
" Plugin 'zaki/zazen'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'kchmck/vim-coffee-script'
Plugin 'morhetz/gruvbox'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'arcticicestudio/nord-vim', { 'as': 'nord' }
" Plugin 'yuttie/hydrangea-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'vim-python/python-syntax'
" Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'vimwiki/vimwiki'                            " Vim wiki
" Plugin 'ap/vim-css-color'                           " Color previews for CSS

Plugin 'scrooloose/syntastic'
" Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'

" Plugin 'wesleyche/srcexpl'

"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'airblade/vim-gitgutter'
" Plugin 'jreybert/vimagit'
call vundle#end()            " required

set t_Co=256

"set list
"set listchars=tab:\|\ 

" set guifont=Noto\ Mono:h10
" set guifont=D2Coding_ligature:h11
" set guifont=DejaVu_Sans_Mono:h10
" set guifont=DejaVu_Sans_Mono:h10

:set number relativenumber
:set showcmd
:set cursorline
" :set cursorcolumn

:set lines=60 columns=150
:set noerrorbells
:set visualbell

"----------------------------------------------------------------------"
" gruvbox ??
"----------------------------------------------------------------------"
"" set background=dark
"" let g:gruvbox_contrast_dark = 'soft'
"" "let g:gruvbox_contrast_light = 'soft'
"" "let g:gruvbox_transparent_bg = '1'
"" let g:gruvbox_italic = 1
"" "let g:gruvbox_underline=1
"" "let g:gruvbox_undercurl=1
"" "let g:gruvbox_termcolors=16
"" "let g:gruvbox_number_column='aqua'
"" "let g:gruvbox_sign_column='aqua'
"" "let g:gruvbox_color_column='aqua'
"" 
"" " Force to use underline for spell check results
"" augroup SpellUnderline
""   autocmd!
""   autocmd ColorScheme *
""     \ highlight SpellBad
""     \   cterm=Underline
""     \   ctermfg=NONE
""     \   ctermbg=NONE
""     \   term=Reverse
""     \   gui=Undercurl
""     \   guisp=Red
""   autocmd ColorScheme *
""     \ highlight SpellCap
""     \   cterm=Underline
""     \   ctermfg=NONE
""     \   ctermbg=NONE
""     \   term=Reverse
""     \   gui=Undercurl
""     \   guisp=Red
""   autocmd ColorScheme *
""     \ highlight SpellLocal
""     \   cterm=Underline
""     \   ctermfg=NONE
""     \   ctermbg=NONE
""     \   term=Reverse
""     \   gui=Undercurl
""     \   guisp=Red
""   autocmd ColorScheme *
""     \ highlight SpellRare
""     \   cterm=Underline
""     \   ctermfg=NONE
""     \   ctermbg=NONE
""     \   term=Reverse
""     \   gui=Undercurl
""     \   guisp=Red
""   augroup END
"" " set termguicolors
"" colorscheme gruvbox

colorscheme jellybeans

let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" " adding the custom source to unite
let g:webdevicons_enable_unite = 1
" " adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
" " adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" " adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

"-----------------------------------------------------------------------"
" NERD Tree Key ??
"-----------------------------------------------------------------------"
map <C-o> :NERDTreeToggle<CR>

"-----------------------------------------------------------------------"
" NERDTree Color
"-----------------------------------------------------------------------"

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:Tlist_Ctags_Cmd='/var/lib/snapd/snap/universal-ctags/current/bin/ctags'

" for indent guide
" let g:indentguides_spacechar = '?'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" for blueyed/vim-diminactive
" let g:diminactive_enable_focus = 1

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4

" Matchit
let b:match_words = '\<if\>:\<endif\>:\<else\>,'
			\ . '\<while\>:\<continue\>,'
			\ . '\<begin\>:\<end\>,'
			\ . '\<module\>:\<endmodule\>,'
			\ . '\<class\>:\<endclass\>,'
			\ . '\<program\>:\<endprogram\>,'
			\ . '\<clocking\>:\<endclocking\>,'
			\ . '\<property\>:\<endproperty\>,'
			\ . '\<sequence\>:\<endsequence\>,'
			\ . '\<package\>:\<endpackage\>,'
			\ . '\<covergroup\>:\<endgroup\>,'
			\ . '\<primitive\>:\<endprimitive\>,'
			\ . '\<specify\>:\<endspecify\>,'
			\ . '\<generate\>:\<endgenerate\>,'
			\ . '\<interface\>:\<endinterface\>,'
			\ . '\<function\>:\<endfunction\>,'
			\ . '\<task\>:\<endtask\>,'
			\ . '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,'
			\ . '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,'
			\ . '\<\(ifdef\|ifndef\)\>:\<\(else\|elsif\)\>:\<endif\>,'
			\ . '`\<\(ifdef\|ifndef\)\>:`\<\(else\|elsif\)\>:`\<endif\>'
			\ . '\<generate\>:\<endgenerate\>'

au BufNewFile,BufRead  *.sv  so  ~/.vim/syntax/verilog_systemverilog.vim 
let t:RtlTreeVlogDefine = 1

let g:snipMate = { 'snippet_version' : 1 }
" let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['verilog_systemverilog'] = 'verilog,systemverilog'

" :set background=dark
" highlight Comment ctermfg=lightblue

"" "-----------------------------------------------------------------------"
"" " easymotion ??
"" "-----------------------------------------------------------------------"
"" let g:EasyMotion_smartcase = 1
"" 
"" " <Leader><Leader>f{char} to move to {char}
"" nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
"" 
"" " s{char}{char} to move to {char}{char}
"" nmap s <Plug>(easymotion-overwin-f2)
"" 
"" " Move to line
"" "map <Leader>L <Plug>(easymotion-bd-jk)
"" nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
"" 
"" " Move to word
"" "map  <Leader>w <Plug>(easymotion-bd-w)
"" nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
"" 
"" " Gif config
"" map <Leader>l <Plug>(easymotion-lineforward)
"" map <Leader>j <Plug>(easymotion-j)
"" map <Leader>k <Plug>(easymotion-k)
"" map <Leader>h <Plug>(easymotion-linebackward)
"" 
"" map  / <Plug>(easymotion-sn)
"" 
"" " You can use other keymappings like <C-l> instead of <CR> if you want to
"" " use these mappings as default search and sometimes want to move cursor with
"" " EasyMotion.
"" function! s:incsearch_config(...) abort
""   return incsearch#util#deepextend(deepcopy({
""   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
""   \   'keymap': {
""   \     "\<CR>": '<Over>(easymotion)'
""   \   },
""   \   'is_expr': 0
""   \ }), get(a:, 1, {}))
"" endfunction
"" 
"" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
"" 
"" " haya14busa incsearch-fuzzy easymotion ??
"" function! s:config_fuzzyall(...) abort
""   return extend(copy({
""   \   'converters': [
""   \     incsearch#config#fuzzy#converter(),
""   \     incsearch#config#fuzzyspell#converter()
""   \   ],
""   \ }), get(a:, 1, {}))
"" endfunction
"" 
"" noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())

"-----------------------------------------------------------------------"
" fzf layout
"-----------------------------------------------------------------------"
let g:fzf_vim = {}

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5 } }

" - down / up / left / right
"let g:fzf_layout = { 'left': '50%' }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  
command! -bang -nargs=? -complete=dir Files
 \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"-----------------------------------------------------------------------"
" RG
"-----------------------------------------------------------------------"
" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

" Make Ripgrep ONLY search file contents and not filenames
" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = "rg --column --line-number --no-heading --color=always --glob '!tags' --smart-case %s || true"
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
