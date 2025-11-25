return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },

  opts = {
    sort = { sorter = "case_sensitive" },
    view = { width = 24, float = { enable = false } },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = false,
        },
      },
    },
  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)

    vim.keymap.set("n", "<F4>", "<cmd>NvimTreeToggle<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle NvimTree",
    })
  end,
}
