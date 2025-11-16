return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter" },
      layout = {
        min_width = 22,
        default_direction = "right",
      },
      show_guides = true,
      icons = {
        Function = "ƒ",
        Class = "𝓒",
        Variable = "",
      },
    })
  end,
}

