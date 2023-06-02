filetype plugin on
" set nopaste
filetype indent on
set mouse+=a
set showmode
set termguicolors
set t_Co=256 " Enable 256 colors palette in Gnome Terminal
set nocompatible 
set fileformat=unix
syntax enable
set runtimepath^=~/.vim/bundle/ctrlp.vim
call plug#begin()
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'preservim/nerdcommenter'
  Plug 'morhetz/gruvbox'
  Plug 'romainl/Apprentice'
  Plug 'jiangmiao/auto-pairs'

  Plug 'preservim/tagbar'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'itchyny/lightline.vim'
  Plug 'ctrlpvim/ctrlp'
  Plug 'ervandew/supertab'
  Plug 'nlknguyen/papercolor-theme'
  " Plug 'dhruvasagar/vim-table-mode'
  " Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
call plug#end()
colorscheme tokyonight-storm
" autocmd BufEnter *.\(inc\|asm\)          :setlocal filetype=asm
" autocmd BufEnter,BufRead *.lst           :setlocal filetype=asm
" autocmd BufEnter,BufRead *.\(sv|v$\)     :setlocal filetype=verilog
" autocmd BufEnter,BufRead *.\(log\|klog\) :setlocal filetype=log
" autocmd BufEnter,BufRead *.\(py\)        :setlocal colorcolumn=99
"

vnoremap <LeftRelease> "*ygv
vnoremap <2-LeftRelease> "*ygv
" function keys mapping
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
"control keys mapping
vnoremap  <C-t>    <Esc><cr>:tabe <c-r>=expand("%:p:h") .'/' <cr>
nnoremap  <C-t>     :tabedit 

nnoremap <silent> <C-a>h :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-a>j :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-a>k :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-a>l :<C-U>TmuxNavigateRight<cr>

