return {
  "nvim-lualine/lualine.nvim",
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

    local gruvbox_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.fg, bg = colors.grey },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert  = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
      visual  = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = gruvbox_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = {
          "branch",
          { "filename", file_status = true, path = 1, color = { bg = colors.grey }, gui = "bold" },
        },
        lualine_c = { "%=" },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " } },
        },
        lualine_y = {
          { "filetype", color = { bg = colors.grey }, icon_only = false }
        },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
