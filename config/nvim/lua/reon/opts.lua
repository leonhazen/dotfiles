local opt = vim.opt
local g = vim.g

g.t_co = 256
g.background = "dark"

opt.guicursor = ""
opt.cursorline = true
opt.wrap = false

opt.number = true
opt.relativenumber = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.completeopt = "noinsert,menuone,noselect"

opt.mouse = "a"

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.syntax = "on"

opt.titlestring = "%t (%{expand('%:h')}) %m"
opt.title = true

opt.splitright = true
opt.splitbelow = true
