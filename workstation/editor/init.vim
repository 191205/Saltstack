""""""""""""
""" packages
set nocompatible
set runtimepath+=/home/terry/.local/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/home/terry/.local/dein')
    call dein#begin('/home/terry/.local/dein')
    call dein#add('/home/terry/.local/dein/repos/github.com/Shougo/dein.vim')

    " aesthetics
    call dein#add('itchyny/lightline.vim')
    call dein#add('chriskempson/base16-vim')
    call dein#add('mark-westerhof/vim-lightline-base16')
    call dein#add('fenetikm/falcon')

    " utilities
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('tpope/vim-commentary')
    call dein#add('junegunn/fzf.vim')
    call dein#add('ap/vim-buftabline')
	call dein#add('neomake/neomake')

    " syntax
    call dein#add('hdima/python-syntax')
    call dein#add('kurayama/systemd-vim-syntax')
    call dein#add('glench/vim-jinja2-syntax')
	call dein#add('cespare/vim-toml')
	call dein#add('jakwings/vim-pony')

    " completion
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })

    call dein#end()
    call dein#save_state()
    call dein#remote_plugins()
endif

if dein#check_install()
    call dein#install()
endif


""""""""""""""""""""
""" general settings
set clipboard+=unnamedplus
set hidden
set modeline
set noshowmode
set number
set signcolumn=yes
set termguicolors
let g:python3_host_prog = '/usr/bin/python3'

colorscheme base16-black-metal-immortal
let g:falcon_lightline = 1
let g:lightline = { 'colorscheme': 'base16_grayscale_dark' }

filetype plugin indent on
syntax enable


""""""""""
""" syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0


""""""""""""""
""" completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 12
set completeopt-=preview " suppress annoying 'help'

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'python': ['pyls'],
    \ }


""""""""""""""""
""" key bindings
let mapleader = ";"
let maplocalleader = ","

" deoplete
nnoremap <C-L> :nohl<CR><C-L>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" language-server-protocol
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>h :call LanguageClient#textDocument_hover()<CR>

" buftabline
nnoremap <C-n> :bnext<CR>

" fzf
nnoremap <C-p> :Files<CR>


"""""""""""""
""" filetypes
autocmd BufRead,BufNewFile *.sls set ft=yaml
