vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 20
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''

-- Startup
reading_stdin = false
function _G.startNERDTree()
    -- Disabled when reading from stdin
    if reading_stdin then
        return
    end

    -- Disabled for firenvim
    if vim.g.started_by_firenvim ~= nil then
        return
    end

    -- Disabled when reading from a file
    local buf = vim.fn.expand('%')
    if buf ~= nil and #buf > 0 and vim.fn.isdirectory(buf) == 0 then
        return
    end

    vim.cmd "NERDTree"
end
vim.cmd "autocmd VimEnter * :silent call v:lua.startNERDTree()"
vim.cmd "autocmd StdinReadPre * :silent lua reading_stdin = true"
