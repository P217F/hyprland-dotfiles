return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    map_cr = true,
    map_bs = true,
    enable_check_bracket_line = true,
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
  end,
}

