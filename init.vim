set mouse=a
" let python3_host_prog = '/usr/bin/python3'
let python3_host_prog = '/home/areddy/centos/Python-3.8.0/python'
set runtimepath^=~/.vim/bundle/ctrlp.vim
call plug#begin()
" Plug 'ycm-core/YouCompleteMe'
Plug 'davidhalter/jedi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'overcache/NeoSolarized'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
set termguicolors
set bg=light
" set bg=dark
colorscheme PaperColor
" colorscheme NeoSolarized
" colorscheme gruvbox

set t_Co=256 " Enable 256 colors palette in Gnome Terminal
set showmode
syntax enable
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
set nocompatible
set fileformat=unix
" page up/down
nnoremap <space> <C-f>
nnoremap <leader>f <cmd>Telescope find_files<cr>
" " nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"open new tab
vnoremap  E        <Esc><cr>:e <c-r>=expand("%:p:h") .'/' <cr>
vnoremap  <C-t>    <Esc><cr>:tabe <c-r>=expand("%:p:h") .'/' <cr>
nnoremap  <C-t>     :tabedit
nnoremap  <C-\>     :tabnext <cr>
nnoremap  <C-]>     :tabprev <cr>
nnoremap  <C-a>     <C-w>
nnoremap <C-n> :Note
inoremap <silent> <C-s> <esc> :w!<cr>
nnoremap  <silent> <C-s> <esc> :w!<cr>
nnoremap  <silent> <C-w> <esc> :q!<cr>
filetype plugin on
filetype indent on
nnoremap ;  :
nnoremap ;; :!
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
set noshowmode
set ai   "Auto indent
set si   "Smart indent
set relativenumber
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
autocmd FileType python set omnifunc=python3complete#Complete
autocmd BufEnter,BufRead *.\(sv|v$\)     :setlocal filetype=verilog
autocmd BufEnter,BufRead *.\(conf\)      :setlocal filetype=conf

vnoremap <silent> *     y/\V<C-R>=escape(@",'/\')<CR><CR>
cnoremap <expr> <up>    wildmenumode() ? "\<left>"  : "\<up>"
cnoremap <expr> <down>  wildmenumode() ? "\<right>" : "\<down>"
noremap <expr> <left>  wildmenumode() ? "\<up>"    : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

map <leader><cr> :noh<cr>
map <leader>bd   :bufdo bd!<cr>
map <leader>b    obreakpoint()<esc>
map <silent><leader>cd   :cd %:p:h<cr>
map ;wd :echo expand('%:p:h')<cr>
map ;as :cd /proj_risc/user_dev/areddy/ascalon<cr>
map ;ax :cd /proj_risc/user_dev/areddy/ascalon/testgen/sting_aux<cr>
map ;sr :cd /tools_vendor/valtrix/STING/2.1.4/<cr>
map ;tg :cd /proj_risc/user_dev/areddy/ascalon/testgen<cr>
map ;isg :cd /proj_risc/user_dev/areddy/ascalon/isg/<cr>
map ;tl :cd /proj_risc/user_dev/areddy/ascalon/dv/core/testlists<cr>
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
:set path+=/proj_risc/user_dev/areddy/ascalon
:set path+=/proj_risc/user_dev/areddy/ascalon/isg
:set path+=/proj_risc/user_dev/areddy/ascalon/isg/src
:set path+=/proj_risc/user_dev/areddy/ascalon/rtl
:set path+=/proj_risc/user_dev/areddy/ascalon/rtl/fe
:set path+=/proj_risc/user_dev/areddy/ascalon/rtl/mc
:set path+=/proj_risc/user_dev/areddy/ascalon/rtl/ls
:set path+=/proj_risc/user_dev/areddy/ascalon/dv/core/testlists
:set path+=/proj_risc/user_dev/areddy/ascalon/dv/core/testlists/tests
:set path+=/proj_risc/user_dev/areddy/ascalon/dv/core/testlists/tests/bringup
:set path+=/proj_risc/user_dev/areddy/ascalon/dv/core/testlists/tests/Exceptions
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using Ctrl+[jk]
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

let s:save_cpo = &cpo
set cpo&vim

nmap <silent> dm  :call ForAllMatches('delete', {})<CR>
nmap <silent> dM  :call ForAllMatches('delete', {'inverse':1})<CR>
nmap <silent> ym  :call ForAllMatches('yank',   {})<CR>
nmap <silent> yM  :call ForAllMatches('yank',   {'inverse':1})<CR>

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
    let a = substitute(a,'\/proj_risc\/user_dev\/areddy\/', '', '')
    let a = substitute(a,'.*k8-fastbuild', 'bazel', '')
    let a = substitute(a,'\/proj_risc\/', '', '')
    let a = substitute(a,'ascalon', 'ASC', '')
    return a
endfunction

function! CWD()
    return "CWD=".(Shorten_Dir_Name(getcwd()))
endfunction

function! RelativePath()
    return Shorten_Dir_Name(fnamemodify(expand("%"),":~:."))
endfunction

function! RStatusLine()
    " return line(".")."/".line("$")
    return line(".")."/".line("$").",".col(".")
endfunction
set laststatus=2
" set statusline=%<%r\ %f\ %w\ %=CWD=%{getcwd()}\ \ %y\ Line:%l\/%L\,Col:%c
let g:lightline = {
      \ 'mode_map':           { 'n' : 'N', 'i' : 'I', 'R' : 'R', 'v' : 'V', 'V' : 'VL', "\<C-v>": 'VB', 'c' : 'C', 's' : 'S', 'S' : 'SL', "\<C-s>": 'SB', 't': 'T' },
      \ 'active':             { 'left':  [['mode', 'paste'], [ 'readonly', 'relative_path', 'modified']],
      \                         'right': [['rstatus'], ['filetype'], ['cwd']] },
      \ 'component_function': { 'cwd': 'CWD',  'rstatus': 'RStatusLine', 'relative_path': 'RelativePath' },
\ }

noremap  <C-h>      :echom Hex_to_binary(expand('<cword>')) <CR>
vnoremap <C-h> <esc>:echom V_Hex_to_binary() <CR>
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
" NerdCommenter
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCustomDelimiters       = {'c': {'left': '/**', 'right': '*/'}, 'conf': {'left': '#'}, 'list': {'left': '#'}, 's': {'left': '#'}, 'S': {'left': '#'}}
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines    = 1
map <silent> <C-c>  \c<space>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_cmd = 'CtrlPBuffer'

"
:let g:notes_directories = ['~/notes']
:let g:notes_suffix = '.md'
" let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
