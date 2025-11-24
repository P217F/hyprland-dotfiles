return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        preview = { hide_on_startup = false },
        file_ignore_patterns = { "node_modules", ".git/" },
      },

      pickers = {
        find_files = {
          hidden = true,
          previewer = true,
        },
        live_grep = {
          previewer = true,
        },
        buffers = {
          previewer = true,
        },
      },
    })

    vim.keymap.set("n", "<F1>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<F2>", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<F3>", builtin.oldfiles, { desc = "Oldfiles" })
  end,
}
