-- local M = {}
--
-- M.setup = function(on_attach, capabilities)
--   local pyright_config = {
--     name = "pyright",
--     cmd = { "pyright-langserver", "--stdio" },
--     capabilities = capabilities,
--     on_attach = on_attach,
--   }
--
--   local clients = vim.lsp.get_clients({ bufnr = 0 })
--   for _, c in ipairs(clients) do
--     if c.name == "pyright" then return end
--   end
--   vim.lsp.start(pyright_config)
-- end
--
-- return M
--
--
local M = {}

M.setup = function(on_attach, capabilities)
  local pyright_config = {
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    capabilities = capabilities,
    on_attach = on_attach,

    root_dir = function(fname)
      local found = vim.fs.find({ "pyrightconfig.json", ".git" }, { upward = true, path = fname })
      if #found > 0 then
        return vim.fs.dirname(found[1])
      end
      return vim.fn.getcwd()
    end,
  }

  -- tránh khởi động trùng
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, c in ipairs(clients) do
    if c.name == "pyright" then
      return
    end
  end

  vim.lsp.start(pyright_config)
end

return M
