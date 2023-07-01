return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    transparent_bg = true,
    colors = {
      selection = "#44475A",
    },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula-soft]])
    end,
  },
  { "EdenEast/nightfox.nvim" },
}
