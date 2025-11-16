return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = false,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "neo-tree",
        "terminal",
        "lazy",
        "mason",
      },
      buftypes = { "terminal" },
    },
  },
}
