return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      local on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      end

      local clangd = require("plugins.lsp.clangd")
      local pyright = require("plugins.lsp.pyright")
      local tsserver = require("plugins.lsp.tsserver")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "h", "objc", "objcpp", "hpp" },
        callback = function()
          clangd.setup(on_attach, capabilities)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          pyright.setup(on_attach, capabilities)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        callback = function()
          tsserver.setup(on_attach, capabilities)
      end,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "rounded" })
        end,
      })

      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
