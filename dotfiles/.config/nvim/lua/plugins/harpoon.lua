return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<M-a>", function() require("harpoon.mark").add_file() end },
    { "<M-d>", function() require("harpoon.mark").rm_file() end },
    { "<M-h>", function() require("harpoon.ui").toggle_quick_menu() end },
    { "<M-n>", function() require("harpoon.ui").nav_next() end },
    { "<M-p>", function() require("harpoon.ui").nav_prev() end },
  },
  config = function()
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = false,
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      },
    })
    pcall(function()
      require("telescope").load_extension("harpoon")
    end)
  end,
}
