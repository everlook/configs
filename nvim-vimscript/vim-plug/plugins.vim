" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{' 
    Plug 'jiangmiao/auto-pairs'
    " Onedark ThemePlug 'joshdick/onedark.vim'
    Plug 'joshdick/onedark.vim', {'branch': 'main'}
    " Nord Theme
    Plug 'arcticicestudio/nord-vim'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Vim status line
    Plug 'vim-airline/vim-airline'
    " Vim status line themes
    Plug 'vim-airline/vim-airline-themes'
    " Vim for Go development
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    " Better Comments
    Plug 'tpope/vim-commentary'
    " Startup screen
    Plug 'mhinz/vim-startify'
    " Git support
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    " Symbol / tag viewer
    Plug 'liuchengxu/vista.vim' 
    " Rust support
    " Plug 'rust-lang/rust.vim'
    " Fuzzy finder
    " Plug 'airblade/vim-rooter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " code formatter
    Plug 'sbdchd/neoformat'
    " ctags support
    Plug 'ludovicchabant/vim-gutentags'

call plug#end()
