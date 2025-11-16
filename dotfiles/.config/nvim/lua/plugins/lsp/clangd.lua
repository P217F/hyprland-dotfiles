local M = {}

M.setup = function(on_attach, capabilities)
  local clangd_config = {
    name = "clangd",
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--cross-file-rename",
    },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function(fname)
      local found = vim.fs.find({ ".clangd", "compile_commands.json", ".git" }, { upward = true, path = fname })
      if #found > 0 then
        return vim.fs.dirname(found[1])
      end
      return vim.fn.getcwd()
    end,
  }

  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, c in ipairs(clients) do
    if c.name == "clangd" then return end
  end
  vim.lsp.start(clangd_config)
end

return M
