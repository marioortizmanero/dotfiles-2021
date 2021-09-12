local lspconfig = require('lspconfig')
local keymap = require('config.utils').keymap
local key = require('config.utils').key

-- Function to initialize the LSP config after the buffer is attached
local custom_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require('completion').on_attach()

    -- Mappings, only loaded when necessary.
    function lsp_map(key, cmd)
        local cmd = '<cmd> lua ' .. cmd ..'<CR>'
        local opts = {
            noremap = true,
            silent = true
        }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', key, cmd, opts)
    end
    lsp_map('K',         'vim.lsp.buf.hover()')
    lsp_map('<leader>r', 'vim.lsp.buf.rename()')
    lsp_map('<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
    lsp_map('ga',        'vim.lsp.buf.code_action()')
    lsp_map('gD',        'vim.lsp.buf.declaration()')
    lsp_map('gd',        'vim.lsp.buf.definition()')
    lsp_map('gi',        'vim.lsp.buf.implementation()')
    lsp_map('gr',        'vim.lsp.buf.references()')
    lsp_map('g[',        'vim.lsp.diagnostic.goto_next()')
    lsp_map('g]',        'vim.lsp.diagnostic.goto_prev()')
end

-- All installed LSPs:
-- CSS
lspconfig.cssls.setup{
    on_attach = custom_attach
}
-- Python
lspconfig.pylsp.setup{
    on_attach = custom_attach,
    settings = {
        pyls = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 88
                }
            }
        }
    }
}
-- C, C++
lspconfig.clangd.setup{
    on_attach = custom_attach
}
-- Bash
lspconfig.bashls.setup{
    on_attach = custom_attach
}
-- Go
lspconfig.gopls.setup{
    on_attach = custom_attach
}
-- Rust
lspconfig.rust_analyzer.setup{
    on_attach = custom_attach
}
-- Latex
lspconfig.texlab.setup{
    on_attach = function()
        -- With live reloading
        vim.cmd [[autocmd BufWritePost *.tex :TexlabBuild]]
        custom_attach()
    end,
    settings = {
        texlab = {
            build = {
                executable = "tectonic",
                args = {"-Zshell-escape", "--synctex", "%f"},
            }
        }
    }
}

-- Enable type inlay hints
function _G.inlay_hints()
    require('lsp_extensions').inlay_hints {
        prefix = ' » ',
        highlight = "Comment",
        enabled = {"TypeHint", "ChainingHint", "ParameterHint"}
    }
end
vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :call v:lua.inlay_hints()]]

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noinsert,noselect'

-- Avoid prompting for Enter for one-line messages with completion
vim.opt.shortmess:append('c')

-- Smart autocompletion, manually started with the tab key.
vim.g.completion_enable_auto_popup = 0
function _G.smart_tab_complete()
    -- If the completion window is already visible, iterate the results
    -- starting from the beginning.
    if vim.fn.pumvisible() == 1 then
        return key("<C-N>")
    end

    -- String from the start of the current line to one character right of the
    -- cursor. It's trimmed to ignore spaces as well.
    local line = vim.fn.getline('.')
    local substr = vim.fn.strpart(line, -1, vim.fn.col('.'))
    local substr = vim.fn.trim(substr)

    -- No autocompletion when the string is empty
    if #substr == 0 then
        return key("<tab>")
    end

    -- Applying one of the available autcompletion methods
    if vim.fn.match(substr, '/') ~= -1 then
        -- Integrated file matching
        return key("<C-X><C-F>")
    elseif #vim.lsp.buf_get_clients() > 0 then
        -- Using the running LSP
        return key("<C-X><C-O>")
    else
        -- Integrated basic matching
        return key("<C-X><C-P>")
    end
end
function _G.tab_rotate()
    if vim.fn.pumvisible() == 1 then
        return key("<C-p>")
    else
        return key("<S-Tab>")
    end
end

keymap.inoremap('<tab>', 'v:lua.smart_tab_complete()', {expr = true})
keymap.inoremap('<S-Tab>', 'v:lua.tab_rotate()', {expr = true})
