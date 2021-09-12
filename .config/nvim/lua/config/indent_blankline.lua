vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_filetype_exclude = {'', 'help'}
-- May choose between a discontinuous line ('¦') or a full height one ('│')
vim.g.indent_blankline_char = '¦'

vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#757c8a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineCharBlankline guifg=#757c8a gui=nocombine]]
