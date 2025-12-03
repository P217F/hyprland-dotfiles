return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },

    signcolumn = true,

    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },

  config = function(_, opts)
    local gitsigns = require("gitsigns")
    gitsigns.setup(opts)

    local map = vim.keymap.set
    local function desc(t) return { desc = "Git: " .. t } end

    map("n", "gn", function()
      gitsigns.next_hunk()
      gitsigns.preview_hunk_inline()
    end, desc("Next hunk inline preview"))

    map("n", "gp", function()
      gitsigns.prev_hunk()
      gitsigns.preview_hunk_inline()
    end, desc("Previous hunk inline preview"))

    map("n", ";g", gitsigns.preview_hunk_inline, desc("Preview hunk inline"))
  end,
}
