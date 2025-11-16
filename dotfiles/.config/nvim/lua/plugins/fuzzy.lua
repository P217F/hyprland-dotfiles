return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        preview = {
          hide_on_startup = false,
        },
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
    local builtin = require("telescope.builtin")
  end,
}

