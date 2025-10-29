
require("lazy").setup({
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  { "neovim/nvim-lspconfig" },

  {
    "folke/tokyonight.nvim", lazy = false, priority = 1000, 
    opts = {},
  },

  require("user.plugins.lualine"),
})
