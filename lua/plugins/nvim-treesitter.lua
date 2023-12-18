return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = false, -- automatically install syntax support when entering new file type buffer
    ensure_installed = {
      "lua",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "dockerfile",
      "yaml",
      "make",
      "sql",
      "xml",
      "bash",
      "csv",
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
