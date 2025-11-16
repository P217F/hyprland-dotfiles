return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto", "rmd" },
  opts = {
    heading = {
      enabled = true,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
    },
    bullet = {
      enabled = true,
      icons = { "•", "◦", "▪" },
    },
    quote = {
      enabled = true,
      icon = "│",
      highlight = "RenderMarkdownQuote",
    },
    code = {
      enabled = true,
      style = "minimal",
    },
    table = {
      enabled = true,
      border = true,
      style = "rounded",
    },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
