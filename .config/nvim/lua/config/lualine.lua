function full_filenames()
    return vim.fn.expand('%')
end

function shorter_filenames()
	local name = ""
    local curpath = vim.fn.expand('%')
	local subs = vim.fn.split(curpath, '/') 

    if #subs == 1 then
        return curpath
    end

	for i, s in ipairs(subs) do
		local parent = name
		if i == #subs then
			name = parent .. '/' .. s
		elseif i == 1 then
			name = s
		else
			name = parent .. '/' .. vim.fn.strpart(s, 0, 2)
        end
    end

    return name
end

function get_theme()
    if not vim.g.wal_theme then
        print("Warning: no theme set for lualine to read")
        return nil
    end

    local wal_theme = vim.g.wal_theme:gsub("^base16%-", "")

    if wal_theme == "solarized" then
        return "solarized_" .. vim.g.wal_mode
    end

    if wal_theme == "onedark" then
        if vim.g.wal_mode == "light" then
            return "onelight"
        else
            return "onedark"
        end
    end

    return wal_theme
end

local config = {
    options = {
        section_separators = '',
        component_separators = '',
        theme = get_theme(),
    },
    sections = {
        -- The filename can be configured. By default it's the current node.
        -- lualine_c = {shorter_filenames}
        lualine_c = {full_filenames},
    },
    extensions = {
        -- 'nvim-tree',
        'nerdtree',
    }
}

-- Simpler interface for firenvim
if vim.g.started_by_firenvim then
    override = {
        options = {
            icons_enabled = false,
        }
    }

    config = vim.tbl_deep_extend('force', config, override)
end

require('lualine').setup(config)
