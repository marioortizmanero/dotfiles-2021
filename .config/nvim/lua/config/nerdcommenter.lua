local keymap = require('config.utils').keymap

vim.g.NERDSpaceDelims = 1
vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDCustomDelimiters = {
    c = {
       left = '//'
    },
    python = {
       left = '#'
    }
}
vim.g.NERDDefaultAlign = 'left'
keymap.noremap('<leader>c', ':call nerdcommenter#Comment(0, "Toggle")<CR>')
