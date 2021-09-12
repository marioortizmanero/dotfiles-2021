-- This function is required to escape key strings, see
-- https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
local function key(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
  
-- More convenient mapping functions
function map(mode, key, cmd, custom_opts)
    local opts = {silent = true}
    if custom_opts then
        opts = vim.tbl_extend('force', opts, custom_opts)
    end
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end
function bufmap(buf, mode, key, cmd, custom_opts)
    local opts = {silent = true}
    if custom_opts then
        opts = vim.tbl_extend('force', opts, custom_opts)
    end
    vim.api.nvim_buf_set_keymap(buf, mode, key, cmd, opts)
end
function apply_noremap(opts)
    if not opts then
        return opts
    end

    return vim.tbl_extend('force', opts, {noremap = true})
end

local keymap = {
    noremap = function(key, cmd, opts) map('', key, cmd, apply_noremap(opts)) end,
    nnoremap = function(key, cmd, opts) map('n', key, cmd, apply_noremap(opts)) end,
    tnoremap = function(key, cmd, opts) map('t', key, cmd, apply_noremap(opts)) end,
    inoremap = function(key, cmd, opts) map('i', key, cmd, apply_noremap(opts)) end,
}


return {opt = opt, key = key, keymap = keymap, map = map, bufmap = bufmap}
