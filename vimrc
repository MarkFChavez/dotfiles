" Leader
let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set guifont=Inconsolata-g\ for\ Powerline:h18
set nobackup
set nowrap
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set relativenumber
set ff=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
set background=dark
color grb256

" Grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" Search for the current word
nnoremap <leader>* :Grepper -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool git<cr>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" NERDTree
nnoremap <leader><Tab> :NERDTree<CR>

" FZF
nnoremap <leader>t :FZF!<CR>

" Splitting panes
nnoremap vv :vsp<CR>
nnoremap ss :sp<CR>

" vim-iterm-rspec
nnoremap <Leader>rs :RunItermSpec<cr>
nnoremap <Leader>rl :RunItermSpecLine<cr>

" RSpec.vim mappings
" let g:rspec_command = "bundle exec rspec {spec}"
" let g:rspec_runner = "os_x_iterm2"
"
" map <Leader>rt :call RunCurrentSpecFile()<CR>
" map <Leader>rs :call RunNearestSpec()<CR>
" map <Leader>rl :call RunAllSpecs()<CR>

" Using vim-test
" let test#strategy = "dispatch"
" nmap <Leader>rt :TestFile<CR>
" nmap <Leader>ra :TestSuite<CR>
" nmap <Leader>rs :TestNearest<CR>


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
" set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

packadd minpac
call minpac#init()

" Define bundles via Github repos
call minpac#add('christoomey/vim-run-interactive')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('posva/vim-vue')
call minpac#add('fatih/vim-go')
call minpac#add('janko-m/vim-test')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('pangloss/vim-javascript')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('slim-template/vim-slim')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-dispatch')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('skwp/vim-iterm-rspec')
call minpac#add('vim-scripts/tComment')
call minpac#add('scrooloose/nerdtree')

