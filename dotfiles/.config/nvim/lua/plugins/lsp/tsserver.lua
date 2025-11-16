local M = {}

M.setup = function(on_attach, capabilities)
  local tsserver_config = {
    name = "tsserver",
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
    on_attach = on_attach,

    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    root_dir = function(fname)
      local found = vim.fs.find({
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git",
      }, { upward = true, path = fname })

      if #found > 0 then
        return vim.fs.dirname(found[1])
      end

      return vim.fn.getcwd()
    end,
  }

  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, c in ipairs(clients) do
    if c.name == "tsserver" then
      return
    end
  end

  vim.lsp.start(tsserver_config)
end

return M
