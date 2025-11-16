return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "slide",
      timeout = 3000,
      background_colour = "#000000",
      fps = 60,
      render = "default",
      max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
      max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "✎",
      },
      top_down = true,
      position = "top_right",
    })

    vim.notify = notify
  end,
}

