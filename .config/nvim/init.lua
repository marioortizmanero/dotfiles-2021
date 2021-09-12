-- TODO: replace all vimscript functions with lua
-- TODO: use vim.define_augroup and vim.define_autocmd https://github.com/neovim/neovim/pull/12378
-- TODO: use vim.create_command https://github.com/neovim/neovim/pull/11613
-- TODO: use keymap https://github.com/neovim/neovim/pull/13823
-- TODO: use nvim_add_highlight https://github.com/neovim/neovim/issues/9876

local keymap = require('config.utils').keymap

vim.g.mapleader = " "            -- Leader key for custom commands

vim.opt.shiftwidth = 4           -- Length of indentation
vim.opt.tabstop = 4              -- Number of spaces tabs count for
vim.opt.expandtab = true         -- Use spaces instead of tabs
vim.opt.cinkeys:remove(':')      -- No auto-indent after typing `:`.

vim.opt.relativenumber = true    -- Numbers starting at cursor line
vim.opt.number = true            -- Cursor line with absolute line
vim.opt.textwidth = 80           -- Maximum text width by default
vim.opt.colorcolumn = '80,120'   -- Base width markers
vim.opt.formatoptions:append('ro') -- Continuated comments
vim.opt.formatoptions:append('t') -- Auto-wrapping text
vim.opt.formatoptions:append('c') -- Auto-wrapping comments

vim.opt.joinspaces = false       -- No double space after period with `J`
vim.opt.termguicolors = true     -- True color support
vim.opt.conceallevel = 2         -- Conceal for vimtex and similars

vim.opt.undofile = true          -- Enable permanent undos
vim.opt.undodir = vim.env["HOME"] .. '/.cache/nvim/undo_history' -- Custom permanent undos directory

vim.opt.splitright = true        -- Append vertical splits to the right
vim.opt.splitbelow = true        -- Append horizontal splits to the bottom
vim.opt.equalalways = false      -- Don't resize windows when opening/closing files
vim.opt.mouse = 'a'              -- Full mouse support
vim.opt.clipboard = 'unnamedplus' -- System clipboard by default

vim.opt.foldenable = false       -- All folds are open by default
vim.opt.foldlevel = 20           -- Maximum fold level
vim.opt.foldmethod = 'manual'    -- No automatic

vim.opt.inccommand = 'split'     -- Live preview for substitution with `:s`
vim.opt.incsearch = true         -- Enable highlighted case-insensitive incremental search
vim.opt.ignorecase = true        -- Ignore case of search/substitutions
vim.opt.smartcase = true         -- Configure ignorecase to deactivate when the query has an uppercase character
vim.opt.gdefault = true          -- No need to specify `g` in substitutions

vim.cmd [[filetype plugin on]]   -- Enable custom filetype config

vim.cmd [[autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()]] -- Highlight yanked text

vim.cmd [[command QuickHelp :silent !firefox 'https://github.com/marioortizmanero/dotfiles/blob/master/Documents/Cheatsheets/vim.adoc']]

vim.cmd [[command CopyDir :let @+ = expand('%:p:h')]]

-- Open current location in new window with ls
vim.cmd [[command Term :belowright 13split | terminal]]
keymap.noremap('<leader>t', ':Term<CR>')

-- Quick custom terminal command
vim.cmd [[command TermFromCurDir :silent exec "!alacritty --working-directory" expand('%:p:h') "-e sh -c 'ls; $SHELL' &"]]
keymap.nnoremap('<leader>+', ':TermFromCurDir<CR>')  

keymap.nnoremap('<Esc>', ':noh<CR>')  -- Disable search highlighting when escape is pressed
keymap.tnoremap('<Esc>', '<C-\\><C-n>')  -- Exit terminal insert mode with Esc

-- Indentation type toggle (tabs or spaces)
function _G.toggle_indent()
    if vim.o.expandtab then
        vim.opt.expandtab = false
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 0
    else
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 4
        vim.opt.softtabstop = 4
    end
end
keymap.noremap('<leader>i', ':call v:lua.toggle_indent()<CR>')

-- Toggles for the line numbers
keymap.noremap('<leader>n', ':set number!<CR>')
keymap.noremap('<leader>N', ':set relativenumber!<CR>')

-- Vertically aligned jumps
keymap.nnoremap('n', 'nzz')
keymap.nnoremap('N', 'Nzz')
keymap.nnoremap('*', '*zz')
keymap.nnoremap('#', '#zz')
keymap.nnoremap('g*', 'g*zz')
keymap.nnoremap('gd', 'gdzz')
keymap.nnoremap('<C-o>', '<C-o>zz')
keymap.nnoremap('<C-i>', '<C-i>zz')

-- No more entering ex mode by mistake
keymap.nnoremap('Q', '<Nop>')

-- Specific config for some languages
vim.cmd [[autocmd FileType go set noexpandtab]]
vim.cmd [[autocmd FileType rust set textwidth=80]]
vim.cmd [[autocmd FileType python set colorcolumn=80,88]]
vim.cmd [[autocmd FileType js,html,css set shiftwidth=2]]

-- Reexporting the Packer commands from the plugins module
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate  packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync    packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean   packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

require('plugins')                -- Configuring the plugins
require('config.themes.chooser')  -- Configuring the theme
require('config.lsp')             -- Configuring the LSP
