return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require('cmp')

    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰡱",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "",
      Interface = "",
      Module = "󰕳",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "󰘍",
      Color = "",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>']   = cmp.mapping.confirm({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>']   = cmp.mapping.select_prev_item(),
      }),
      formatting = {
        format = function(entry, item)
          item.kind = (kind_icons[item.kind] or "") .. " " .. item.kind
          return item
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
      })
    })

    -- Setup for command-line mode (":") completion
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'path' },
        { name = 'cmdline' },
      }
    })

    -- Setup for search mode ("/" and "?") completion
    cmp.setup.cmdline({'/', '?'}, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      }
    })
  end,
}
