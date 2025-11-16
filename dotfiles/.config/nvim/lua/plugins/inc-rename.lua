return {
  "smjonas/inc-rename.nvim",
  event = "VeryLazy",
  opts = {
    cmd_name = "IncRename",
    hl_group = "Substitute",
    preview_empty_name = false,
    show_message = true,
    save_in_cmdline_history = true,
    input_buffer_type = nil,
    post_hook = nil,
  },
  config = function(_, opts)
    require("inc_rename").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "IncRenameFinished",
      callback = function(ev)
        vim.notify("✅ Renamed symbol to: " .. ev.data.newName, vim.log.levels.INFO)
      end,
    })
  end,
}
