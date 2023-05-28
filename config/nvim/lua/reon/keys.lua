local map = vim.api.nvim_set_keymap

map('n', 'n', [[:NvimTreeToggle<CR>]], { noremap = true, silent = true })
map('n', 'ff', [[:Telescope find_files]], {})