local paths = {
    ['base16-onedark'] = '~/.config/nvim/lua/config/themes/vim-one.lua',
    ['base16-solarized'] = '~/.config/nvim/lua/config/themes/neosolarized.lua',
}
local default_theme = 'base16-onedark'
local lualine_path = '~/.config/nvim/lua/config/lualine.lua'
local theme_file = vim.env["HOME"] .. "/.cache/wal/theme_name"
local mode_file = vim.env["HOME"] .. "/.cache/wal/theme_mode"

local theme_file_exists = vim.fn.filereadable(theme_file) == 0
local mode_file_exists = vim.fn.filereadable(mode_file) == 0
local is_tty = vim.env["DISPLAY"] == nil

local theme_path
if theme_file_exists or mode_file_exists or is_tty then
    print("Warning: no theme set with wal")
    theme_path = default_theme
else
    vim.g.wal_theme = vim.fn.readfile(theme_file)[1]
    vim.g.wal_mode = vim.fn.readfile(mode_file)[1]

    theme_path = paths[vim.g.wal_theme]
    if not theme_path then
        print("Warning: unknown theme set with wal")
        theme_path = paths[default_theme]
    end
end

-- Also refresh the bar
vim.opt.statusline = ''
dofile(vim.fn.expand(lualine_path))

-- Avoid caches
return dofile(vim.fn.expand(theme_path))
