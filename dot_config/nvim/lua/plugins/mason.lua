return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    lazy = false,
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
}
