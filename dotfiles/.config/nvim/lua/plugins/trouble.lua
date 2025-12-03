return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  opts = {
    use_diagnostic_signs = true,
    auto_open = false,
    auto_close = false,
    auto_preview = false,
    auto_fold = false,
  },
  config = function(_, opts)
    require("trouble").setup(opts)
  end,
  keys = {
    { ";x", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
    { ";w", "<cmd>Trouble workspace_diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
    { ";d", "<cmd>Trouble document_diagnostics toggle<CR>", desc = "Document Diagnostics" },
    { ";r", "<cmd>Trouble lsp toggle<CR>", desc = "LSP References" },
    { ";q", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List" },
    { ";l", "<cmd>Trouble loclist toggle<CR>", desc = "Location List" },
  },
}
