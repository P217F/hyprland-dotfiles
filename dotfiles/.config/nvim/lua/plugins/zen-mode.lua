return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.90,
      width = 0.95,
      height = 0.95,
      options = {
        signcolumn = "yes",
        number = true,
        relativenumber = false,
        foldcolumn = "0",
        cursorline = false,
        cursorcolumn = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      twilight = { enabled = false },
    },
    on_open = function(win) end,
    on_close = function() end,
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen mode" },
  },
}
