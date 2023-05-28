-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","
vim.g.localleader = "\\"

vim.loader.enable()

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
})

require("nvim-treesitter.configs").setup({
    ensure_installed = {"bash", "css", "go", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
                        "python", "regex", "sql", "terraform", "toml", "vim", "yaml"},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true,
        filetypes = {"html", "javascript", "javascriptreact", "svelte", "typescript", "typescriptreact", "vue", "xml"}
    }
})

require("lualine").setup({
    options = {
        theme = "dracula",
        section_separators = "",
        component_separators = ""
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    }
})

require("bufferline").setup()

require("nvim-autopairs").setup({
    disable_filetype = {"TelescopePrompt"}
})

require("reon.opts") -- options
require("reon.keys") -- keybindings
require("reon.plugs") -- plugins
