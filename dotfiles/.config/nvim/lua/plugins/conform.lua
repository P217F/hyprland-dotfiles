return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  lazy = false,
  opts = {
    formatters_by_ft = {
      python = { "black" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "ConformFormat",
      callback = function()
        vim.notify("✅ Code formatted", vim.log.levels.INFO, { title = "Conform" })
      end,
    })

    vim.keymap.set("n", "<S-f>", function()
        conform.format({
            async = true,
            lsp_fallback = true,
        })
    end, { desc = "Format code (Conform)" })
  end,
}
