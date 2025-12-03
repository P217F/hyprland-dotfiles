return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    local colors = {
      bg     = "#282828",
      fg     = "#ebdbb2",
      grey   = "#3c3836",
      blue   = "#458588",
      green  = "#98971a",
      yellow = "#d79921",
      red    = "#cc241d",
    }

    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        color_icons = true,
        themeable = true,
        separator_style = "thin",
        show_buffer_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        always_show_bufferline = true,
        persist_buffer_sort = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Nvim-Tree Explorer",
            highlight = "Directory",
            separator = true
          }
        },
        highlights = {
          fill = { bg = colors.bg, fg = colors.fg },
          background = { bg = colors.bg, fg = colors.fg },
          buffer_selected = { bg = colors.grey, fg = colors.fg, bold = true },
          buffer_visible = { bg = colors.bg, fg = colors.fg },
          buffer = { bg = colors.bg, fg = colors.fg },
          close_button = { bg = colors.bg, fg = colors.fg },
          close_button_visible = { bg = colors.bg, fg = colors.fg },
          close_button_selected = { bg = colors.grey, fg = colors.fg },
          tab_selected = { bg = colors.grey, fg = colors.fg },
          tab = { bg = colors.bg, fg = colors.fg },
          tab_close = { bg = colors.bg, fg = colors.fg },
          separator = { bg = colors.bg, fg = colors.bg },
          separator_selected = { bg = colors.grey, fg = colors.grey },
          separator_visible = { bg = colors.bg, fg = colors.bg },
          indicator_selected = { bg = colors.grey, fg = colors.green },
        },
      }
    }

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "bd", "<cmd>bdelete<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "bdd", "<cmd>bdelete!<CR>", { silent = true, noremap = true })
  end,
}
