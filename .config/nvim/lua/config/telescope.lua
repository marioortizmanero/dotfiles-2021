local keymap = require('config.utils').keymap
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    -- Bindings like NERDTree
    mappings = {
      i = {
        ["<C-t>"] = actions.select_tab,
        ["<C-s>"] = actions.select_vertical,
        ["<C-i>"] = actions.select_horizontal,
      },
    },
  }
}

-- Accessing its functions easily
keymap.noremap('<leader>ff', ':Telescope find_files<CR>')
keymap.noremap('<leader>fl', ':Telescope live_grep<CR>')
keymap.noremap('<leader>fL', ':Telescope current_buffer_fuzzy_find<CR>')
keymap.noremap('<leader>fb', ':Telescope buffers<CR>')
keymap.noremap('<leader>fg', ':Telescope git_status<CR>')
