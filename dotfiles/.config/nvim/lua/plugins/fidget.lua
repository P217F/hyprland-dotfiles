return {
  "j-hui/fidget.nvim",
  lazy = false,
  event = "VeryLazy",
  config = function()
    require("fidget").setup {
      text = {
        spinner = "dots",
      },
      window = {
        blend = 100,
      },
    }
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FidgetTask", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "Fidget", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FidgetLabel", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FidgetSpinner", { bg = "NONE" })
  end,
}
