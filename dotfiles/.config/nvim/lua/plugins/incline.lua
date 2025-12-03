return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = function()
    local colors = {
      bg_active = "#3c3836",
      fg_active = "#ebdbb2",
      bg_inactive = "#282828",
      fg_inactive = "#a89984",
    }

    require("incline").setup({
      debounce_threshold = { falling = 50, rising = 10 },
      hide = { cursorline = false, focused_win = false, only_win = false },
      highlight = {
        groups = {
          InclineNormal = { default = true, guibg = colors.bg_active, guifg = colors.fg_active, gui = "bold" },
          InclineNormalNC = { default = true, guibg = colors.bg_inactive, guifg = colors.fg_inactive },
        },
      },
      ignore = {
        buftypes = "special",
        filetypes = {},
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special",
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then filename = "[No Name]" end
        if vim.bo[props.buf].modified then filename = "[+] " .. filename end

        local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename)
        if not icon then icon = "" icon_color = colors.fg_active end

        return { { " " .. icon, guifg = icon_color }, { " " }, { filename .. " " } }
      end,
      window = {
        margin = { horizontal = 1, vertical = 1 },
        options = { signcolumn = "no", wrap = false },
        overlap = { borders = true, statusline = false, tabline = false, winbar = false },
        padding = 0,
        padding_char = " ",
        placement = { horizontal = "right", vertical = "top" },
        width = "fit",
        winhighlight = {
          active = { EndOfBuffer = "None", Normal = "InclineNormal", Search = "None" },
          inactive = { EndOfBuffer = "None", Normal = "InclineNormalNC", Search = "None" },
        },
        zindex = 50,
      },
    })
  end,
}
