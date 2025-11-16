return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        color_icons = true,
        themeable = true,
        separator_style = "thin",
        show_buffer_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        always_show_bufferline = true,
        persist_buffer_sort = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Nvim-Tree Explorer",
            highlight = "Directory",
            separator = true
          }
        }
      }
    }
    
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "bd", "<cmd>bdelete<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "bdd", "<cmd>bdelete!<CR>", { silent = true, noremap = true })
    for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>")
    end
  end,
}

