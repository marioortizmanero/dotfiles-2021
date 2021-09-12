vim.g.onedark_terminal_italics = 1
-- Comments have more constrast
vim.g.onedark_color_overrides = {
    comment_grey = {
        gui = "#757c8a",
        cterm = "59",
        cterm16 = "15"
    },
}

-- Background color is the terminal's
-- vim.cmd [[autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" } })]]

vim.cmd "colorscheme onedark"

vim.lsp.diagnostic.set_underline('LspDiagnosticsUnderlineHint')
