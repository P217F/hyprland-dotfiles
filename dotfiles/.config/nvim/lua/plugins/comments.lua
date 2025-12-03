return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("Comment").setup()

    vim.keymap.set("n", "<S-m>", function()
      require("Comment.api").toggle.linewise.current()
    end)

    vim.keymap.set("v", "<S-m>", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "nx", false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end)
  end,
}
