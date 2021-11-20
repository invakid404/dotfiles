" Load all plugins
lua require('plugins')

" Use onedark theme
source $HOME/.config/nvim/themes/onedark.vim

" Set tab width to 4
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Wrap text to 80 columns
set textwidth=80

" Enable semantic highlight groups
let g:coc_default_semantic_highlight_groups = 1
