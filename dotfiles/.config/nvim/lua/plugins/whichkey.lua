return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        spelling = { enabled = true, suggestions = 20 },
      },
      triggers = { "<leader>" },
      show_help = false,
      win = {
        border = "rounded",
      },
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
