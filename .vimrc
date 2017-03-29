let needsToInstallBundles=0
if !isdirectory(expand("~/.vim/bundle/vundle"))
  echo "\nInstalling Vim dependencies... Please be patient!\n"
  silent !mkdir -p ~/.vim/tmp
  silent !mkdir -p ~/.vim/swap
  silent !mkdir -p ~/.vim/undo
  silent !mkdir -p ~/.vim/bundle
  silent !mkfifo ~/.vim/commands-fifo
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let needsToInstallBundles=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Do these first, because other plugins depend on them
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/nerdtree'

if needsToInstallBundles == 1
  echo "\nInstalling Bundles, please ignore key map error messages\n"
  :BundleInstall!
  echo "\nInstalled.\n"
endif

" Solarized theme
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Ctags
set tags=./.tags;/

" Custom shit
set nobackup
set number
set wildmode=longest,list
set nowrap
set hlsearch
set smartindent
set wildignore+=**/tmp
set wildignore+=**/log
set wildignore+=.tags

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
