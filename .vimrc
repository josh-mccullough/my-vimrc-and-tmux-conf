"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/vim-scripts/tComment.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plugin 'https://github.com/tpope/vim-sensible.git'
"Color schemes below
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required


set bg=dark
set ts=4
set expandtab
set shiftwidth=4
set smartindent
filetype plugin indent on
set number

let g:buffergator_suppress_keymaps=1
map <C-n> :NERDTreeToggle<CR>
map <C-b> :BuffergatorToggle<CR>
nnoremap <Leader>t :SyntasticToggleMode<CR>
map <Leader>r :vert res 81<CR>
vmap <Leader>C :TCommentBlock<CR>
vmap <Leader>c :TComment<CR>
map <Leader>l :LengthmattersToggle<CR>

let syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='>>'
let g:syntastic_enable_balloons=1
let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_checkers=['flake8']

"F403 - ignore import * errors
"E401 - ignore multiple imports
"E128 - ignore indent lines to opening parentheses
let g:syntastic_python_flake8_args='--ignore=E401,F403,E128 --max-line-length=80'

autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
set textwidth=79

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_show_diagnostics_ui=0
let g:ycm_register_as_syntastic_checker = 0 "default 1
let g:Show_diagnostics_ui = 0 "default 1
color OceanicNext

nmap <F8> :TagbarToggle<CR>
let base16colorspace=256


