return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local colors = {
      blue   = '#80a0ff',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff3021',
      yellow = '#d5ff4d',
      grey   = '#303030',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.yellow },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.red } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { '%=' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    }
  end,
}
