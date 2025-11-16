local M = {}

M.setup = function(on_attach, capabilities)
  local pyright_config = {
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    capabilities = capabilities,
    on_attach = on_attach,
  }

  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, c in ipairs(clients) do
    if c.name == "pyright" then return end
  end
  vim.lsp.start(pyright_config)
end

return M
