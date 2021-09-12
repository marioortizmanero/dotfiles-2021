" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/mario/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/mario/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/mario/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/mario/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mario/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  NeoSolarized = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/NeoSolarized"
  },
  ["adoc-pdf-live.nvim"] = {
    config = { "require('config.adoc_pdf_live')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/adoc-pdf-live.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  firenvim = {
    config = { "require('config.firenvim')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config.indent_blankline')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  nerdcommenter = {
    config = { "require('config.nerdcommenter')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    config = { "require('config.nerdtree')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config.colorizer')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('config.telescope')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    config = { "require('config.tex_conceal')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ["vim-asciidoctor"] = {
    config = { "require('config.asciidoctor')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-asciidoctor"
  },
  ["vim-fugitive"] = {
    config = { "require('config.fugitive')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-one"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  vimtex = {
    config = { "require('config.vimtex')" },
    loaded = true,
    path = "/home/mario/.local/share/nvim/site/pack/packer/start/vimtex"
  }
}

time("Defining packer_plugins", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
require('config.telescope')
time("Config for telescope.nvim", false)
-- Config for: adoc-pdf-live.nvim
time("Config for adoc-pdf-live.nvim", true)
require('config.adoc_pdf_live')
time("Config for adoc-pdf-live.nvim", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
require('config.colorizer')
time("Config for nvim-colorizer.lua", false)
-- Config for: nerdcommenter
time("Config for nerdcommenter", true)
require('config.nerdcommenter')
time("Config for nerdcommenter", false)
-- Config for: nerdtree
time("Config for nerdtree", true)
require('config.nerdtree')
time("Config for nerdtree", false)
-- Config for: tex-conceal.vim
time("Config for tex-conceal.vim", true)
require('config.tex_conceal')
time("Config for tex-conceal.vim", false)
-- Config for: vimtex
time("Config for vimtex", true)
require('config.vimtex')
time("Config for vimtex", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
require('config.fugitive')
time("Config for vim-fugitive", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
require('config.gitsigns')
time("Config for gitsigns.nvim", false)
-- Config for: vim-asciidoctor
time("Config for vim-asciidoctor", true)
require('config.asciidoctor')
time("Config for vim-asciidoctor", false)
-- Config for: firenvim
time("Config for firenvim", true)
require('config.firenvim')
time("Config for firenvim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
require('config.indent_blankline')
time("Config for indent-blankline.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
