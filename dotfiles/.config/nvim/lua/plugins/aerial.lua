return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",

  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter" },
      layout = {
        min_width = 24,
        default_direction = "right",
      },
      show_guides = true,
      icons = {
        Function = "ƒ",
        Class = "𝓒",
        Variable = "",
      },
    })

    vim.keymap.set("n", "<F8>", "<cmd>AerialToggle!<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle Aerial outline",
    })
  end,
}
