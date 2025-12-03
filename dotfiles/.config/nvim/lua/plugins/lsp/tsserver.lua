local M = {}

M.setup = function(on_attach, capabilities)
  local get_root = function(fname)
    local found = vim.fs.find({
      "package.json",
      "tsconfig.json",
      "jsconfig.json",
      ".git",
    }, { upward = true, path = fname })

    return #found > 0 and vim.fs.dirname(found[1]) or vim.fn.getcwd()
  end

  local bufname = vim.api.nvim_buf_get_name(0)
  local root = get_root(bufname)

  local ts_cmd = root .. "/node_modules/.bin/typescript-language-server"
  if vim.fn.executable(ts_cmd) == 0 then
    ts_cmd = "typescript-language-server"
  end

  local tsserver_config = {
    name = "tsserver",
    cmd = { ts_cmd, "--stdio" },
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
    root_dir = get_root,
  }

  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.name == "tsserver" and client.config.root_dir == root then
      return
    end
  end

  vim.lsp.start(tsserver_config)
end

return M
