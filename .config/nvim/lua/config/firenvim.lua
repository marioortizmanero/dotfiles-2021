vim.g.firenvim_config = {
    localSettings = {
        ['.*'] = {
            takeover = 'never',
        },
    }
}

if vim.g.started_by_firenvim ~= nil then
    -- Autosave
    vim.cmd [[autocmd TextChanged,TextChangedI * ++nested silent write]]

    -- Font config
    vim.opt.guifont = 'SF_Mono:h10'
end