inoremap  <C-s> <esc> :w!<cr>
nnoremap  <C-s> <esc> :w!<cr>
nnoremap  <C-w> <esc> :q!<cr>
nnoremap  <C-W> <esc> :q!<cr>
nnoremap <C-]> :tabprev<cr>
inoremap <C-]> <esc>:tabprev<cr>
nnoremap <C-\> :tabn<cr>
inoremap <C-\> <esc>:tabn<cr>
" misc keys mapping
nnoremap ;  :
nnoremap ;; :!
nnoremap <space> <C-f>
vnoremap  E        <Esc><cr>:e <c-r>=expand("%:p:h") .'/' <cr>
vnoremap <silent> *     y/\V<C-R>=escape(@",'/\')<CR><CR>
cnoremap <expr> <up>    wildmenumode() ? "\<left>"  : "\<up>"
cnoremap <expr> <down>  wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left>  wildmenumode() ? "\<up>"    : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
" Move a line of text using Ctrl+[jk]
" nmap <C-S-z> mz:m+<cr>`z
" nmap <C-S-x> mz:m-2<cr>`z
" vmap <C-S-z> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <C-S-x> :m'<-2<cr>`>my`<mzgv`yo`z
" leader key mapping
map <silent><leader><cr> :noh<cr>
map <leader>bd   :bufdo bd!<cr>
map <leader>b    obreakpoint()<esc>
map <silent><leader>cd   :cd %:p:h<cr>
" project mapping
map ;wd :echo expand('%:p')<cr>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufEnter,BufRead *.\(sv|v$\)     :setlocal filetype=verilog
autocmd BufEnter,BufRead *.\(conf\)      :setlocal filetype=conf


:set define=^\\s*sub
set splitright
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set history=500                " Sets how many lines of history VIM has to remember
set autoread                   " Set to auto read when a file is changed from the outside
set wildmenu                   " Turn on the WiLd menu
set so=1                       " Set 1 lines to the cursor - when moving vertically using j/k
set ruler                      " Always show current position
set cmdheight=1                " Height of the command bar
set hid                        " A buffer becomes hidden when it is abandoned
set cursorline
" highlight CursorLine guibg=#080808
" highlight CursorLine guibg=DarkSlateGray
highlight CursorLine guibg=Gray25
highlight VertSplit guibg=Gray25 guifg=Gray25 

set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch                   " highlight Search guibg=Red
set incsearch 
set magic
set lazyredraw                 " Don't redraw while executing macros (good performance config)
set sidescroll=1

set showmatch                  " Show matching brackets when text indicator is over them
set mat=1                      " How many tenths of a second to blink when matching brackets

set timeoutlen=500
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set encoding=utf8    
set ffs=unix,dos,mac

set nobackup
set nowritebackup
set noswapfile
set nowrap
set ai   "Auto indent
set si   "Smart indent
set relativenumber
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

let s:save_cpo = &cpo
set cpo&vim
nmap <silent> dm  :call ForAllMatches('delete', {})<CR>
nmap <silent> dM  :call ForAllMatches('delete', {'inverse':1})<CR>
nmap <silent> ym  :call ForAllMatches('yank',   {})<CR>
nmap <silent> yM  :call ForAllMatches('yank',   {'inverse':1})<CR>

vnoremap  F        <Esc><cr>:e <c-r>=Get_bazel_bin() .'/' <cr>
function! Get_bazel_bin()
    let x = expand("%:p:h")
    let x = substitute(x, "testlogs", "bin", '')
    let x = substitute(x, "_compare", "", '')
    let x = substitute(x, "_vcs", "", '')
    let x = substitute(x, "test.outputs", "", '')
    return x
endfunc

function! ForAllMatches (command, options)
    let orig_pos = getpos('.')
    let in_visual = get(a:options, 'visual', 0)
    let start_line = in_visual ? getpos("'<'")[1] : 1
    let end_line   = in_visual ? getpos("'>'")[1] : line('$')
    let inverted = get(a:options, 'inverse', 0)
    let deleting = a:command == 'delete'
    let sensitive = &ignorecase && &smartcase && @/ =~ '\u' ? '\C' : ''
    exec 'silent lvimgrep /' . sensitive . @/ . '/j %'
    let matched_line_nums = reverse(filter(map(getloclist(0), 'v:val.lnum'), 'start_line <= v:val && v:val <= end_line'))

    if inverted
        let inverted_line_nums = range(start_line, end_line)
        for line_num in matched_line_nums
            call remove(inverted_line_nums, line_num-start_line)
        endfor
        let matched_line_nums = reverse(inverted_line_nums)
    endif

    let yanked = ""
    for line_num in matched_line_nums

        let yanked = getline(line_num) . "\n" . yanked

        if deleting
            exec line_num . 'delete'
        endif
    endfor

    if !exists('g:YankMatches#ClipboardRegister')
        let l:clipboard_flags = split(&clipboard, ',')
        if index(l:clipboard_flags, 'unnamedplus') >= 0
            let g:YankMatches#ClipboardRegister='+'
        elseif index(l:clipboard_flags, 'unnamed') >= 0
            let g:YankMatches#ClipboardRegister='*'
        else
            let g:YankMatches#ClipboardRegister='"'
        endif
    endif
    let l:command = ':let @' . g:YankMatches#ClipboardRegister . ' = yanked'
    execute 'normal! ' . l:command . "\<cr>"

    call setpos('.', orig_pos)

    redraw
    let match_count = len(matched_line_nums)
    if match_count == 0
        unsilent echo 'Nothing to ' . a:command . ' (no matches found)'
    elseif deleting
        unsilent echo match_count . (match_count > 1 ? ' fewer lines' : ' less line')
    else
        unsilent echo match_count . ' line' . (match_count > 1 ? 's' : '') . ' yanked'
    endif
endfunction

function! Shorten_Dir_Name(dir)
    let a = a:dir

    return a
endfunction

function! CWD()
    return (Shorten_Dir_Name(getcwd()))
endfunction

function! RelativePath()
    return Shorten_Dir_Name(fnamemodify(expand("%"),":~:."))
endfunction

function! LineColumn()
    return line(".")."/".line("$").",".col(".")
endfunction
set laststatus=2
" set statusline=%<%r\ %f\ %w\ %=CWD=%{getcwd()}\ \ %y\ Line:%l\/%L\,Col:%c
let g:lightline = {
      \ 'active':             { 'left':  [['relative_path'], ],
      \                         'right': [['line_col'], ['filetype'], ['cwd'] ] },
      \ 'component_function': { 'cwd': 'CWD',  'line_col': 'LineColumn', 'relative_path': 'RelativePath'},
\ }

noremap  <leader>v      :echom VA_dissect(expand('<cword>')) <CR>
function VA_dissect(num)
    let str = a:num
    let str = substitute(str,'^0x\|^0\+\|h$\|_','','g')
    let str = "0x".str
    let str = float2nr(floor(str/pow(2,12))) " 12
    let vpn0 = (and(str, 0x1ff))
    let vpn0 = Convert_int_to_hex(vpn0). ":". Convert_int_to_hex(vpn0*8)
    let str = float2nr(floor(str/pow(2,9)))  " 12+9
    let vpn1 = and(str, 0x1ff)
    let vpn1 = Convert_int_to_hex(vpn1). ":". Convert_int_to_hex(vpn1*8)
    let str = float2nr(floor(str/pow(2,9)))  " 21+9
    let vpn2 = and(str, 0x1ff)
    let vpn2 = Convert_int_to_hex(vpn2). ":". Convert_int_to_hex(vpn2*8)
    let str = float2nr(floor(str/pow(2,9)))   " 30+9
    let vpn3 = and(str, 0x1ff)
    let vpn3 = Convert_int_to_hex(vpn3). ":". Convert_int_to_hex(vpn3*8)
    let str = float2nr(floor(str/pow(2,9))) " 39+9
    let vpn4 = and(str, 0x1ff)
    let vpn4 = Convert_int_to_hex(vpn4). ":". Convert_int_to_hex(vpn4*8)
    let str = float2nr(floor(str/pow(2,9))) " 48+9
    let canonical = Convert_int_to_hex(and(str, 0x1ff))
    " 0x7faaaaaaa
    return "canonical=".canonical." vpn4=".vpn4." vpn3=".vpn3." vpn2=".vpn2." vpn1=".vpn1." vpn0=".vpn0 .  "                   value:offset in the table "
endfunc

noremap  <leader>p      :echom PTE_dissect(expand('<cword>')) <CR>
function PTE_dissect(num)
    let str = a:num
    let str = substitute(str,'^0x\|^0\+\|h$\|_','','g')
    let str = "0x".str
    let v = and(str, 1)
    let str = float2nr(floor(str/2))
    let r = and(str, 1)
    let str = float2nr(floor(str/2))
    let w = and(str, 1)
    let str = float2nr(floor(str/2))
    let x = and(str, 1)
    let str = float2nr(floor(str/2))
    let u = and(str, 1)
    let str = float2nr(floor(str/2))
    let g = and(str, 1)
    let str = float2nr(floor(str/2))
    let a = and(str, 1)
    let str = float2nr(floor(str/2))
    let d = and(str, 1)
    let str = float2nr(floor(str/2)) 
    let rsw = and(str, 3)
    let str = float2nr(floor(str/pow(2,2)))
    let ppn = Convert_int_to_hex(and(str, 0xfffffffffff))
    let str = float2nr(floor(str/pow(2,44)))
    let reserved = Convert_int_to_hex(and(str, 0x7f))
    let str = float2nr(floor(str/pow(2,7)))
    let pbmt = and(str, 3)
    let str = float2nr(floor(str/pow(2,2)))
    let n = and(str, 1)
    return "n=".n." pbmt=".pbmt." reserved=".reserved." ppn=".ppn." rsw=".rsw." d=". d ." a=". a. " g=".g." u=".u." x=".x." w=".w." r=".r." v=".v
endfunc
function Convert_int_to_hex(num)
    let integer = a:num
    let hex = ""
    while integer > 0
        let remainder = integer % 16
        if remainder < 10
            let hex =  remainder . hex  
        elseif remainder == 10
            let hex =  "a" . hex
        elseif remainder == 11
            let hex =   "b" . hex
        elseif remainder == 12
            let hex =   "c" . hex
        elseif remainder == 13
            let hex =   "d" . hex
        elseif remainder == 14
            let hex =   "e" . hex
        elseif remainder == 15
            let hex =   "f" . hex
        endif
        let integer = integer / 16
    endwhile
    if hex == ""
        let hex = 0
    endif
    return "0x".hex
endfunc
noremap  <leader>h      :echom Hex_to_binary(expand('<cword>')) <CR>
vnoremap <leader>h <esc>:echom V_Hex_to_binary() <CR>
function V_Hex_to_binary()
    let foo = getreg("*")
    let result = split(foo)
    let reverse_res = reverse(result)
    let hex = join(reverse_res,'')
    return Hex_to_binary(hex)
endfunc
function Hex_to_binary(num)  "Hex to binary only (Not decimals)
    let str = a:num
    let actual_nr = "0x".str
    let str = substitute(str,'^0x\|^0\+\|h$\|_','','g')
    let reversed_string_list = reverse(split(str, '\w\zs'))
    let stringlen = len(reversed_string_list)
    let start_index = 0
    let last_index = 0
    let loop_times = 0
    let result = ''
    while (last_index < stringlen)
        let start_pos = 64 * loop_times
        let loop_times = loop_times + 1
        
        let last_index  = last_index + 16
        if (last_index > stringlen)
            let last_index = stringlen
        endif
        let string = reversed_string_list[start_index : (last_index-1)]
        let string = join(reverse(string),'')
        let result = Hex_64bit_binary(string, start_pos) . ' ' . start_pos . ' ' . result
        let start_index = last_index
    endwhile
    return result . ': ' . actual_nr
endfunc

function Hex_64bit_binary(num, start_pos)
    let str = a:num
    let start_pos = a:start_pos
    let msb = 0  " Bit 63- is considered a sign, so calculate it separately
    if strlen(str) == 16
        let msb_val = "0x".str[0]
        if msb_val >= 8  
            let msb = 1
            let str = substitute(str,'^.',(msb_val-8),'')
        endif
    endif
    let num = "0x".str
    let bin = ""  " holds binary representation
    let x = start_pos
    let last_pos = x + 63
    while num
      let x = x + 1  
      if x % 4 == 0
        let bin =  " ".x ." ".'01'[num % 2] . bin
      else
        let bin = '01'[num % 2] . bin
      endif
      let num = num / 2
    endwhile
    if msb == 1
        let bin =   msb .' '. last_pos .' ' . bin
    endif
    return bin . ''
endfunc
" NerdTree
let NERDTreeShowLineNumbers=1
" NerdCommenter
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCustomDelimiters       = {'c': {'left': '/**', 'right': '*/'}, 'conf': {'left': '#'}, 'list': {'left': '#'},  'asm': {'left': '#'} }
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines    = 1
map <silent> <C-c>  \c<space>
" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" notes
" :let g:notes_directories = ['~/notes']
" :let g:notes_suffix = '.md'
" supertab
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:rainbow_active = 1
vnoremap y "+y
:ab sr $STING_ROOT
