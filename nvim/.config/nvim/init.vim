"{{{ Built-in settings
"{{{2 Parameters
set foldmethod=marker
set number relativenumber
set hidden
set undodir=~/.vim/undodir
set nohlsearch
set diffopt+=vertical
set mouse=a
set guicursor=
set noshowmode
set splitbelow 
set splitright
set tabstop=4
set shiftwidth=0
set expandtab
syntax on
"}}}2

"{{{2 Highlights
highlight clear SignColumn
highlight MatchParen cterm=italic ctermbg =none
highlight Pmenu ctermfg=255 ctermbg=17
highlight CocWarningSign ctermfg=9
highlight CocErrorSign ctermfg=160
highlight ErrorMsg ctermfg=255
highlight LineNr ctermfg=094
"}}}2
"}}}

"{{{ Vim-Plug
"{{{2 Plug Calls
call plug#begin()
Plug 'rhysd/git-messenger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
"}}}2

"{{{2 Plugin settings
"{{{3 VimTex
let g:tex_flavor = 'latex'
let mapleader = ','
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Forward search
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
call plug#end()
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 176
let g:indentLine_fileTypeExclude = ['tex']
"}}}3

"{{{3 Coc
source $HOME/.config/nvim/plug-config/coc.vim
"}}}3

"{{{3 Remaps
nnoremap <silent> K :<C-U>call CocAction('doHover')<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fh <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gl <cmd>Glog<cr>
nnoremap <leader>gh <cmd>0Glog<cr>
tnoremap <esc>  <c-\><c-n>
tnoremap <esc>: <c-\><c-n>:
nmap <silent> gd :w<CR><Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <F5> <Esc>:w<CR>:!clear;%<CR>
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>
"}}}3

"{{{3 Lua
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    color_devicons = true,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,


    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  }
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
"}}}3
"}}}
